<!-- omit in toc -->
# Redis - Configurations

- [Redis Server](#redis-server)
- [Redis Sentinel](#redis-sentinel)

<https://redis.io/topics/config>

## Redis Server

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

## Redis Sentinel

- [Sentinel](https://redis.io/topics/sentinel)
- [sentinel-3.0.conf](https://github.com/antirez/redis/blob/3.0/sentinel.conf)
- [sentinel-4.0.conf](https://github.com/antirez/redis/blob/4.0/sentinel.conf)