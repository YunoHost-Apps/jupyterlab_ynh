#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="python3-dev python3-pip libffi-dev libzmq3-dev"

nodejs_version="15"

jupyterlab_version="3.0.16"

#=================================================
# PERSONAL HELPERS
#=================================================

function load_settings {
	app=$YNH_APP_INSTANCE_NAME

	domain="$(ynh_app_setting_get --app=$app --key=domain)"
	path_url="$(ynh_app_setting_get --app=$app --key=path)"
	admin="$(ynh_app_setting_get --app=$app --key=admin)"
	final_path="$(ynh_app_setting_get --app=$app --key=final_path)"
	port="$(ynh_app_setting_get --app=$app --key=port)"
	port_hub="$(ynh_app_setting_get --app=$app --key=port_hub)"
	port_http_proxy="$(ynh_app_setting_get --app=$app --key=port_http_proxy)"
	enable_terminal="$(ynh_app_setting_get --app=$app --key=enable_terminal)"
	enable_extensions="$(ynh_app_setting_get --app=$app --key=enable_extensions)"
}

function python_setup {
	set_permissions
	
	pushd "$final_path"
		sudo -u $app PIPENV_VENV_IN_PROJECT="enabled" PIPENV_SKIP_LOCK=true python3 -m pipenv install jupyterlab==$jupyterlab_version jupyterhub notebook jupyter-server jupyterhub-ldapauthenticator pyzmq sudospawner --three 2>&1
		sudo -u $app python3 -m pipenv run jupyterhub upgrade-db 2>&1
	popd
}

function set_permissions {
	# Set permissions to app files
	mkdir -p "$final_path/.venv"

	chown -R $app:$app "$final_path"
	chmod -R g=u,g-w,o-rwx "$final_path"

	setfacl -nR -m g:$app.main:rx -m d:g:$app.main:rx "$final_path/.venv"
	setfacl -n -m g:$app.main:x "$final_path"
}

function add_configs {
	mkdir -p "$final_path/config"
	path="${path_url%/}"

	ynh_add_config --template="jupyterhub_config.py" --destination="$final_path/config/jupyterhub_config.py"
	ynh_add_config --template="jupyter_server_config.py" --destination="$final_path/config/jupyter_server_config.py"

	ynh_add_config --template="app-sudoers" --destination="/etc/sudoers.d/$app-sudoers"
	ynh_add_config --template="sudospawner-singleuser" --destination="$final_path/.venv/bin/sudospawner-singleuser"


	set_config_permissions
}

function build_local_labs {
	ynh_use_nodejs
	for user in $(ynh_user_list); do
		local JUPYTERLAB_DIR="$(getent passwd $user | cut -d: -f6)/.local/share/$app/lab"
		local node_path="$nodejs_path:$(sudo -u $user sh -c 'echo $PATH')"
		sudo -u $user env "PATH=$node_path" "$final_path/.venv/bin/jupyter" lab build --app-dir="$JUPYTERLAB_DIR"
	done
}

function set_config_permissions {
	chmod 550 "$final_path/.venv/bin/sudospawner-singleuser"
	set_permissions
	chown root:root /etc/sudoers.d/$app-sudoers
	chmod 440 /etc/sudoers.d/$app-sudoers
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
