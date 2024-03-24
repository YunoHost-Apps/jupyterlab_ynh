<!--
Nota bene : ce README est automatiquement généré par https://github.com/YunoHost/apps/tree/master/tools/readme_generator
Il ne doit pas être modifié à la main.
-->

# JupyterLab pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/jupyterlab.svg)](https://dash.yunohost.org/appci/app/jupyterlab) ![Status du fonctionnement](https://ci-apps.yunohost.org/ci/badges/jupyterlab.status.svg) ![Statut demaintenance](https://ci-apps.yunohost.org/ci/badges/jupyterlab.maintain.svg)

[![Installer JupyterLab avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=jupyterlab)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer JupyterLab rapidement et simplement sur un serveur YunoHost.
Si vous n’avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l’installer et en profiter.*

## Vue d'ensemble

JupyterLab is the next-generation user interface for Project Jupyter offering all the familiar building blocks of the classic Jupyter Notebook (notebook, terminal, text editor, file browser, rich outputs, etc.) in a flexible and powerful user interface. JupyterLab will eventually replace the classic Jupyter Notebook.

**Version incluse :** 4.1.1~ynh1

**Démo:** <https://mybinder.org/v2/gh/jupyterlab/jupyterlab-demo/master?urlpath=lab/tree/demo>

## Captures d'écran

![Capture d'écran de JupyterLab](./doc/screenshots/jupyterlab.png)

## Documentations et ressources

- Site officiel de l’app : <https://jupyter.org>
- Documentation officielle de l'admin : <https://jupyterlab.readthedocs.io/en/stable/>
- Dépôt de code officiel de l’app : <https://github.com/jupyterhub/jupyterhub>
- YunoHost Store : <https://apps.yunohost.org/app/jupyterlab>
- Signaler un bug : <https://github.com/YunoHost-Apps/jupyterlab_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche branch](https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing),


Pour essayer la branche testing, procédez comme suit.

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
or
sudo yunohost app upgrade jupyterlab -u https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** <https://yunohost.org/packaging_apps>
