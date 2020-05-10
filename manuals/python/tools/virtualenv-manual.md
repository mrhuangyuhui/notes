<!-- omit in toc -->
# Virtualenv Manual

- [Install](#install)
  - [PIP](#pip)
  - [Linux](#linux)
  - [Mac](#mac)
- [Cmds](#cmds)
- [Refs](#refs)

<http://virtualenv.pypa.io/>

<https://github.com/pypa/virtualenv>

[virtualenvwrapper](http://virtualenvwrapper.readthedocs.io/en/stable/)

## Install

> 注意：Python 3 自带 [`venv`](https://docs.python.org/3/library/venv.html#module-venv) 模块，不需要安装！！！

[Installing packages using `pip` and virtual environments](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/)

<https://virtualenv.pypa.io/en/latest/installation/>

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

## [Cmds](https://virtualenv.pypa.io/en/latest/reference/#virtualenv-command)

<https://virtualenv.pypa.io/en/latest/userguide/>

创建虚拟 Python 环境

```bash
cd myapp
# ENV 是虚拟环境所在的目录
virtualenv ENV
# Python 3 自带模块创建
python3 -m venv ENV
```

激活虚拟 Python 环境

```bash
source ENV/bin/activate
```

关闭虚拟 Python 环境

```bash
deactivate
```

删除虚拟 Python 环境

```bash
deactivate && rm -r ENV
```

## Refs

[Reference Guide](https://virtualenv.pypa.io/en/latest/reference/)
