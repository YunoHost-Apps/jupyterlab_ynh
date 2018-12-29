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
# CONFIGURATION FILE FOR JUPYTERLAB
#=================================================
config_jupyterlab() {
    create_dir

	jupyterlab_conf_path="$config_path/jupyterhub_config.py"

    ynh_backup_if_checksum_is_different $jupyterlab_conf_path

	# Gitlab configuration
	cp -f ../conf/jupyterhub_config.py $jupyterlab_conf_path

	ynh_replace_string "__URL__" "https://$domain" $jupyterlab_conf_path
	ynh_replace_string "__PATH__" "${path_url%/}" $jupyterlab_conf_path
	ynh_replace_string "__PORT__" "$port" $jupyterlab_conf_path
	ynh_replace_string "__FINAL_PATH__" "$final_path" $jupyterlab_conf_path

    ynh_store_file_checksum $jupyterlab_conf_path
}

#=================================================
# REMOVE THE CONFIGURATION FILE FOR GITLAB
#=================================================
remove_config_jupyterlab() {
	ynh_secure_remove "$config_path/jupyterhub_config.py"
}
