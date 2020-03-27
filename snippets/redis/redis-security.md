# Redis - Security

配置服务器的安全密码

```bash
$ vim /etc/redis/6379.conf
requirepass 666666
```

```bash
# 启动服务器
$ redis-server /etc/redis/6379.conf

# 启动交互终端
$ redis-cli -p 6379
127.0.0.1:6379> set hello redis
# 需要输入密码才能进行操作
(error) NOAUTH Authentication required.
# 输入密码
127.0.0.1:6379> auth 666666
OK
# 操作正常
127.0.0.1:6379> set hello redis
OK
127.0.0.1:6379> get hello
"redis"
```

官方文档

- [Security](https://redis.io/topics/security)