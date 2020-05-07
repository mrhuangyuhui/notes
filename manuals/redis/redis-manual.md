<!-- omit in toc -->
# Redis Manual

- [Install](#install)
  - [Docker](#docker)
  - [Source](#source)
  - [YUM](#yum)
  - [APT](#apt)
- [Commands](#commands)
- [Configurations](#configurations)
  - [Redis Server](#redis-server)
  - [Redis Sentinel](#redis-sentinel)
- [References](#references)
- [Clients](#clients)
  - [Java](#java)
- [Tools](#tools)
- [GUI](#gui)
- [Tutorials](#tutorials)

<https://redis.io/>

<https://redis.io/documentation>

<https://github.com/antirez/redis>

<http://try.redis.io>

## Install

<https://redis.io/download>

<http://download.redis.io/releases/>

### Docker

<https://hub.docker.com/_/redis>

```bash
docker pull redis:6.0.1-alpine3.11
```

```bash
docker run -p 6379:6379 -d redis:6.0.1-alpine3.11
```

### Source

<https://github.com/antirez/redis#installing-redis>

快速安装

```bash
# CentOS 7.3/7.4
curl -L https://gitee.com/mrhuangyuhui/redis/raw/master/install-redis-source.sh | bash
```

创建配置文件

一、手动创建

<https://gitee.com/mrhuangyuhui/redis/blob/master/6379.conf>

```bash
wget https://gitee.com/mrhuangyuhui/redis/raw/master/6379.conf
mkdir /etc/redis
mv 6379.conf /etc/redis
```

```bash
$ vim /etc/redis/6379.conf
daemonize yes
pidfile /var/run/redis_6379.pid
port 6379
logfile /var/log/redis_6379.log
dbfilename dump.rdb
dir /var/lib/redis/6379
```

二、自动创建

在源码目录下执行工具脚本 `utils/install_server.sh`，以交互方式指定配置项的值。

<https://github.com/antirez/redis/blob/4.0/utils/install_server.sh>

<https://github.com/antirez/redis/blob/3.0/utils/install_server.sh>

```bash
# 4.x 版本可在安装脚本中提供以下环境变量，自动执行 install_server.sh 生成配置文件。
# 3.x 版本需要手动在命令行指定以下环境变量，并执行脚本 install_server.sh。
export REDIS_HOME=/usr/local/redis/current
export PORT=6379
export REDIS_PORT=$PORT
export REDIS_CONFIG_FILE="${REDIS_HOME}/etc/${PORT}.conf"
export REDIS_LOG_FILE="${REDIS_HOME}/log/${PORT}.log"
export REDIS_DATA_DIR="${REDIS_HOME}/data/${PORT}"
export REDIS_EXECUTABLE="${REDIS_HOME}/bin/redis-server"

# 在源码目录执行脚本
[root@localhost redis-3.0.7]$ utils/install_server.sh
# 默认配置
Port           : 6379
Config file    : /etc/redis/6379.conf
Log file       : /var/log/redis_6379.log
Data dir       : /var/lib/redis/6379
Executable     : /usr/local/bin/redis-server
Cli Executable : /usr/local/bin/redis-cli
```

启动服务器，端口默认是 6379。

```bash
redis-server
```

验证安装和启动结果

```bash
netstat -tulnp | grep redis

$ redis-cli -h 127.0.0.1 -p 6379 ping
PONG
```

关闭服务器

```bash
redis-cli shutdown

# 或在交互终端内执行
127.0.0.1:6379> shutdown
```

启动交互终端，默认连接 6379 端口的服务器。

```bash
$ redis-cli
# 查看帮助
127.0.0.1:6379> help
127.0.0.1:6379> set foo bar
OK
127.0.0.1:6379> get foo
"bar"
```

### YUM

```bash
# 查看软件包
yum info redis
# 安装
yum install epel-release -y && yum install redis -y
# 查看安装文件
rpm -ql redis
# 卸载
yum erase redis
```

### APT

```bash
# 安装
apt-get update && apt-get install redis-server -y
# 查看安装文件
dpkg -L redis-server
```

## Commands

启动服务器

```bash
# 使用默认配置
redis-server

# 指定配置文件
redis-server /etc/redis/6379.conf
# 指定端口
redis-server --port 7777
# 指定复制主节点
redis-server --port 7777 --slaveof 127.0.0.1 8888
```

关闭服务器

```bash
redis-cli shutdown

# 或在交互终端内执行
127.0.0.1:6379> shutdown
```

验证服务器是否正常运行

```bash
$ redis-cli -h 127.0.0.1 -p 6379 ping
PONG
```

启动交互终端

```bash
$ redis-cli
# 查看帮助
127.0.0.1:6379> help
```

`redis-server`

```bash
redis-server -h

redis-server -v
```

`redis-cli`

[Redis-cli](https://redis.io/topics/rediscli)

```bash
redis-cli --help
```

## [Configurations](https://redis.io/topics/config)

### Redis Server

配置方式一：配置文件

手动创建或自动创建配置文件，详情查看安装部分。

官方文档

- [redis.conf for Redis 4.0](https://raw.githubusercontent.com/antirez/redis/4.0/redis.conf)
- [redis.conf for Redis 3.0](https://raw.githubusercontent.com/antirez/redis/3.0/redis.conf)

我的注释

- [redis-3.0.7.conf](https://gitee.com/mrhuangyuhui/notes/blob/master/configs/redis/redis-3.0.7.conf)

```bash
# 指定配置文件启动服务器
redis-server /etc/redis/6379.conf
```

配置方式二：命令行选项

临时配置，服务器重启后失效。

```bash
redis-server --port 6380 --slaveof 127.0.0.1 6379
```

配置方式三：交互终端命令

临时配置，服务器重启后失效。

相关命令

- [CONFIG SET](https://redis.io/commands/config-set)
- [CONFIG GET](https://redis.io/commands/config-get)

### Redis Sentinel

- [Sentinel](https://redis.io/topics/sentinel)
- [sentinel-3.0.conf](https://github.com/antirez/redis/blob/3.0/sentinel.conf)
- [sentinel-4.0.conf](https://github.com/antirez/redis/blob/4.0/sentinel.conf)

## [References](https://redis.io/documentation)

[Commands](https://redis.io/commands)

[Redis-cli](https://redis.io/topics/rediscli)

[Replication](https://redis.io/topics/replication)

[Persistence](https://redis.io/topics/persistence)

[High Availability](https://redis.io/topics/sentinel)

[Security](https://redis.io/topics/security)

[Redis Cheat Sheet](https://www.cheatography.com/tasjaevan/cheat-sheets/redis/)

## [Clients](https://redis.io/clients)

### [Java](https://redis.io/clients#java)

<https://github.com/xetorthio/jedis>

## Tools

<https://github.com/CodisLabs/codis>

<https://github.com/sohutv/cachecloud>

<https://github.com/vipshop/redis-migrate-tool>

<https://github.com/jcoleman/tomcat-redis-session-manager>

## GUI

[Redis Desktop Manager](https://redisdesktop.com/)

## Tutorials

<https://gitee.com/mrhuangyuhui/notes/blob/master/imooc/class-117/ch13.md>