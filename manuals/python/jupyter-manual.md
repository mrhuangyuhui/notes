# Jupyter Manual

<https://jupyter.org/>

<https://jupyter.readthedocs.io/en/latest/>

<https://nbviewer.jupyter.org/>（在线渲染 Notebook 文件）

## [Installation](https://jupyter.readthedocs.io/en/latest/install.html)

```bash
pip3 install --upgrade pip
pip3 install jupyter
# 启动 Notebook 服务器，默认监听 localhost:8888，启动
# 后自动打开浏览器，并加载当前目录下的文件到工作环境。
jupyter notebook
```

## [Commands](https://jupyter.readthedocs.io/en/latest/projects/jupyter-command.html)

```bash
jupyter notebook --help
jupyter notebook --help-all
```

启动 Notebook 服务器，默认监听 8888 端口。

```bash
jupyter notebook
```

指定端口

```bash
jupyter notebook --port 9999
```

加载指定的 Notebook 文件

```bash
jupyter notebook notebook.ipynb
```

子命令的用法

```bash
jupyter-notebook stop -h
jupyter-notebook password -h
jupyter-notebook list -h
```

停止指定端口的服务器

```bash
$ jupyter-notebook stop 8888
Shutting down server on port 8888 ...
```

列出所有运行的服务器

```bash
jupyter-notebook list
```

## Configuration

[Common Directories and File Locations](https://jupyter.readthedocs.io/en/latest/projects/jupyter-directories.html)

[Jupyter’s Common Configuration Approach](https://jupyter.readthedocs.io/en/latest/projects/config.html)

用户配置目录默认是 `~/.jupyter`，可通过环境变量 `JUPYTER_CONFIG_DIR` 指定其他目录，同时，还会搜索其他系统目录。

```bash
JUPYTER_CONFIG_DIR
{sys.prefix}/etc/jupyter/
/usr/local/etc/jupyter/ /etc/jupyter/
```

列出所有配置目录

```bash
jupyter --paths
```

## [Reference](https://jupyter.readthedocs.io/en/latest/reference/content-reference.html)

[Index](https://jupyter.readthedocs.io/en/latest/genindex.html)

[Search](https://jupyter.readthedocs.io/en/latest/search.html)

## Usage and Projects

[Jupyter Projects](https://jupyter.readthedocs.io/en/latest/projects/subprojects.html)

[IPython Projects](https://jupyter.readthedocs.io/en/latest/projects/ipython_projects.html)

[Project Documentation](https://jupyter.readthedocs.io/en/latest/projects/doc-proj-categories.html)

## [The Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/latest/)

<https://github.com/jupyter/notebook>

安装和启动参考上面的笔记

[Notebook Examples](https://jupyter-notebook.readthedocs.io/en/latest/examples/Notebook/examples_index.html)