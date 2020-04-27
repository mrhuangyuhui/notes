<!-- omit in toc -->
# Python Manual

- [Install](#install)
  - [Docker](#docker)
  - [pyenv](#pyenv)
  - [Anaconda](#anaconda)
  - [CentOS](#centos)
  - [Source code](#source-code)
- [PIP](#pip)
- [Cmds](#cmds)
- [Refs](#refs)
  - [Python 3](#python-3)
- [Tutorials](#tutorials)

<https://www.python.org>

<https://www.python.org/doc/>

<https://github.com/python/cpython>

<https://github.com/topics/python>

[Installing packages using `pip` and virtual environments](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/)

## Install

<https://www.python.org/downloads/>

### Docker

<https://hub.docker.com/_/python>

```bash
docker pull python:2.7.17-alpine3.11
```

### pyenv

本地安装推荐这种方式

[`pyenv-manual.md`](pyenv-manual.md)

### Anaconda

数据处理推荐这种方式

[`anaconda-manual.md`](anaconda-manual.md)

### CentOS

Prerequisites(CentOS 7)
```
$ yum group install 'Development Tools' -y
$ yum install zlib-devel bzip2-devel openssl-devel ncurses-devel readline-devel sqlite-devel -y
```

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

## PIP

[`pip-manual.md`](pip-manual.md)

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
