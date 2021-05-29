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
	pushd "$final_path"
		sudo -u $app PIPENV_VENV_IN_PROJECT="enabled" PIPENV_SKIP_LOCK=true  python3 -m pipenv install jupyterlab==$jupyterlab_version jupyterhub notebook jupyterhub-ldapauthenticator pyzmq --three 2>&1
		sudo -u $app python3 -m pipenv run jupyterhub upgrade-db 2>&1
	popd
}

function set_permissions {
	# Set permissions to app files
	chown -R root:$app "$final_path"
	chown -R $app:$app "$final_path/.venv"
	chmod -R g=u,g-w,o-rwx "$final_path"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
