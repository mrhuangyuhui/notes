# Apache Manual

https://httpd.apache.org/

http://httpd.apache.org/docs/

[DistrosDefaultLayout](https://wiki.apache.org/httpd/DistrosDefaultLayout)

[CommonHTTPStatusCodes](https://wiki.apache.org/httpd/CommonHTTPStatusCodes)

# Version 2.2

Apache HTTP Server Documentation
http://httpd.apache.org/docs/2.2/en/

Sitemap
http://httpd.apache.org/docs/2.2/en/sitemap.html

鳥哥的 Linux 私房菜 第二十章、WWW 伺服器
http://linux.vbird.org/linux_server/0360apache.php

## Installation

### [Compiling and Installing](http://httpd.apache.org/docs/2.2/en/install.html)


### Installing with YUM
```
$ yum install httpd -y
```

启动服务器
```
$ /etc/init.d/httpd start
```

校验配置文件
```
$ /etc/init.d/httpd configtest
```


设置开机启动
```
$ chkconfig httpd on
```


配置文件目录
```
/etc/httpd/conf/httpd.conf
/etc/httpd/conf.d/*.conf
```


网站内容目录
```
/var/www/html/
/var/www/error/
/var/www/icons/
/var/www/cgi-bin/
```

日志文件目录
```
/var/log/httpd/
```


模块文件目录
```
/usr/lib64/httpd/modules/
/etc/httpd/modules/
```

### [Starting Apache](http://httpd.apache.org/docs/2.2/en/invoking.html)

### [Stopping and Restarting](http://httpd.apache.org/docs/2.2/stopping.html)

### [Server and Supporting Programs](http://httpd.apache.org/docs/2.2/programs/)

## Configuration
Terms Used to Describe Directives
http://httpd.apache.org/docs/2.2/en/mod/directive-dict.html

Directive Quick Reference
http://httpd.apache.org/docs/2.2/en/mod/quickreference.html

Directive Index
http://httpd.apache.org/docs/2.2/en/mod/directives.html

Configuration Sections
http://httpd.apache.org/docs/2.2/en/sections.html

Environment Variables in Apache
http://httpd.apache.org/docs/2.2/en/env.html

## Virtual Hosts
Apache Virtual Host documentation
http://httpd.apache.org/docs/2.2/en/vhosts/

Name-based Virtual Host Support
http://httpd.apache.org/docs/2.2/en/vhosts/name-based.html

<VirtualHost> Directive
http://httpd.apache.org/docs/2.2/en/mod/core.html#virtualhost

VirtualHost Examples
http://httpd.apache.org/docs/2.2/en/vhosts/examples.html

实例代码
https://gist.github.com/mrhuangyuhui/03f3dfbc10df597a1b27725df7e1d1b3/raw/324fc2c02a93af7edf554a08d12a5aea7fe12ee1/httpd-vhosts.conf

## Access Control
Access Control
http://httpd.apache.org/docs/2.2/en/howto/access.html

Apache Module mod_authz_host
http://httpd.apache.org/docs/2.2/en/mod/mod_authz_host.html

Order Directive
http://httpd.apache.org/docs/2.2/en/mod/mod_authz_host.html#order

Allow Directive
http://httpd.apache.org/docs/2.2/en/mod/mod_authz_host.html#allow

Deny Directive
http://httpd.apache.org/docs/2.2/en/mod/mod_authz_host.html#deny

Authentication and Authorization
http://httpd.apache.org/docs/2.2/howto/auth.html

## Modules
Module Index
http://httpd.apache.org/docs/2.2/en/mod/

模块文件
/usr/lib64/httpd/modules/
/etc/httpd/modules/

# Apache Practice 2.4

http://httpd.apache.org/docs/2.4/en/

## Installation

### Installing with YUM (Recommended)
```
$ yum install httpd -y
```

### [Compiling and Installing](http://httpd.apache.org/docs/2.4/en/install.html)

### [Server and Supporting Programs](http://httpd.apache.org/docs/2.4/en/programs/)

#### [httpd](http://httpd.apache.org/docs/2.4/en/programs/httpd.html)
```
# Help
$ httpd -h

# Manual
$ man httpd
```

#### [apachectl](http://httpd.apache.org/docs/2.4/en/programs/apachectl.html)

```
# Help
$ apachectl -h

# Manual
$ man apachectl
```

## Reference Manual

### [Directive Index](http://httpd.apache.org/docs/2.4/en/mod/directives.html)

### [Directive Quick Reference](http://httpd.apache.org/docs/2.4/en/mod/quickreference.html)

### [Module Index](http://httpd.apache.org/docs/2.4/en/mod/)

## Users' Guide

### [Getting Started](http://httpd.apache.org/docs/2.4/en/getting-started.html)

### [Binding to Addresses and Ports](http://httpd.apache.org/docs/2.4/en/bind.html)

### [Configuration Files](http://httpd.apache.org/docs/2.4/en/configuring.html)

### [Configuration Sections](http://httpd.apache.org/docs/2.4/en/sections.html)

### [Mapping URLs to the Filesystem](http://httpd.apache.org/docs/2.4/en/urlmapping.html)

### [URL Rewriting with mod_rewrite](http://httpd.apache.org/docs/2.4/en/rewrite/)

### [Virtual Hosts](http://httpd.apache.org/docs/2.4/en/vhosts/)

- [Name-based Virtual Hosts](http://httpd.apache.org/docs/2.4/en/vhosts/name-based.html)
- [Virtual Host examples for common setups](http://httpd.apache.org/docs/2.4/en/vhosts/examples.html)

## How-To / Tutorials

### [Access Control](http://httpd.apache.org/docs/2.4/en/howto/access.html)

http://httpd.apache.org/docs/2.4/en/mod/mod_status.html

http://httpd.apache.org/docs/2.4/en/mod/quickreference.html

http://httpd.apache.org/docs/2.4/en/howto/htaccess.html

http://httpd.apache.org/docs/2.4/en/handler.html

http://httpd.apache.org/docs/2.4/en/howto/cgi.html

http://httpd.apache.org/docs/2.4/en/mod/core.html#errorlog

http://httpd.apache.org/docs/2.4/en/logs.html













