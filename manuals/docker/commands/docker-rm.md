# `docker rm`

`docker rm`

查看帮助

```bash
docker ps --help
```

```bash
# 删除容器
docker rm daemon_dave

# 删除所有停止的容器
docker rm `docker ps -a -q`
```

删除所有容器，包括正在运行的容器。

```bash
docker rm -f `docker ps -a -q`
```
