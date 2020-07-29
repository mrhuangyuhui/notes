# `docker ps`

`docker ps`

```
$ docker ps --help

Usage: docker ps [OPTIONS]

List containers

Options:
  -a, --all             Show all containers (default shows just running)
  -l, --latest          Show the latest created container (includes all
                        states)
```

Examples:

```bash
# 列出最近创建过的容器
docker ps -l
```
