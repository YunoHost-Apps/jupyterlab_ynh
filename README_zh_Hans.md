<!--
注意：此 README 由 <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> 自动生成
请勿手动编辑。
-->

# YunoHost 上的 JupyterLab

[![集成程度](https://dash.yunohost.org/integration/jupyterlab.svg)](https://ci-apps.yunohost.org/ci/apps/jupyterlab/) ![工作状态](https://ci-apps.yunohost.org/ci/badges/jupyterlab.status.svg) ![维护状态](https://ci-apps.yunohost.org/ci/badges/jupyterlab.maintain.svg)

[![使用 YunoHost 安装 JupyterLab](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=jupyterlab)

*[阅读此 README 的其它语言版本。](./ALL_README.md)*

> *通过此软件包，您可以在 YunoHost 服务器上快速、简单地安装 JupyterLab。*  
> *如果您还没有 YunoHost，请参阅[指南](https://yunohost.org/install)了解如何安装它。*

## 概况

JupyterLab is the next-generation user interface for Project Jupyter offering all the familiar building blocks of the classic Jupyter Notebook (notebook, terminal, text editor, file browser, rich outputs, etc.) in a flexible and powerful user interface. JupyterLab will eventually replace the classic Jupyter Notebook.


**分发版本：** 4.2.5~ynh1

**演示：** <https://mybinder.org/v2/gh/jupyterlab/jupyterlab-demo/master?urlpath=lab/tree/demo>

## 截图

![JupyterLab 的截图](./doc/screenshots/jupyterlab.png)

## 文档与资源

- 官方应用网站： <https://jupyter.org>
- 官方管理文档： <https://jupyterlab.readthedocs.io/en/stable/>
- 上游应用代码库： <https://github.com/jupyterhub/jupyterhub>
- YunoHost 商店： <https://apps.yunohost.org/app/jupyterlab>
- 报告 bug： <https://github.com/YunoHost-Apps/jupyterlab_ynh/issues>

## 开发者信息

请向 [`testing` 分支](https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing) 发送拉取请求。

如要尝试 `testing` 分支，请这样操作：

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
或
sudo yunohost app upgrade jupyterlab -u https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing --debug
```

**有关应用打包的更多信息：** <https://yunohost.org/packaging_apps>
