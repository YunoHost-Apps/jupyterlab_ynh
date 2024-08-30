#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

nodejs_version="18"

jupyterlab_upstream_version() {
    upstream_repository=$(ynh_read_manifest
    upstream_url=$(ynh_read_manifest
    upstream_commit=$(echo "$upstream_url" | sed -e "s|^${upstream_repository}/archive/refs/tags/\(.*\)\.tar\.gz|\1|")
    echo "$upstream_commit"
}
