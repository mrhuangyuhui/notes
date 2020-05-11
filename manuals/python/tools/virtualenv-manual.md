<!-- omit in toc -->
# Virtualenv Manual

- [Install](#install)
  - [PIP](#pip)
  - [Linux](#linux)
  - [Mac](#mac)
- [Commands](#commands)
- [Docs](#docs)

<https://github.com/pypa/virtualenv>

<https://virtualenv.pypa.io/en/latest/>

<https://pypi.org/project/virtualenv/>

[virtualenvwrapper](http://virtualenvwrapper.readthedocs.io/en/stable/)

## Install

> 注意：Python 3 自带 [`venv`](https://docs.python.org/3/library/venv.html#module-venv) 模块，不需要安装！！！

<https://virtualenv.pypa.io/en/latest/installation.html>

[Installing virtualenv](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/#installing-virtualenv)

### PIP

```bash
sudo pip install virtualenv

virtualenv --version

virtualenv -h
```

### Linux

<https://flask.palletsprojects.com/en/1.1.x/installation/#install-install-virtualenv>

```bash
# Debian, Ubuntu
sudo apt-get install python-virtualenv

# CentOS, Fedora
sudo yum install python-virtualenv
```

### Mac

```bash
sudo python2 -m pip install virtualenv
```

## Commands

<https://virtualenv.pypa.io/en/latest/reference/#virtualenv-command>

<https://virtualenv.pypa.io/en/latest/userguide/>

创建虚拟环境

```bash
cd myapp

virtualenv venv # venv 是虚拟环境所在的目录名

# 或使用 Python 3 自带模块创建
python3 -m venv venv
```

激活虚拟环境

```bash
source venv/bin/activate
```

关闭虚拟环境

```bash
deactivate
```

删除虚拟环境

```bash
deactivate && rm -r venv
```

## Docs

[Reference Guide](https://virtualenv.pypa.io/en/latest/reference/)
