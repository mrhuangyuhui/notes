<!-- omit in toc -->
# Python Manual

- [Install](#install)
  - [Docker](#docker)
  - [CentOS](#centos)
  - [Using pyenv (Recommended)](#using-pyenv-recommended)
  - [Source code](#source-code)
  - [Windows](#windows)
- [Mirrors](#mirrors)
- [Cmds](#cmds)
- [Refs](#refs)
  - [Python 3](#python-3)
- [Tutorials](#tutorials)
- [Related Practices](#related-practices)

<https://www.python.org>

https://www.python.org/doc/

https://github.com/python/cpython

[Installing packages using `pip` and virtual environments](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/)

## Install

### Docker

<https://hub.docker.com/_/python>

```bash
docker pull python:2.7.17-alpine3.11
```

### CentOS

Prerequisites(CentOS 7)
```
$ yum group install 'Development Tools' -y
$ yum install zlib-devel bzip2-devel openssl-devel ncurses-devel readline-devel sqlite-devel -y
```

### Using [pyenv](https://github.com/pyenv/pyenv) (Recommended)

### Source code

Download

https://www.python.org/downloads/

Build
```
$ ./configure --prefix=/usr/local/Python/Python-3.6.2/
$ make
$ make test
$ make install
```

Symlink
```
$ cd /usr/local/Python/
$ ln -s Python-3.6.2/ default
```

Add to the load path
```
$ echo 'export PATH=/usr/local/Python/default/bin:$PATH' >> ~/.bash_profile
$ source ~/.bash_profile
```

Verifying
```
$ python3 -V
```

### Windows

## Mirrors

配置国内镜像，参考笔记 [PIP Manual](/manuals/python/pip-manual.md#mirrors)

## Cmds

列出已安装模块

```bash
pydoc modules
# 或
pip list
```

用源码安装模块

```bash
git clone https://github.com/pallets/flask.git
cd flask
python setup.py build
python setup.py install
```

## Refs

[General Index](https://docs.python.org/3/genindex.html) \
[Global Module Index](https://docs.python.org/3/py-modindex.html) \
[Search page](https://docs.python.org/3/search.html)

http://devdocs.io/python~3.6/ \
http://devdocs.io/python~2.7/

**[sys](https://docs.python.org/3.6/library/sys.html)**

- [sys.modules](https://docs.python.org/3.6/library/sys.html#sys.modules)

### [Python 3](https://docs.python.org/3/)

## Tutorials

[The Python Tutorial](https://docs.python.org/3/tutorial/)

[The Python Standard Library](https://docs.python.org/3/library/index.html)

[The Python Language Reference](https://docs.python.org/3.6/reference/index.html)

[Python 进阶](https://github.com/eastlakeside/interpy-zh)

[Intermediate Python](https://github.com/yasoob/intermediatePython)

[Python 教程 - 廖雪峰的官方网站](https://www.liaoxuefeng.com/wiki/1016959663602400)

[Python Tutorial (W3Schools)](https://www.w3schools.com/python/default.asp)

## Related Practices

**PIP Practice**

**Virtualenv Practice**

**Pyenv Practice**