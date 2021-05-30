#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="python3-dev python3-pip libffi-dev libzmq3-dev"

nodejs_version="15"

jupyterlab_version="3.0.14"

#=================================================
# PERSONAL HELPERS
#=================================================

function python_setup {
	set_permissions
	
	pushd "$final_path"
		sudo -u $app PIPENV_VENV_IN_PROJECT="enabled" PIPENV_SKIP_LOCK=true python3 -m pipenv install jupyterlab==$jupyterlab_version jupyterhub notebook jupyterhub-ldapauthenticator pyzmq sudospawner --three 2>&1
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
	path=${path_url%/}

	ynh_add_config --template="jupyterhub_config.py" --destination="$final_path/config/jupyterhub_config.py"
	ynh_add_config --template="jupyter_notebook_config.py" --destination="$final_path/config/jupyter_notebook_config.py"

	ynh_add_config --template="app-sudoers" --destination="/etc/sudoers.d/$app-sudoers"

	set_config_permissions
}

function set_config_permissions {
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
