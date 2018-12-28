#=================================================
# SET ALL CONSTANTS
#=================================================

app=$YNH_APP_INSTANCE_NAME
config_path="/etc/$app"
final_path="/opt/$app"

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
