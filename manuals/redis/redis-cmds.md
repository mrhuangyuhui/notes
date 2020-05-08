<!-- omit in toc -->
# Redis Commands

- [`redis-server`](#redis-server)
- [`redis-cli`](#redis-cli)
- [Redis Shell](#redis-shell)
  - [`keys`](#keys)
  - [`rpush`](#rpush)

## `redis-server`

```bash
redis-server -h
redis-server --help
```

```bash
redis-server -v
redis-server --version
```

启动服务端

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

## `redis-cli`

<https://redis.io/topics/rediscli>

> 提示：Redis Shell 的命令可以直接作为 `redis-cli` 的子命令来执行，如 `redis-cli ping`。

```bash
redis-cli --help
```

```bash
redis-cli --version
```

启动客户端

```bash
# 默认 -h 127.0.0.1 -p 6379
$ redis-cli
127.0.0.1:6379> help
```

退出客户端

```bash
127.0.0.1:6379> quit
```

关闭服务端

```bash
redis-cli shutdown
# 或
127.0.0.1:6379> shutdown
```

检查服务端是否可连接

```bash
$ redis-cli -h 127.0.0.1 -p 6379 ping
PONG
```

## Redis Shell

<https://redis.io/commands>

### `keys`

```bash
127.0.0.1:6379> keys *
```

### `rpush`

