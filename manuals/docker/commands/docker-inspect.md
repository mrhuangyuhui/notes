# `docker inspect`

```
$ docker inspect --help

Usage:  docker inspect [OPTIONS] NAME|ID [NAME|ID...]

Return low-level information on Docker objects
```

Examples:

```bash
# 查看容器信息
docker inspect 291d0ffecb32

## https://github.com/docker/labs/blob/master/beginner/chapters/alpine.md

# alpine 是一个镜像
docker inspect alpine
```
