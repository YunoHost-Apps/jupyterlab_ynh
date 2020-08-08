# JupyterLab pour YunoHost

[![Integration level](https://dash.yunohost.org/integration/jupyterlab.svg)](https://dash.yunohost.org/appci/app/jupyterlab) ![](https://ci-apps.yunohost.org/ci/badges/jupyterlab.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/jupyterlab.maintain.svg)  
[![Installer JupyterLab avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=jupyterlab)

*[Read this readme in english.](./README.md)* 

> *Ce package vous permet d’installer JupyterLab rapidement et simplement sur un serveur YunoHost.  
Si vous n’avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble
JupyterLab est une interface utilisateur de nouvelle génération pour le projet Jupyter offrant tous les modules de Jupyter Notebook (interpréteur Python, terminal, éditeur de texte, navigateur de fichiers, etc.) dans une interface utilisateur flexible et puissante. JupyterLab remplacera à terme Jupyter Notebook.

**Version incluse :** 2.2.4

## Captures d’écran

![](https://raw.githubusercontent.com/jupyterlab/jupyterlab/3e3a2c9e295703ff6d441589423e284cc6d5c245/docs/source/images/jupyterlab.png)

## Démo

* [Démo sur Binder](https://mybinder.org/v2/gh/jupyterlab/jupyterlab-demo/master?urlpath=lab/tree/demo)

## Configuration

Comment configurer cette application : via le panneau d'administration, un fichier brut en SSH.

## Documentation

* Documentation officielle : [Lien vers la documentation officielle de cette application](https://jupyterlab.readthedocs.io/en/stable/)

## Caractéristiques spécifiques YunoHost

#### Support multi-utilisateurs

* L’authentification LDAP est-elle prise en charge ? **Oui**
* L’application peut-elle être utilisée par plusieurs utilisateurs ? **Oui**

#### Architectures supportées

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/jupyterlab%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/jupyterlab/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/jupyterlab%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/jupyterlab/)

## Liens

* Signaler un bug : https://github.com/YunoHost-Apps/jupyterlab_ynh/issues
* Site de l’application : https://jupyter.org
* Dépôt de l’application principale : https://github.com/jupyterhub/jupyterhub
* Site web YunoHost : https://yunohost.org/

---

Informations pour les développeurs
----------------

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
ou
sudo yunohost app upgrade jupyterlab -u https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
```
