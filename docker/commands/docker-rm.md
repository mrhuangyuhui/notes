# `docker rm`

```bash
docker ps --help
```

强制删除所有容器，包括运行中的容器。

```bash
docker rm -f `docker ps -a -q`
```

删除所有停止的容器

```bash
docker rm `docker ps -a -q`
```

删除容器

```bash
docker rm daemon_dave

```

相关命令：

```bash
# 删除所有未挂载的镜像
docker image prune -a
```
