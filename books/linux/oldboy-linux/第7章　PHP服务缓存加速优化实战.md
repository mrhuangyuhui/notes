[TOC]

# 第7章　PHP服务缓存加速优化实战

## 7.2　安装PHP缓存加速器扩展

### 7.2.2　安装PHP XCache缓存加速模块

#### 1.XCache缓存加速插件说明

XCache把PHP程序编译后的数据（opcode）缓存到共享内存里，避免相同的程序重复编译。

#### 2.XCache插件的安装过程

参考以下笔记 \
http://note.youdao.com/noteshare?id=c4f1c4191b14ab08103110f67787bf54

## 7.5　配置PHP加速与缓存相关的扩展插件模块

### 7.5.3　配置XCache插件加速

#### 1.xcache.ini参数说明

https://xcache.lighttpd.net/wiki/XcacheIni

#### 2.修改php.ini配置XCache

安装的时候就可以执行以下命令
```bash
cp xcache.ini /usr/local/php/php-5.6.34/etc/php.d/xcache.ini
```

参考以下笔记 \
http://note.youdao.com/noteshare?id=c4f1c4191b14ab08103110f67787bf54

#### 3.检查XCache加速情况配置

```bash
$ php -v
PHP 5.6.34 (cli) (built: Apr  1 2018 07:53:28) 
Copyright (c) 1997-2016 The PHP Group
Zend Engine v2.6.0, Copyright (c) 1998-2016 Zend Technologies
    with XCache v3.2.0, Copyright (c) 2005-2014, by mOo
    with XCache Cacher v3.2.0, Copyright (c) 2005-2014, by mOo
```

#### 4.配置Web界面查看XCache缓存加速信息

**注意：\
1、要求先安装并配置好Nginx \
2、要求先安装好XCache**

使用Linux命令行md5sum命令，或者打开浏览器输入地址：http://xcache.lighttpd.net/demo/cacher/mkpassword.php ，通过输入字符串生成Xcache管理员的密码。
```bash
$ echo -n "123456" | md5sum
e10adc3949ba59abbe56e057f20f883e  -
```

设置密码
```bash
vim /usr/local/php/php-5.6.34/etc/php.d/xcache.ini

[xcache.admin]
xcache.admin.enable_auth = On

; use http://xcache.lighttpd.net/demo/cacher/mkpassword.php to generate your encrypted password
xcache.admin.user = "oldboy"
xcache.admin.pass = "e10adc3949ba59abbe56e057f20f883e"
```

复制XCache软件下面的缓存加速管理PHP程序到站点目录下
```bash
cp -a htdocs/ /usr/share/nginx/html/www/xadmin
cd /usr/share/nginx/html/www/
chown -R nginx.nginx xadmin/
```

重启php-fpm
```
pkill php-fpm
/usr/local/php/php-5.6.34/sbin/php-fpm
```

在浏览器打开以下网址：
http://www.example.com/xadmin/index.php 查看配置情况

### 7.5.4　配置ZendOpcache插件加速

http://php.net/manual/en/book.opcache.php

http://php.net/manual/en/opcache.installation.php

http://php.net/manual/en/opcache.configuration.php

http://php.net/manual/en/ref.opcache.php

https://pecl.php.net/package/ZendOpcache

编译 PHP 时要添加选项 `--enable-opcache`
```bash
cd php-5.6.34

# ./configure --help
./configure \
--prefix=/usr/local/php/php-5.6.34 \
--with-config-file-path=/usr/local/php/php-5.6.34/etc/php.ini \
--with-config-file-scan-dir=/usr/local/php/php-5.6.34/etc/php.d \
--enable-fpm \
--enable-opcache \
--with-mysqli
```

配置 `/usr/local/php/php-5.6.34/etc/php.d/opcache.ini`
```ini
[opcache]
zend_extension=/usr/local/php/php-5.6.34/lib/php/extensions/no-debug-non-zts-20131226/opcache.so
opcache.memory_consumption=128
opcache.interned_strings_buffer=8
opcache.max_accelerated_files=4000
opcache.revalidate_freq=60
opcache.fast_shutdown=1
opcache.enable_cli=1
```

检查
```
$ /usr/local/php/current/bin/php -v
PHP 5.6.34 (cli) (built: Mar 10 2018 08:53:15) 
Copyright (c) 1997-2016 The PHP Group
Zend Engine v2.6.0, Copyright (c) 1998-2016 Zend Technologies
    with Zend OPcache v7.0.6-dev, Copyright (c) 1999-2016, by Zend Technologies
```