#=================================================
# SET ALL CONSTANTS
#=================================================

app=$YNH_APP_INSTANCE_NAME
config_path="/etc/$app"
final_path="/opt/$app"

#=================================================
# DETECT THE SYSTEM ARCHITECTURE
#=================================================
# Detect the system architecture to download the right file
# NOTE: `uname -m` is more accurate and universal than `arch`
# See https://en.wikipedia.org/wiki/Uname
if [ -n "$(uname -m | grep 64)" ]; then
	miniconda_architecture="x86-64"
elif [ -n "$(uname -m | grep 86)" ]; then
	miniconda_architecture="x86"
elif [ -n "$(uname -m | grep arm)" ]; then
	miniconda_architecture="arm"
else
	ynh_die "Unable to detect your achitecture, please open a bug describing \
		your hardware and the result of the command \"uname -m\"." 1
fi

#=================================================
# CREATE FOLDERS
#=================================================
create_dir() {
	mkdir -p "$config_path"
}

#=================================================
# CONFIGURATION FILES FOR JUPYTERLAB
#=================================================
config_jupyterlab() {
	create_dir

	jupyterlab_conf_path="$config_path/jupyterhub_config.py"

	ynh_backup_if_checksum_is_different $jupyterlab_conf_path

	# JupyterLab configuration
	cp -f ../conf/jupyterhub_config.py $jupyterlab_conf_path

	ynh_replace_string "__URL__" "https://$domain" $jupyterlab_conf_path
	ynh_replace_string "__PATH__" "${path_url%/}" $jupyterlab_conf_path
	ynh_replace_string "__PORT__" "$port" $jupyterlab_conf_path
	ynh_replace_string "__PORT_HUB__" "$port_hub" $jupyterlab_conf_path
	ynh_replace_string "__PORT_HTTP_PROXY__" "$port_http_proxy" $jupyterlab_conf_path
	ynh_replace_string "__FINAL_PATH__" "$final_path" $jupyterlab_conf_path
	ynh_replace_string "__ADMIN__" "$admin" $jupyterlab_conf_path

	ynh_store_file_checksum $jupyterlab_conf_path
}

config_jupyter_notebook() {
	jupyter_notebook_conf_path="$final_path/etc/jupyter/jupyter_notebook_config.py"

	ynh_backup_if_checksum_is_different $jupyter_notebook_conf_path

	# Jupyter notebook configuration
	cp -f ../conf/jupyter_notebook_config.py $jupyter_notebook_conf_path

	ynh_replace_string "__ENABLE_TERMINAL__" "$enable_terminal" $jupyter_notebook_conf_path

	ynh_store_file_checksum $jupyter_notebook_conf_path
}

#=================================================
# CREATE A DEDICATED SYSTEMD CONFIG
#=================================================
add_systemd_config () {
	sudo cp ../conf/systemd.service.default ../conf/systemd.service
	tempsystemdconf="../conf/systemd.service"

	if test -n "${config_path:-}"; then
		ynh_replace_string "__CONFIGPATH__" "$config_path" "$tempsystemdconf"
	fi

	ynh_add_systemd_config
}

#=================================================
# REMOVE THE CONFIGURATION FILE FOR JUPYTERLAB
#=================================================
remove_config_jupyterlab() {
	ynh_secure_remove "$config_path/jupyterhub_config.py"
}

#=================================================
# UPDATE SOURCES FILES
#=================================================
update_src_version() {
	source ./upgrade.d/upgrade.sh
	cp ../conf/arm.src.default ../conf/arm.src
	ynh_replace_string "__VERSION__" "$berryconda3_version" "../conf/arm.src"
	ynh_replace_string "__MD5_SUM__" "$berryconda3_arm_source_md5" "../conf/arm.src"

	cp ../conf/x86-64.src.default ../conf/x86-64.src
	ynh_replace_string "__VERSION__" "$miniconda3_version" "../conf/x86-64.src"
	ynh_replace_string "__MD5_SUM__" "$miniconda3_x86_64_source_md5" "../conf/x86-64.src"

	cp ../conf/x86.src.default ../conf/x86.src
	ynh_replace_string "__VERSION__" "$miniconda3_version" "../conf/x86.src"
	ynh_replace_string "__MD5_SUM__" "$miniconda3_x86_source_md5" "../conf/x86.src"
}

#=================================================
# INSTALL JUPYTERLAB
#=================================================
# This function is inspired by the ynh_setup_source function, adapted to deal with .sh files
setup_source() {
	local src_id=${1:-app} # If the argument is not given, source_id equals "app"

	update_src_version # Update source file

	# Load value from configuration file (see above for a small doc about this file
	# format)
	local src_url=$(grep 'SOURCE_URL=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)
	local src_sum=$(grep 'SOURCE_SUM=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)
	local src_sumprg=$(grep 'SOURCE_SUM_PRG=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)
	local src_format=$(grep 'SOURCE_FORMAT=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)
	local src_extract=$(grep 'SOURCE_EXTRACT=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)
	local src_in_subdir=$(grep 'SOURCE_IN_SUBDIR=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)
	local src_filename=$(grep 'SOURCE_FILENAME=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)

	# Default value
	src_sumprg=${src_sumprg:-sha256sum}
	src_in_subdir=${src_in_subdir:-true}
	src_format=${src_format:-tar.gz}
	src_format=$(echo "$src_format" | tr '[:upper:]' '[:lower:]')
	src_extract=${src_extract:-true}
	if [ "$src_filename" = "" ] ; then
		src_filename="${src_id}.${src_format}"
	fi

	if ! test -e "$final_path"
	then

		local local_src="/opt/yunohost-apps-src/${YNH_APP_ID}/${src_filename}"

		if test -e "$local_src"
		then	# Use the local source file if it is present
			cp $local_src $src_filename
		else	# If not, download the source
			local out=`wget -nv -O $src_filename $src_url 2>&1` || ynh_print_err $out
		fi

		# Check the control sum
		echo "${src_sum} ${src_filename}" | ${src_sumprg} -c --status \
			|| ynh_die "Corrupt source"

		bash $src_filename -b -p $final_path
	fi
	
	export "PATH=$final_path/bin/:$PATH"

	if [ "$src_id" = "arm" ]
	then
		conda install jupyterlab=$jupyterlab_version notebook nodejs -y
		pip install jupyterhub jupyterhub-ldapauthenticator
	else
		conda install -c conda-forge jupyterlab=$jupyterlab_version jupyterhub notebook jupyterhub-ldapauthenticator nodejs -y
	fi

	npm install -g configurable-http-proxy
}