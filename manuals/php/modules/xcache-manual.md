[TOC]

# XCache Manual

https://xcache.lighttpd.net/

## Installation

### Source [>>](https://xcache.lighttpd.net/wiki/InstallFromSource)

```bash
$ wget https://xcache.lighttpd.net/pub/Releases/3.2.0/xcache-3.2.0.tar.gz
$ tar -zxf xcache-3.2.0.tar.gz
$ cd xcache-3.2.0
$ /usr/local/php/current/bin/phpize
$ ./configure --enable-xcache --with-php-config=/usr/local/php/current/bin/php-config 
$ make 
$ make install
# PHP要设置php.d为附加配置文件夹，详情参考PHP笔记
$ cp xcache.ini /usr/local/php/php-5.6.34/etc/php.d/xcache.ini
```

检查安装情况
```bash
$ php -v
PHP 5.6.34 (cli) (built: Apr  1 2018 07:53:28) 
Copyright (c) 1997-2016 The PHP Group
Zend Engine v2.6.0, Copyright (c) 1998-2016 Zend Technologies
    with XCache v3.2.0, Copyright (c) 2005-2014, by mOo
    with XCache Cacher v3.2.0, Copyright (c) 2005-2014, by mOo
```

**注意：如果php-fpm已经开启，要重启以后才能在`<?php phpinfo(); ?>`生效。**

## Configuration [>>](https://xcache.lighttpd.net/wiki/XcacheIni)

## References [>>](https://xcache.lighttpd.net/wiki/XcacheApi)
