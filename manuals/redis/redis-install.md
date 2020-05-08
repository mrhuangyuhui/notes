# Redis - Install

<https://redis.io/download#installation>

## Docker

> 相关笔记：[`manuals/redis/redis-docker.md`](/manuals/redis/redis-docker.md)

## Mac

下载并编译安装包

```bash
mkdir ~/redis

cd ~/redis

wget http://download.redis.io/releases/redis-6.0.1.tar.gz

tar xzf redis-6.0.1.tar.gz

cd redis-6.0.1

make
```

创建符号链接

```bash
cd ~/redis

ln -s redis-6.0.1 current
```

配置 `PATH`

```bash
cat >> ~/.bash_profile << EOF

# Redis
export REDIS_HOME=\$HOME/redis/current
export PATH=\$PATH:\$REDIS_HOME/src

EOF

tail -n 5 ~/.bash_profile

source ~/.bash_profile
```

验证配置结果

```bash
redis-server --help
```

## Source

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

## YUM

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

## APT

```bash
# 安装
apt-get update && apt-get install redis-server -y
# 查看安装文件
dpkg -L redis-server
```
