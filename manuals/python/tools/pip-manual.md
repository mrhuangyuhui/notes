<!-- omit in toc -->
# PIP Manual

- [Install](#install)
  - [`get-pip.py`](#get-pippy)
  - [Package Managers](#package-managers)
- [Mirrors](#mirrors)
- [Cmds](#cmds)
- [Quickstart](#quickstart)
- [User Guide](#user-guide)
- [Reference Guide](#reference-guide)

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

## [Install](https://pip.pypa.io/en/stable/installing/)

### `get-pip.py`

```bash
sudo wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
```

### [Package Managers](https://packaging.python.org/guides/installing-using-linux-tools/#installing-pip-setuptools-wheel-with-linux-package-managers)

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

## Cmds

查看帮助

```bash
pip
pip -h
pip --help
# 查看子命令帮助
pip help install
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

升级 `pip`

```bash
pip install -U pip
```

## [Quickstart](https://pip.pypa.io/en/stable/quickstart/)

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

## [User Guide](https://pip.pypa.io/en/stable/user_guide/)

- ### [Installing Packages](https://pip.pypa.io/en/stable/user_guide/#installing-packages)

- ### [Listing Packages](https://pip.pypa.io/en/stable/user_guide/#listing-packages)

- ### [Searching for Packages](https://pip.pypa.io/en/stable/user_guide/#searching-for-packages)

## [Reference Guide](https://pip.pypa.io/en/stable/reference/)

- ### [pip install](https://pip.pypa.io/en/stable/reference/pip_install/)

- ### [pip list](https://pip.pypa.io/en/stable/reference/pip_list/)

- ### [pip show](https://pip.pypa.io/en/stable/reference/pip_show/)
