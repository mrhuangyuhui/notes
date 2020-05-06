<!-- omit in toc -->
# PHP Manual

- [Installation >>](#installation)
  - [Source >>](#source)
  - [YUM](#yum)
- [Cmds](#cmds)
  - [php-fpm](#php-fpm)
  - [phpize >>](#phpize)
  - [php-config >>](#php-config)
- [Language Reference](#language-reference)
- [Downloads](#downloads)
- [Docs](#docs)
- [Runtime Configuration](#runtime-configuration)
- [References](#references)
- [Tutorials](#tutorials)
- [FPM >>](#fpm)
- [XCache >>](#xcache)
- [OPcache](#opcache)
- [API](#api)

<http://php.net/>

[PHP Manual](https://www.php.net/manual/en/>) | [PHP 手册](https://www.php.net/manual/zh/)

https://github.com/php

<https://github.com/topics/php>

<https://github.com/ziadoz/awesome-php>

工具 <https://www.apachefriends.org/>

生成 API 文档 <https://github.com/FriendsOfPHP/Sami>

配置文件模板：\
https://github.com/php/php-src/blob/PHP-5.6.34/php.ini-development \
https://github.com/php/php-src/blob/PHP-5.6.34/php.ini-production

## Installation [>>](http://php.net/install)

http://php.net/downloads.php

### Source [>>](http://php.net/manual/en/install.unix.nginx.php)

**Compile Options** \
[List of core configure options](http://php.net/manual/en/configure.about.php) \
[All configure options](https://github.com/mrhuangyuhui/php/blob/master/configure-options-php-5.6.34)

```bash
$ ./configure --help
# 开启php-fpm功能
--enable-fpm            Enable building of the fpm SAPI executable
# 开启缓存功能
--enable-opcache        Enable Zend OPcache support
# 默认配置文件
--with-config-file-path=PATH
Sets the path in which to look for php.ini, defaults to PREFIX/lib.
# 附加配置文件夹
--with-config-file-scan-dir=PATH
                          Set the path where to scan for configuration files
```

安装Nginx
```bash
yum install -y epel-release && yum install -y nginx && nginx -v && nginx && ps -ax | grep nginx
```

安装PHP [install-php-source-centos7.sh](https://github.com/mrhuangyuhui/php/blob/master/install-php-source-centos7.sh)
```bash
curl -L https://github.com/mrhuangyuhui/php/raw/master/install-php-source-centos7.sh | bash
```

基本配置
```
vim /usr/local/php/current/etc/php.ini
cgi.fix_pathinfo=0

vim /usr/local/php/current/etc/php-fpm.conf
user = nginx
group = nginx
```

安装过程的提示，记录了重要文件的安装位置。
```bash
$ make install
# 扩展插件的安装文件夹
Installing shared extensions:     /usr/local/php/php-5.6.34/lib/php/extensions/no-debug-non-zts-20131226/
# 各种可执行程序所在文件夹
Installing PHP CLI binary:        /usr/local/php/php-5.6.34/bin/
Installing PHP CLI man page:      /usr/local/php/php-5.6.34/php/man/man1/
# php-fpm程序所在文件夹
Installing PHP FPM binary:        /usr/local/php/php-5.6.34/sbin/
# php-fpm配置文件所在文件夹
Installing PHP FPM config:        /usr/local/php/php-5.6.34/etc/
Installing PHP FPM man page:      /usr/local/php/php-5.6.34/php/man/man8/
Installing PHP FPM status page:   /usr/local/php/php-5.6.34/php/php/fpm/
Installing PHP CGI binary:        /usr/local/php/php-5.6.34/bin/
Installing PHP CGI man page:      /usr/local/php/php-5.6.34/php/man/man1/
Installing build environment:     /usr/local/php/php-5.6.34/lib/php/build/
# 在PHP文件中include一个文件默认所在的文件夹
Installing header files:           /usr/local/php/php-5.6.34/include/php/
Installing helper programs:       /usr/local/php/php-5.6.34/bin/
  program: phpize
  program: php-config
Installing man pages:             /usr/local/php/php-5.6.34/php/man/man1/
  page: phpize.1
  page: php-config.1
# PEAR是PHP的一个模块管理工具，类似Maven、NPM等。
Installing PEAR environment:      /usr/local/php/php-5.6.34/lib/php/
[PEAR] Archive_Tar    - installed: 1.4.3
[PEAR] Console_Getopt - installed: 1.4.1
[PEAR] Structures_Graph- installed: 1.1.1
[PEAR] XML_Util       - installed: 1.4.2
[PEAR] PEAR           - installed: 1.10.5
Wrote PEAR system config file at: /usr/local/php/php-5.6.34/etc/pear.conf
You may want to add: /usr/local/php/php-5.6.34/lib/php to your php.ini include_path
/root/php-5.6.34/build/shtool install -c ext/phar/phar.phar /usr/local/php/php-5.6.34/bin
ln -s -f phar.phar /usr/local/php/php-5.6.34/bin/phar
Installing PDO headers:           /usr/local/php/php-5.6.34/include/php/ext/pdo/
```

各种可执行程序
```bash
$ ll /usr/local/php/php-5.6.34/bin/
total 58752
-rwxr-xr-x. 1 root root      892 Apr  1 07:54 pear
-rwxr-xr-x. 1 root root      913 Apr  1 07:54 peardev
-rwxr-xr-x. 1 root root      829 Apr  1 07:54 pecl
lrwxrwxrwx. 1 root root        9 Apr  1 07:54 phar -> phar.phar
-rwxr-xr-x. 1 root root    53505 Apr  1 07:54 phar.phar
-rwxr-xr-x. 1 root root 30092416 Apr  1 07:54 php
-rwxr-xr-x. 1 root root 29983576 Apr  1 07:54 php-cgi
# php-config is a simple shell script for obtaining information about the installed PHP configuration.
-rwxr-xr-x. 1 root root     2491 Apr  1 07:54 php-config
# The phpize command is used to prepare the build environment for a PHP extension.
-rwxr-xr-x. 1 root root     4571 Apr  1 07:54 phpize
```

在Nginx中配置php-fpm [`www.conf`](https://github.com/mrhuangyuhui/php/blob/master/www.conf)
```nginx
server {
    listen 80;
    server_name www.example.com;
    root /usr/share/nginx/html/www/;

    location / {
        index index.php index.html index.htm;
    }

    location ~* \.php$ {
        fastcgi_index   index.php;
        fastcgi_pass    127.0.0.1:9000;
        include         fastcgi_params;
        fastcgi_param   SCRIPT_FILENAME    $document_root$fastcgi_script_name;
        fastcgi_param   SCRIPT_NAME        $fastcgi_script_name;
    }
}
```

测试安装情况
```bash
mkdir -p /usr/share/nginx/html/www/ && echo "<?php phpinfo(); ?>" > /usr/share/nginx/html/www/index.php
```

配置域名
```bash
# Mac OS X
$ sudo vim /private/etc/hosts
```

不安装Nginx，下面的命令也可以测试安装情况。
```bash
php -i | less
```

### YUM

[How To Install Linux, Nginx, MySQL, PHP (LEMP) stack On CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-centos-7)

```bash
yum install -y epel-release
yum install -y nginx
yum install -y php php-mysql php-fpm
```

```
vim /etc/php.ini
cgi.fix_pathinfo=0
```

```
vim /etc/php-fpm.d/www.conf
user = nginx
group = nginx
```

## Cmds

查看帮助

```bash
php -h
```

查看版本号

```bash
php -v
```

列出配置文件

```bash
php --ini
```

打印 PHP 的配置信息，与 `<?php phpinfo(); ?>` 相同。

```bash
php -i | less
```

列出已安装模块

```bash
php -m
```

### php-fpm

```
$ /usr/local/php/php-5.6.34/sbin/php-fpm -h
Usage: php-fpm [-n] [-e] [-h] [-i] [-m] [-v] [-t] [-p <prefix>] [-g <pid>] [-c <file>] [-d foo[=bar]]
```

停止php-fpm进程
```bash
ps aux | grep php-fpm

kill -QUIT 18674
kill -INT 18674
kill -USR1 18674
kill -USR2 18674
```

```
pkill php-fpm
```

### phpize [>>](http://php.net/manual/en/install.pecl.phpize.php)

The phpize command is used to prepare the build environment for a PHP extension. 

```bash
$ phpize --help
Usage: ./phpize [--clean|--help|--version|-v]
```

### php-config [>>](http://php.net/manual/en/install.pecl.php-config.php)

php-config is a simple shell script for obtaining information about the installed PHP configuration.

```
$ php-config -h
Usage: /usr/local/bin/php-config [OPTION]
```

## Language Reference

<https://www.php.net/manual/en/langref.php>

## Downloads

[Download documentation](https://www.php.net/download-docs.php)

## Docs

<https://www.php.net/docs.php>

[PHP Manual](https://www.php.net/manual/en/>) | [PHP 手册](https://www.php.net/manual/zh/)

[Language Reference](https://www.php.net/manual/en/langref.php)

## Runtime Configuration

编译时可以指定主配置文件（`php.ini`）的路径和其他配置文件所在的目录
```
$ ./configure --help
--with-config-file-path=PATH
Sets the path in which to look for php.ini, defaults to PREFIX/lib.
--with-config-file-scan-dir=PATH
                          Set the path where to scan for configuration files
```

配置文件的加载顺序：http://php.net/configuration.file

启动FPM时指定配置文件
```
php-fpm -c /usr/local/php/current/etc/php.ini
```

[使用环境变量指定其他配置文件所在的目录](http://php.net/manual/en/configuration.file.php#configuration.file.scan)
```
Assuming PHP is configured with --with-config-file-scan-dir=/etc/php.d,
and that the path separator is :...

$ php
  PHP will load all files in /etc/php.d/*.ini as configuration files.

$ PHP_INI_SCAN_DIR=/usr/local/etc/php.d php
  PHP will load all files in /usr/local/etc/php.d/*.ini as
  configuration files.

$ PHP_INI_SCAN_DIR=:/usr/local/etc/php.d php
  PHP will load all files in /etc/php.d/*.ini, then
  /usr/local/etc/php.d/*.ini as configuration files.

$ PHP_INI_SCAN_DIR=/usr/local/etc/php.d: php
  PHP will load all files in /usr/local/etc/php.d/*.ini, then
  /etc/php.d/*.ini as configuration files.
```

配置文件模板：\
https://github.com/php/php-src/blob/PHP-5.6.34/php.ini-development \
https://github.com/php/php-src/blob/PHP-5.6.34/php.ini-production

**[php.ini directives](http://php.net/manual/en/ini.php)**

- [List of php.ini directives](http://php.net/manual/en/ini.list.php) ([Where a configuration setting may be set](http://php.net/manual/en/configuration.changes.modes.php))
- [List of php.ini sections](http://php.net/manual/en/ini.sections.php)
- [Description of core php.ini directives](http://php.net/manual/en/ini.core.php)

## References

参考文档使用技巧：[Navigation tips&tricks](http://php.net/urlhowto.php)

[PHP Manual](http://php.net/manual/en/index.php)

[PHP 手册](http://php.net/manual/zh/)

## Tutorials

[Learn PHP](https://www.w3schools.com/php/default.asp)

[PHP 之道](https://laravel-china.github.io/php-the-right-way/)

## FPM [>>](http://php.net/manual/en/install.fpm.php)

[Installation](http://php.net/manual/en/install.fpm.install.php)

[Configuration](http://php.net/manual/en/install.fpm.configuration.php)

## XCache [>>](http://note.youdao.com/noteshare?id=c4f1c4191b14ab08103110f67787bf54)

## OPcache

http://php.net/manual/en/book.opcache.php

http://php.net/manual/en/opcache.installation.php

http://php.net/manual/en/opcache.configuration.php

http://php.net/manual/en/ref.opcache.php

https://pecl.php.net/package/ZendOpcache

```bash
cd php-5.6.34
./configure --enable-opcache
```

`opcache.ini`
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

```
$ php -v
PHP 5.6.34 (cli) (built: Mar 10 2018 08:53:15) 
Copyright (c) 1997-2016 The PHP Group
Zend Engine v2.6.0, Copyright (c) 1998-2016 Zend Technologies
    with Zend OPcache v7.0.6-dev, Copyright (c) 1999-2016, by Zend Technologies
```

## API

<https://devdocs.io/php/>

<https://www.phpdoc.org/>

<https://github.com/FriendsOfPHP/Sami>
