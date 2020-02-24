# SVN Manual

<http://subversion.apache.org/>

<http://subversion.apache.org/packages.html>

<http://subversion.apache.org/quick-start>

<http://subversion.apache.org/docs/>

## Installation

### [Binary Package](http://subversion.apache.org/packages.html)

[CentOS](http://subversion.apache.org/packages.html#centos)

安装

```bash
# 同时安装服务器程序 svnserve 和客户端程序 svn
yum install -y subversion && yum install -y mod_dav_svn
```

启动服务

```bash
# 创建仓库的根目录
mkdir -p /var/svn/repos

# 创建仓库 example
svnadmin create /var/svn/repos/example

# 进入仓库目录
cd /var/svn/repos/example

# 创建账号密码
$ vim conf/passwd
[users]
huangyh = 123456

# 配置仓库
$ vim svnserve.conf
anon-access = read # 可选配置
auth-access = write # 可选配置
password-db = passwd # 必须配置，加载账号密码配置文件。
authz-db = authz # 可选配置，加载读写权限配置文件。

# 启动服务端程序
# -r 指定仓库的根目录，客户端连接时的仓库是相对于根目录的，如
# svn://huangyh@209.97.167.151:3690/example
svnserve -d -r /var/svn/repos/

# 检查启动情况，默认监听 3690 端口。
$ netstat -tulnp | grep svn
tcp        0      0 0.0.0.0:3690            0.0.0.0:*               LISTEN      10938/svnserve
```

客户端连接地址是 `svn://huangyh@209.97.167.151:3690/example` 注意：协议是 `svn`，如果结合 Apache 服务器使用则是 `http` 协议。

```bash
$ yum info mod_dav_svn
Name        : mod_dav_svn
Summary     : Apache httpd module for Subversion server
URL         : http://subversion.apache.org/
Description : The mod_dav_svn package allows access to a Subversion repository
            : using HTTP, via the Apache httpd server.
```

[Ubuntu](http://subversion.apache.org/packages.html#ubuntu)

```bash
apt-get install subversion
apt-get install libapache2-svn
```

### [Source Code](http://subversion.apache.org/source-code.html)

<http://subversion.apache.org/download.cgi>

<http://svn.apache.org/repos/asf/subversion/trunk/INSTALL>

## Files

```bash
# 创建仓库 example
svnadmin create /var/svn/repos/example

# 仓库配置文件
$ ll /var/svn/repos/example/conf/
-rw-r--r--. 1 root root 1080 Jun 18 05:29 authz # 读写权限
-rw-r--r--. 1 root root  309 Jun 18 05:29 passwd # 账号密码
-rw-r--r--. 1 root root 3090 Jun 18 05:29 svnserve.conf # 仓库配置

# 配置仓库文件说明
man svnserve.conf
```

## Commands

### `svnserve`

服务端程序

```bash
svnserve --help
man svnserve
# 配置仓库文件说明
man svnserve.conf
```

```bash
# 启动服务端程序
# -r 指定仓库的根目录，客户端连接时的仓库是相对于根目录的，如
# svn://huangyh@209.97.167.151:3690/example
svnserve -d -r /var/svn/repos/
```

命令行选项 | 说明
--- | ---
`-d [--daemon]` | 以后台进程方式运行
`--listen-port ARG` | 监听的端口号
`-r [--root] ARG` | 指定仓库的根目录，客户端连接时的仓库是相对于根目录的，如 `-r /var/svn/repos/`，那么客户端连接的地址是 `svn://huangyh@209.97.167.151:3690/example`

### `svnadmin`

服务端的仓库管理工具

```bash
svnadmin help
man svnadmin
```

```bash
# 创建仓库 example
svnadmin create /var/svn/repos/example
```

### `svn`

客户端程序

<http://subversion.apache.org/quick-start>

```bash
svn help
man svn
```

## Tutorials

[Subversion 与版本控制](http://svnbook.red-bean.com/)

[SVN 命令行客户端快速入门教程](http://subversion.apache.org/quick-start)

## Clients

<https://tortoisesvn.net/>