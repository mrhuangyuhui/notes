<!-- omit in toc -->
# PIP Manual

- [Quickstart](#quickstart)
- [Install](#install)
  - [`get-pip.py`](#get-pippy)
  - [Package Managers](#package-managers)
- [Mirrors](#mirrors)
- [Commands](#commands)
  - [`pip install`](#pip-install)
- [Guides](#guides)

<https://pip.pypa.io/en/stable/>

<https://github.com/pypa/pip>

<https://pypi.python.org/pypi/pip>

[Installing packages using `pip` and virtual environments](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/)

用源码安装模块

```bash
git clone https://github.com/pallets/flask.git
cd flask
python setup.py build
python setup.py install
```

## Quickstart

<https://pip.pypa.io/en/stable/quickstart/>

Install a package from PyPI

```
$ pip install SomePackage
  [...]
  Successfully installed SomePackage
```

Show what files were installed
```
$ pip show --files SomePackage
  Name: SomePackage
  Version: 1.0
  Location: /my/env/lib/pythonx.x/site-packages
  Files:
   ../somepackage/__init__.py
   [...]
```

## Install

<https://pip.pypa.io/en/stable/installing/>

### `get-pip.py`

```bash
sudo wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
```

### Package Managers

<https://packaging.python.org/guides/installing-using-linux-tools/#installing-pip-setuptools-wheel-with-linux-package-managers>

```bash
sudo yum install python-pip

sudo apt-get install python-pip
```

升级 `pip`

```bash
pip install -U pip
```

## Mirrors

配置国内镜像

`~/.pip/pip.conf`

```bash
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
[install]
trusted-host = https://pypi.tuna.tsinghua.edu.cn
```

[从国内的 PyPI 镜像（源）安装 Python 包](http://greyli.com/set-custom-pypi-mirror-url-for-pip-pipenv-poetry-and-flit/)

## Commands

<https://pip.pypa.io/en/stable/reference/>

```bash
pip
pip -h
pip --help

pip help install
pip install -h
pip install --help
```

```bash
pip -V
pip --version
```

安装依赖包

```bash
pip install -r requirements.txt
```

列出已安装的包

```bash
pip list
```

查看已安装的包

```bash
pip show virtualenv
```

升级已安装的包

```bash
pip install -U virtualenv
```

### `pip install`

安装

```bash
pip install virtualenv
```

升级

```bash
pip install -U virtualenv
```

## Guides

<https://pip.pypa.io/en/stable/user_guide/>
