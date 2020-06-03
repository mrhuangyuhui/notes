# `docker exec`

`docker exec`

```
$ docker exec --help

Usage: docker exec [OPTIONS] CONTAINER COMMAND [ARG...]

Run a command in a running container

Options:
  -d, --detach               Detached mode: run command in the background
  -e, --env list             Set environment variables
  -i, --interactive          Keep STDIN open even if not attached
  -t, --tty                  Allocate a pseudo-TTY
  -u, --user string          Username or UID (format:
                             <name|uid>[:<group|gid>])
  -w, --workdir string       Working directory inside the container
```

Examples:

```bash
# 在运行中的容器内执行命令
docker exec MyWordPress ps aux

# 登录运行中的容器
docker exec -it MyWordPress /bin/bash
```
