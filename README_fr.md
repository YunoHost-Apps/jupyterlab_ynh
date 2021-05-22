# JupyterLab pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/jupyterlab.svg)](https://dash.yunohost.org/appci/app/jupyterlab) ![](https://ci-apps.yunohost.org/ci/badges/jupyterlab.status.svg)  ![](https://ci-apps.yunohost.org/ci/badges/jupyterlab.maintain.svg)
[![Installer jupyterlab avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=jupyterlab)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install jupyterlab quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Vue d'ensemble

Console de code pour exécuter du code Python de manière interactive.

**Version incluse:** 3.0.16~ynh1

**Démo:** https://mybinder.org/v2/gh/jupyterlab/jupyterlab-demo/master?urlpath=lab/tree/demo


## Captures d'écran


   ![](./doc/screenshots/jupyterlab.png)




## Avertissements / informations importantes

## Configuration

Comment configurer cette application : via le panneau d'administration, un fichier brut en SSH.



## Documentations et ressources

* Site official de l'app : https://jupyter.org
* Documentation officielle utilisateur: https://yunohost.org/en/app_jupyterlab
* Documentation officielle de l'admin: https://jupyterlab.readthedocs.io/en/stable/
* Dépôt de code officiel de l'app:  https://github.com/jupyterhub/jupyterhub
* Documentation YunoHost pour cette app: https://yunohost.org/app_jupyterlab
* Signaler un bug: https://github.com/YunoHost-Apps/jupyterlab_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
or
sudo yunohost app upgrade jupyterlab -u https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications:** https://yunohost.org/packaging_apps