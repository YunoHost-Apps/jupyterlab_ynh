<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# JupyterLab untuk YunoHost

[![Tingkat integrasi](https://dash.yunohost.org/integration/jupyterlab.svg)](https://ci-apps.yunohost.org/ci/apps/jupyterlab/) ![Status kerja](https://ci-apps.yunohost.org/ci/badges/jupyterlab.status.svg) ![Status pemeliharaan](https://ci-apps.yunohost.org/ci/badges/jupyterlab.maintain.svg)

[![Pasang JupyterLab dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=jupyterlab)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang JupyterLab secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

JupyterLab is the next-generation user interface for Project Jupyter offering all the familiar building blocks of the classic Jupyter Notebook (notebook, terminal, text editor, file browser, rich outputs, etc.) in a flexible and powerful user interface. JupyterLab will eventually replace the classic Jupyter Notebook.


**Versi terkirim:** 4.2.5~ynh1

**Demo:** <https://mybinder.org/v2/gh/jupyterlab/jupyterlab-demo/master?urlpath=lab/tree/demo>

## Tangkapan Layar

![Tangkapan Layar pada JupyterLab](./doc/screenshots/jupyterlab.png)

## Dokumentasi dan sumber daya

- Website aplikasi resmi: <https://jupyter.org>
- Dokumentasi admin resmi: <https://jupyterlab.readthedocs.io/en/stable/>
- Depot kode aplikasi hulu: <https://github.com/jupyterhub/jupyterhub>
- Gudang YunoHost: <https://apps.yunohost.org/app/jupyterlab>
- Laporkan bug: <https://github.com/YunoHost-Apps/jupyterlab_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
atau
sudo yunohost app upgrade jupyterlab -u https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
