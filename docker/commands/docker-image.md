# `docker image`

## `docker image prune`

Remove all dangling images. If `-a` is specified, will also remove all images not referenced by any container.

```bash
docker image prune -a
```

相关命令：

```bash
# 删除所有容器，包括正在运行的容器。
docker rm -f `docker ps -a -q`
```
