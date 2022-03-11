<!--
N.B.: This README was automatically generated by https://github.com/YunoHost/apps/tree/master/tools/README-generator
It shall NOT be edited by hand.
-->

# JupyterLab for YunoHost

[![Integration level](https://dash.yunohost.org/integration/jupyterlab.svg)](https://dash.yunohost.org/appci/app/jupyterlab) ![](https://ci-apps.yunohost.org/ci/badges/jupyterlab.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/jupyterlab.maintain.svg)  
[![Install JupyterLab with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=jupyterlab)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install JupyterLab quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview

JupyterLab is the next-generation user interface for Project Jupyter offering all the familiar building blocks of the classic Jupyter Notebook (notebook, terminal, text editor, file browser, rich outputs, etc.) in a flexible and powerful user interface. JupyterLab will eventually replace the classic Jupyter Notebook.

**Shipped version:** 4.0.0~ynh3



## Screenshots

![](./doc/screenshots/jupyterlab.png)

## Documentation and resources

* Official app website: https://jupyter.org
* Official admin documentation: https://jupyterlab.readthedocs.io/en/stable/
* Upstream app code repository: https://github.com/jupyterhub/jupyterhub
* YunoHost documentation for this app: https://yunohost.org/app_jupyterlab
* Report a bug: https://github.com/YunoHost-Apps/jupyterlab_ynh/issues

## Developer info

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
or
sudo yunohost app upgrade jupyterlab -u https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
```

**More info regarding app packaging:** https://yunohost.org/packaging_apps