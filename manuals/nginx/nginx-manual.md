<!-- omit in toc -->
# Nginx Manual

- [Install](#install)
  - [Docker](#docker)
  - [CentOS](#centos)
  - [Debian/Ubuntu](#debianubuntu)
  - [Building nginx from Sources](#building-nginx-from-sources)
- [Commands](#commands)
- [Directories & Files](#directories--files)
- [Configuration](#configuration)
- [References](#references)
- [Tutorials](#tutorials)
- [PHP](#php)

<http://nginx.org/>

<http://nginx.org/en/docs/>

<https://github.com/nginx/nginx>

<https://www.nginx.com/>

## Install

<http://nginx.org/en/download.html>

<http://nginx.org/en/docs/install.html>

<http://nginx.org/en/linux_packages.html>

<!-- #nginx-docker -->
### Docker

<https://hub.docker.com/_/nginx>

```bash
docker pull nginx:1.16.1-alpine
```

### CentOS

使用 epel-release 源进行安装

```bash
yum install -y epel-release && yum install -y nginx && nginx && nginx -v && ps -ax | grep nginx
```

使用官方源进行安装

下载 Repo

```bash
# CentOS 7.5
wget -O /etc/yum.repos.d/nginx.repo https://gitee.com/mrhuangyuhui/nginx/raw/master/nginx-centos7.repo

# CentOS 6.9
wget -O /etc/yum.repos.d/nginx.repo https://gitee.com/mrhuangyuhui/nginx/raw/master/nginx-centos6.repo
```

安装

```bash
yum install nginx -y

# 验证安装结果
$ nginx -v
nginx version: nginx/1.14.0
```

启动

```bash
nginx && ps -ax | grep nginx
```

- #### Source

```bash
curl -L https://github.com/mrhuangyuhui/nginx/raw/master/install-nginx-source-yum.sh | bash
```

### Debian/Ubuntu

Sign the nginx packages and repository to the apt program keyring
```bash
$ wget http://nginx.org/keys/nginx_signing.key
$ sudo apt-key add nginx_signing.key
```

For Debian replace codename with Debian distribution codename, and append the following to the end of the `/etc/apt/sources.list` file:
```
deb http://nginx.org/packages/debian/ codename nginx
deb-src http://nginx.org/packages/debian/ codename nginx
```

For Ubuntu replace codename with Ubuntu distribution codename, and append the following to the end of the `/etc/apt/sources.list` file:
```
deb http://nginx.org/packages/ubuntu/ codename nginx
deb-src http://nginx.org/packages/ubuntu/ codename nginx
```

For Debian/Ubuntu then run the following commands:
```bash
$ apt-get update
$ apt-get install nginx
```

```bash
## Debian 7.11 ##
$ curl -L https://github.com/mrhuangyuhui/nginx/raw/master/install-nginx-debian7.sh | sh

## Debian 8.9 ##
$ curl -L https://github.com/mrhuangyuhui/nginx/raw/master/install-nginx-debian8.sh | sh

## Debian 9.2 ##
$ wget https://github.com/mrhuangyuhui/nginx/raw/master/install-nginx-debian9.sh && sh install-nginx-debian9.sh

## Ubuntu 14.04 ##
$ curl -L https://github.com/mrhuangyuhui/nginx/raw/master/install-nginx-ubuntu1404.sh | sh

## Ubuntu 16.04 ##
$ curl -L https://github.com/mrhuangyuhui/nginx/raw/master/install-nginx-ubuntu1604.sh | sh
```

### [Building nginx from Sources](http://nginx.org/en/docs/configure.html)

- #### Debian/Ubuntu
https://github.com/mrhuangyuhui/nginx/blob/master/install-nginx-source-apt.sh

## Commands

启动

```bash
nginx && ps -ax | grep nginx
```

Getting the list of all running nginx processes
```bash
ps -ax | grep nginx
```

[Starting, Stopping, and Reloading Configuration](http://nginx.org/en/docs/beginners_guide.html#control)
```bash
# fast shutdown
nginx -s stop

# graceful shutdown
nginx -s quit

# reloading the configuration file
nginx -s reload

# reopening the log files
nginx -s reopen
```

Testing the configuration file
```bash
$ nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

Help
```bash
$ nginx -h
nginx version: nginx/1.12.2
Usage: nginx [-?hvVtTq] [-s signal] [-c filename] [-p prefix] [-g directives]

Options:
  -?,-h         : this help
  -v            : show version and exit
  -V            : show version and configure options then exit
  -t            : test configuration and exit
  -T            : test configuration, dump it and exit
  -q            : suppress non-error messages during configuration testing
  -s signal     : send signal to a master process: stop, quit, reopen, reload
  -p prefix     : set prefix path (default: /usr/share/nginx/)
  -c filename   : set configuration file (default: /etc/nginx/nginx.conf)
  -g directives : set global directives out of configuration file
```

Manual
```bash
man nginx
```

## Directories & Files

All
```bash
rpm -ql nginx

tree /usr/local/nginx/current
```

Configuration
```bash
$ rpm -ql nginx | grep nginx.conf
/etc/nginx/nginx.conf
/etc/nginx/nginx.conf.default

$ tree /etc/nginx
/etc/nginx
├── conf.d
├── default.d
├── nginx.conf
├── nginx.conf.default
```

Executable
```bash
$ rpm -ql nginx | grep bin
/usr/bin/nginx-upgrade
/usr/sbin/nginx
```

Log
```bash
$ rpm -ql nginx | grep log
/etc/logrotate.d/nginx
/var/log/nginx

$ tree /var/log/nginx
/var/log/nginx
├── access.log
└── error.log
```

Web contents
```bash
$ rpm -ql nginx | grep html
/usr/share/nginx/html/404.html
/usr/share/nginx/html/50x.html
/usr/share/nginx/html/index.html
/usr/share/nginx/html/nginx-logo.png
/usr/share/nginx/html/poweredby.png

$ tree /usr/share/nginx/html
/usr/share/nginx/html
├── 404.html
├── 50x.html
├── index.html
├── nginx-logo.png
└── poweredby.png
```

Modules
```bash
$ rpm -ql nginx | grep module
/usr/lib64/nginx/modules

$ tree /usr/lib64/nginx/modules
```

Service
```bash
$ rpm -ql nginx | grep service
/usr/lib/systemd/system/nginx.service
```

## Configuration

```bash
$ rpm -ql nginx | grep nginx.conf
/etc/nginx/nginx.conf
/etc/nginx/nginx.conf.default

$ tree /etc/nginx
/etc/nginx
├── conf.d
├── default.d
├── nginx.conf
├── nginx.conf.default
```

[Configuration File’s Structure](http://nginx.org/en/docs/beginners_guide.html#conf_structure)

[Serving Static Content](http://nginx.org/en/docs/beginners_guide.html#static)

## References

[Alphabetical index of directives](http://nginx.org/en/docs/dirindex.html)

[Alphabetical index of variables](http://nginx.org/en/docs/varindex.html)

## Tutorials

[Beginner's Guide](http://nginx.org/en/docs/beginners_guide.html)

[How nginx processes a request](http://nginx.org/en/docs/http/request_processing.html)

[Logging to syslog](http://nginx.org/en/docs/syslog.html)

Command-line parameters
http://nginx.org/en/docs/switches.html

Server names
http://nginx.org/en/docs/http/server_names.html

Using nginx as HTTP load balancer
http://nginx.org/en/docs/http/load_balancing.html

https://www.nginx.com/

https://www.nginx.com/resources/admin-guide/

## PHP

https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-centos-7