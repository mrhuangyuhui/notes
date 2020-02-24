# Memcached Manual

<http://memcached.org/>

<https://github.com/memcached/memcached>

<https://github.com/memcached/memcached/wiki>

## [Installation](https://github.com/memcached/memcached/wiki/Install)

[所有版本](https://github.com/memcached/memcached/wiki/ReleaseNotes)

[依赖库 `libevent`](http://libevent.org/)

[3-2 Memcached 安装部署](https://coding.imooc.com/lesson/186.html#mid=11494)

### YUM

```bash
yum install -y memcached

# 启动服务
memcached -d -m 10 -u root 192.168.31.194 -p 11211 -c 32 -P /tmp/memcached.pid

# 检查启动情况，默认监听 11211 端口。
$ netstat -tulnp | grep memcached
tcp        0      0 0.0.0.0:11211           0.0.0.0:*               LISTEN      2335/memcached
tcp6       0      0 :::11211                :::*                    LISTEN      2335/memcached
udp        0      0 0.0.0.0:11211           0.0.0.0:*                           2335/memcached
udp6       0      0 :::11211                :::*                                2335/memcached
```

### Source

<http://memcached.org/downloads>

```bash
# 安装依赖库
yum install -y libevent-devel
# 下载、解压、编译、安装
wget http://memcached.org/files/memcached-1.5.8.tar.gz
tar -zxvf memcached-1.5.8.tar.gz
cd memcached-1.5.8
./configure && make && make test && sudo make install
```

## [Commands](https://github.com/memcached/memcached/wiki/Commands)

```bash
memcached -h
man memcached
```

```bash
# 启动服务
memcached -d -m 10 -u root 192.168.31.194 -p 11211 -c 32 -P /tmp/memcached.pid

# 检查启动情况
$ netstat -tulnp | grep memcached
tcp        0      0 0.0.0.0:11211           0.0.0.0:*               LISTEN      2335/memcached
tcp6       0      0 :::11211                :::*                    LISTEN      2335/memcached
udp        0      0 0.0.0.0:11211           0.0.0.0:*                           2335/memcached
udp6       0      0 :::11211                :::*                                2335/memcached
```

连接服务

```bash
telnet localhost 11211
```

返回服务器的统计信息

```bash
stats
```

### `set`

Syntax

```bash
set key flags exptime bytes [noreply]
# 换行输入
value
```

Example

```bash
set tutorialspoint 0 900 9
memcached
```

<https://www.tutorialspoint.com/memcached/memcached_set_data.htm>

### `add`

Syntax

```bash
add key flags exptime bytes [noreply]
# 换行输入
value
```

Example

```bash
add key 0 900 9
memcached
```

<https://www.tutorialspoint.com/memcached/memcached_add_data.htm>

### `replace`

Syntax

```bash
replace key flags exptime bytes [noreply]
# 换行输入
value
```

Example

```bash
replace key 0 900 5
redis
```

<https://www.tutorialspoint.com/memcached/memcached_replace_data.htm>

## References

<https://github.com/memcached/memcached/wiki/ConfiguringServer>

## Tutorials

<https://github.com/memcached/memcached/wiki>

<https://github.com/memcached/memcached/wiki/TutorialCachingStory>

[Learn Memcached](https://www.tutorialspoint.com/memcached/index.htm)

[Tomcat+Memcached/Redis 集群 构建高可用解决方案](https://coding.imooc.com/learn/list/186.html)

- [第 3 章 Memcached 基础及底层机制剖析](https://coding.imooc.com/lesson/186.html#mid=11493)
- [第 5 章 Memcached 服务级调优](https://coding.imooc.com/lesson/186.html#mid=11659)

## Clients

- xmemcached

<https://github.com/killme2008/xmemcached>

```xml
<!-- https://mvnrepository.com/artifact/com.googlecode.xmemcached/xmemcached -->
<dependency>
    <groupId>com.googlecode.xmemcached</groupId>
    <artifactId>xmemcached</artifactId>
    <version>2.4.5</version>
</dependency>
```

- spymemcached

```xml
<!-- https://mvnrepository.com/artifact/net.spy/spymemcached -->
<dependency>
    <groupId>net.spy</groupId>
    <artifactId>spymemcached</artifactId>
    <version>2.12.3</version>
</dependency>
```