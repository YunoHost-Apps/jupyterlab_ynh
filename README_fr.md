# JupyterLab pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/jupyterlab.svg)](https://dash.yunohost.org/appci/app/jupyterlab) ![](https://ci-apps.yunohost.org/ci/badges/jupyterlab.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/jupyterlab.maintain.svg)  
[![Installer JupyterLab avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=jupyterlab)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer JupyterLab rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

Console de code pour exécuter du code Python de manière interactive

**Version incluse :** 3.1.2~ynh1

**Démo :** https://mybinder.org/v2/gh/jupyterlab/jupyterlab-demo/master?urlpath=lab/tree/demo

## Captures d'écran

![](./doc/screenshots/jupyterlab.png)

## Documentations et ressources

* Site officiel de l'app : https://example.com
* Documentation officielle utilisateur : https://yunohost.org/en/app_jupyterlab
* Documentation officielle de l'admin : https://jupyterlab.readthedocs.io/en/stable/
* Dépôt de code officiel de l'app : https://github.com/jupyterhub/jupyterhub
* Documentation YunoHost pour cette app : https://yunohost.org/app_jupyterlab
* Signaler un bug : https://github.com/YunoHost-Apps/jupyterlab_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
ou
sudo yunohost app upgrade jupyterlab -u https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps