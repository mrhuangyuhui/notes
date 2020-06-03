# `docker start`

```
$ docker start --help

Usage: docker start [OPTIONS] CONTAINER [CONTAINER...]

Start one or more stopped containers

Options:
  -a, --attach               Attach STDOUT/STDERR and forward signals
      --detach-keys string   Override the key sequence for detaching a
                             container
  -i, --interactive          Attach container's STDIN
```

Examples:

```bash
# 启动停止的容器
docker start 1023600572fd
docker start MyWordPress

# 附带交互终端
docker start -i 1023600572fd
```
