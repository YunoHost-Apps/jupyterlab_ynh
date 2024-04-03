<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# JupyterLab YunoHost-erako

[![Integrazio maila](https://dash.yunohost.org/integration/jupyterlab.svg)](https://dash.yunohost.org/appci/app/jupyterlab) ![Funtzionamendu egoera](https://ci-apps.yunohost.org/ci/badges/jupyterlab.status.svg) ![Mantentze egoera](https://ci-apps.yunohost.org/ci/badges/jupyterlab.maintain.svg)

[![Instalatu JupyterLab YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=jupyterlab)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek JupyterLab YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

JupyterLab is the next-generation user interface for Project Jupyter offering all the familiar building blocks of the classic Jupyter Notebook (notebook, terminal, text editor, file browser, rich outputs, etc.) in a flexible and powerful user interface. JupyterLab will eventually replace the classic Jupyter Notebook.


**Paketatutako bertsioa:** 4.1.4~ynh1

**Demoa:** <https://mybinder.org/v2/gh/jupyterlab/jupyterlab-demo/master?urlpath=lab/tree/demo>

## Pantaila-argazkiak

![JupyterLab(r)en pantaila-argazkia](./doc/screenshots/jupyterlab.png)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://jupyter.org>
- Administratzaileen dokumentazio ofiziala: <https://jupyterlab.readthedocs.io/en/stable/>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/jupyterhub/jupyterhub>
- YunoHost Denda: <https://apps.yunohost.org/app/jupyterlab>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/jupyterlab_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
edo
sudo yunohost app upgrade jupyterlab -u https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
