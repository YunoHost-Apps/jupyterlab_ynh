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
	miniconda_architecture="x86_64"
elif [ -n "$(uname -m | grep 86)" ]; then
	miniconda_architecture="x86"
elif [ -n "$(uname -m | grep arm)" ]; then
	miniconda_architecture="armv7l"
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
	ynh_replace_string "__FINAL_PATH__" "$final_path" $jupyterlab_conf_path
	ynh_replace_string "__ADMIN__" "$admin" $jupyterlab_conf_path

    ynh_store_file_checksum $jupyterlab_conf_path
}

config_jupyter_notebook() {
	jupyter_notebook_conf_path="$final_path/etc/jupyter/jupyter_notebook_config.py"

    ynh_backup_if_checksum_is_different $jupyter_notebook_conf_path

	# Jupyter notebook configuration
	cp -f ../conf/jupyter_notebook_config.py $jupyter_notebook_conf_path

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
# REMOVE THE CONFIGURATION FILE FOR GITLAB
#=================================================
remove_config_jupyterlab() {
	ynh_secure_remove "$config_path/jupyterhub_config.py"
}
