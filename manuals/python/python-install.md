# Python Installation

## Docker

[`python-docker.md`](python-docker.md)

### pyenv

本地安装推荐这种方式

[`pyenv-manual.md`](pyenv-manual.md)

## Anaconda

数据处理推荐这种方式

[`anaconda-manual.md`](anaconda-manual.md)

## CentOS

Prerequisites(CentOS 7)
```
$ yum group install 'Development Tools' -y
$ yum install zlib-devel bzip2-devel openssl-devel ncurses-devel readline-devel sqlite-devel -y
```

## Source code

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