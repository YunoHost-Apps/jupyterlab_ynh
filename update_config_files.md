# Updating configuration files

Install the new version of the app with:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/jupyterlab_ynh/tree/testing  
```

Navigate to the installation path (`/opt/jupyterlab` by default), and run :

```bash
pipenv shell
```

You are now in the virtual environment of jupyterlab. You can execute these two commands:

- To generate the `jupyterhub_config.py` file:

```bash
jupyterhub --generate-config
```

- To generate the `jupyter_notebook_config.py` file:

```bash
jupyter notebook --generate-config
cp $HOME/.jupyter/jupyter_notebook_config.py ./
```

You can now update the old template files with the new one.
