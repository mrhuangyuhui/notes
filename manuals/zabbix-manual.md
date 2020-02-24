# Zabbix Manual

<https://www.zabbix.com/>

<https://www.zabbix.com/manuals>

<https://share.zabbix.com/>

## [Installation](https://www.zabbix.com/documentation/3.2/manual/installation)

[Repository installation](https://www.zabbix.com/documentation/3.2/manual/installation/install_from_packages/repository_installation)

[Server installation with MySQL database](https://www.zabbix.com/documentation/3.2/manual/installation/install_from_packages/server_installation_with_mysql)

[Installing frontend](https://www.zabbix.com/documentation/3.2/manual/installation/install#installing_frontend)

[Agent installation](https://www.zabbix.com/documentation/3.2/manual/installation/install_from_packages/agent_installation)

### Zabbix Server

```bash
# CentOS 7.3, Zabbix 3.2

# 安装 Yum Repo
rpm -ivh http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm

# 安装 Zabbix Server 和 Web 端
yum install zabbix-server-mysql zabbix-web-mysql

# 安装 MySQL Server，查看笔记 MySQL Manual。

# 创建数据库
$ mysql -uroot -p666666
mysql> create database zabbix character set utf8 collate utf8_bin;
# 创建 Zabbix 账号，密码是 666666。
mysql> grant all privileges on zabbix.* to zabbix@localhost identified by '666666';
mysql> quit;

# 导入 Zabbix 初始数据到数据库 zabbix，账号密码是上一步创建的 zabbix=666666。
zcat /usr/share/doc/zabbix-server-mysql-3.2.*/create.sql.gz | mysql -uzabbix -p zabbix

# 配置 MySQL Server
$ vim /etc/zabbix/zabbix_server.conf
DBHost=localhost
DBName=zabbix
DBUser=zabbix
DBPassword=666666

# 关闭 SELinux 和防火墙
setenforce 0 && systemctl stop firewalld

# 启动 Zabbix Server
systemctl start zabbix-server
systemctl enable zabbix-server

# 配置 Web 端的 PHP
$ vim /etc/httpd/conf.d/zabbix.conf
php_value max_execution_time 300
php_value memory_limit 128M
php_value post_max_size 16M
php_value upload_max_filesize 2M
php_value max_input_time 300
php_value always_populate_raw_post_data -1
php_value date.timezone Asia/Shanghai

# 启动 Apache Server
systemctl start httpd

# 启动 Zabbix Web 端
打开 http://192.168.31.134/zabbix

# 登录 Zabbix Web 端
username: Admin
password: zabbix
```

### Zabbix Agent

```bash
# CentOS 7.3, Zabbix Agent 3.2

# 安装 Yum Repo
rpm -ivh http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm

# 安装 Zabbix Agent
yum install zabbix-agent -y

# 关闭 SELinux 和防火墙
setenforce 0 && systemctl stop firewalld

# 启动 Zabbix Agent
systemctl start zabbix-agent

# 配置 Zabbix Server 的连接信息
$ vim /etc/zabbix/zabbix_agentd.conf
# Zabbix Server 的 IP 地址
Server=192.168.31.134
ServerActive=192.168.31.134
# 当前主机（被监控）的名称，必须与 Zabbix Wed 端配置的一致。
Hostname=Nginx

# 配置完成后可以在 Zabbix Server 执行以下命令测试连接情况
# 192.168.31.211 是被监控的主机
zabbix_get -s 192.168.31.211 -p 10050 -k "system.cpu.load[all,avg1]"
```

## Commands

```bash
# 启动/停止/重启 Zabbix Server
systemctl start zabbix-server
systemctl stop zabbix-server
systemctl restart zabbix-server

# 启动/停止/重启 Zabbix Agent
systemctl start zabbix-agent
systemctl stop zabbix-agent
systemctl restart zabbix-agent
```

[zabbix_server](https://www.zabbix.com/documentation/3.2/manpages/zabbix_server)

[zabbix_agentd](https://www.zabbix.com/documentation/3.2/manpages/zabbix_agentd)

[zabbix_get](https://www.zabbix.com/documentation/3.2/manpages/zabbix_get)

```bash
zabbix_get -h
man zabbix_get

# 获取被监控主机的数据
zabbix_get -s 192.168.122.188 -p 10050 -k "system.cpu.load[all,avg1]"
```

## Files

Zabbix Server 配置文件 `/etc/zabbix/zabbix_server.conf`

Zabbix Agent 配置文件 `/etc/zabbix/zabbix_agentd.conf`

## Configurations

[Zabbix server](https://www.zabbix.com/documentation/3.2/manual/appendix/config/zabbix_server)

- DBHost
- DBName
- DBPassword
- DBUser

[Zabbix agent (UNIX)](https://www.zabbix.com/documentation/3.2/manual/appendix/config/zabbix_agentd)

- Hostname
- Server
- ServerActive
- UserParameter

## References

[Items](https://www.zabbix.com/documentation/3.2/manual/config/items)

[Item types](https://www.zabbix.com/documentation/3.2/manual/config/items/itemtypes)

[Templates](https://www.zabbix.com/documentation/3.2/manual/config/templates)

[Supported trigger functions](https://www.zabbix.com/documentation/3.2/manual/appendix/triggers/functions)

## Tutotials

<https://www.zabbix.com/documentation/3.2/manual/quickstart>

## [Templates](https://share.zabbix.com/)

[Nginx for Zabbix 3.2](https://share.zabbix.com/cat-app/web-servers/nginx-for-zabbix-3-2)

[MySQL](https://share.zabbix.com/databases/mysql)

[MongoDB](https://share.zabbix.com/databases/mongodb)

[PostgreSQL](https://share.zabbix.com/databases/db_postgresql)

[Redis](https://share.zabbix.com/databases/db_redis)

## Plugins

<https://github.com/spide4k/zatree>

## Others

<http://www.zabbix.org/>

<https://github.com/monitoringartist/zabbix-community-repos>

<https://monitoringartist.github.io/zabbix-searcher/>