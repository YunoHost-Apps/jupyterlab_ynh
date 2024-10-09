#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

nodejs_version="20"

#=================================================
# PERSONAL HELPERS
#=================================================

#jupyterlab_upstream_version() {
#    upstream_repository=$(ynh_read_manifest --manifest_key='upstream.code')
#    upstream_url=$(ynh_read_manifest --manifest_key='resources.sources.main.url')
#    upstream_commit=$(echo "$upstream_url" | sed -e "s|^${upstream_repository}/archive/refs/tags/\(.*\)\.tar\.gz|\1|")
#    echo "$upstream_commit"
#}
