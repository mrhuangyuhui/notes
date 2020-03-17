# Docker Manual

<https://www.docker.com/>

<https://docs.docker.com/>

<https://docs.docker.com/get-started/>

<https://docs.docker.com/reference/>

<https://docs.docker.com/samples/>

<https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf>

<https://github.com/wsargent/docker-cheat-sheet>

<https://www.linode.com/docs/applications/containers/docker-commands-quick-reference-cheat-sheet/>

[Docker 国内仓库和镜像](https://www.cnblogs.com/wushuaishuai/p/9984228.html)

## [Install](https://docs.docker.com/install/)

### Ubuntu

[Get Docker Engine - Community for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

<https://asciinema.org/a/310570>

### Mac

[Install Docker Desktop on Mac](https://docs.docker.com/docker-for-mac/install/)

[Docker for Mac release notes](https://docs.docker.com/docker-for-mac/release-notes/)

[Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/)

非 root 用户授权

```bash
ubuntu$ sudo usermod -aG docker ubuntu

ubuntu$sudo chmod a+rw /var/run/docker.sock
# 重启 docker 服务
ubuntu$sudo systemctl restart docker
```

## Commands

查看帮助

```bash
docker --help

# 查看子命令的帮助
docker container --help
```

查看版本

```bash
docker version
docker -v
docker --version
```

```bash
docker build -t friendlyname .  # Create image using this directory's Dockerfile
docker run -p 4000:80 friendlyname  # Run "friendlyname" mapping port 4000 to 80
docker run -d -p 4000:80 friendlyname         # Same thing, but in detached mode
docker container ls                                # List all running containers
docker container ls -a             # List all containers, even those not running
docker container stop <hash>           # Gracefully stop the specified container
docker container kill <hash>         # Force shutdown of the specified container
docker container rm <hash>        # Remove specified container from this machine
docker container rm $(docker container ls -a -q)         # Remove all containers
docker image ls -a                             # List all images on this machine
docker image rm <image id>            # Remove specified image from this machine
docker image rm $(docker image ls -a -q)   # Remove all images from this machine
docker login             # Log in this CLI session using your Docker credentials
docker tag <image> username/repository:tag  # Tag <image> for upload to registry
docker push username/repository:tag            # Upload tagged image to registry
docker run username/repository:tag                   # Run image from a registry
```

列出可用镜像

```bash
docker images
# 或
docker image ls
```

列出所有容器

```bash
docker container ls
```

停止容器

```bash
docker container stop aac8bbf781ea
```

登录 Docker

```bash
docker login
```

查看版本

```bash
docker --version
```

给镜像打标签

```bash
docker tag friendlyhello john/get-started:part2
```

提交镜像

```bash
docker push mrhuangyuhui/get-started:part2
```

列出所有服务

```bash
docker service ls
```

查看服务内的进程

```bash
docker service ps getstartedlab_web
```

下线服务栈

```bash
docker stack rm getstartedlab
```

### [`docker attach`](https://docs.docker.com/engine/reference/commandline/attach/)

```bash
docker attach --help
```

```bash
docker run -dit --name alpine1 alpine ash

docker attach alpine1
```

### [`docker build`](https://docs.docker.com/engine/reference/commandline/build/)

```bash
docker build --help
```

[`.dockerignore` file](https://docs.docker.com/engine/reference/builder/#dockerignore-file)

[Use a `.dockerignore` file](https://docs.docker.com/engine/reference/commandline/build/#use-a-dockerignore-file)

### [`docker commit`](https://docs.docker.com/engine/reference/commandline/commit/)

查看帮助

```bash
docker commit --help
```

Examples:

```bash
# 提交容器变更创建新镜像
docker commit f58a79f0d37b mrhuangyuhui/ping
```

### [`docker container`](https://docs.docker.com/engine/reference/commandline/container/)

```bash
docker container ls
```

```bash
docker container run ruby
```

#### [`docker container cp`](https://docs.docker.com/engine/reference/commandline/container_cp/)

### `docker create`

```bash
$ docker create --name my-nginx \
  --network my-net \
  --publish 8080:80 \
  nginx:latest
```

### `docker exec`

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

### `docker inspect`

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

### `docker logs`

```
$ docker logs --help

Usage: docker logs [OPTIONS] CONTAINER

Fetch the logs of a container

Options:
  -f, --follow         Follow log output
```

Examples:

```bash
# 查看容器的日志
docker logs MyWordPress
```

### [`docker network`](https://docs.docker.com/engine/reference/commandline/network/)

```bash
docker network --help
```

#### [`docker network connect`](https://docs.docker.com/engine/reference/commandline/network_connect/)

```bash
docker network connect my-net my-nginx
```

#### [`docker network create`](https://docs.docker.com/engine/reference/commandline/network_create/)

```bash
docker network create my-net

docker network create --driver bridge alpine-net
```

#### [`docker network disconnect`](https://docs.docker.com/engine/reference/commandline/network_disconnect/)

```bash
docker network disconnect my-net my-nginx
```

#### [`docker network inspect`](https://docs.docker.com/engine/reference/commandline/network_inspect/)

```bash
docker network inspect bridge
docker network inspect alpine-net
```

#### [`docker network rm`](https://docs.docker.com/engine/reference/commandline/network_rm/)

```bash
docker network rm my-net
```

### `docker port`

```
$ docker port --help

Usage:  docker port CONTAINER [PRIVATE_PORT[/PROTO]]

List port mappings or a specific mapping for the container
```

### `docker ps`

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

### `docker pull`

查看帮助

```bash
docker pull --help
```

下载镜像

```bash
docker pull learn/tutorial
```

### `docker push`

```
$ docker push --help

Usage: docker push [OPTIONS] NAME[:TAG]

Push an image or a repository to a registry
```

Examples:

```bash
docker push mrhuangyuhui/ping

docker push mrhuangyuhui/rails
```

### `docker rm`

查看帮助

```bash
docker ps --help
```

```bash
# 删除容器
docker rm daemon_dave

# 删除所有停止的容器
docker rm `docker ps -a -q`

# 删除所有容器，包括正在运行的容器。
docker rm -f `docker ps -a -q`
```

### [`docker run`](https://docs.docker.com/engine/reference/commandline/run/)

[Docker run reference](https://docs.docker.com/engine/reference/run/)

```bash
docker run --help
```

> 注意：官方已不推荐使用 [--link](https://docs.docker.com/network/links/) 链接两个容器

#### Examples

- 循序渐进学 Docker

```bash
docker run --name db --env MYSQL_ROOT_PASSWORD=example -d mariadb

docker run --name MyWordPress --link db:mysql -p 8080:80 -d wordpress
```

```bash
docker run learn/tutorial echo "hello world"

docker run learn/tutorial apt-get install -y ping
```

- 我的第一本 Docker 书

```bash
# 运行一个容器，执行/bin/bash命令，使用的镜像是ubuntu，-i表示打开标准输入，-t表示打开伪tty终端。
docker run -i -t ubuntu /bin/bash

# 运行一个容器，并指定名字gray_cat。
docker run -i -t --name gray_cat ubuntu /bin/bash

# 运行一个守护式容器
docker run -d ubuntu /bin/sh -c "while true; do echo hello world; sleep 1; done"

# 挂载宿主机的卷，并开启访问权限。
docker run -it -v $PWD/website:/tmp/test/:rw --privileged=true  docker.io/centos /bin/bash
```

- <https://github.com/docker/labs/blob/master/beginner/chapters/alpine.md>

```bash
docker run alpine ls -l

docker run alpine echo "hello from alpine"

# -it 交互终端
docker run -it alpine /bin/sh
```

### [`docker service`](https://docs.docker.com/engine/reference/commandline/service/)

查看帮助

```bash
docker service --help
# 查看子命令帮助
docker service create --help
```

#### [`docker service ps`](https://docs.docker.com/engine/reference/commandline/service_ps/)

```bash
docker service ps my-nginx
```

### `docker start`

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

### `docker stop`

```
$ docker stop --help

Usage: docker stop [OPTIONS] CONTAINER [CONTAINER...]

Stop one or more running containers
```

Examples:

```bash
# 停止运行的容器
docker stop 1023600572fd
```

### [`docker tag`](https://docs.docker.com/engine/reference/commandline/tag/)

查看帮助

```bash
docker tag --help
```

## Dockerfile

[Dockerfile reference](https://docs.docker.com/engine/reference/builder/)

[`.dockerignore` file](https://docs.docker.com/engine/reference/builder/#dockerignore-file)

[Use a `.dockerignore` file](https://docs.docker.com/engine/reference/commandline/build/#use-a-dockerignore-file)

## Docker Compose

[Docker Compose](./docker-compose.md)

## References

<https://docs.docker.com/reference/>

[Docker CLI(docker)](https://docs.docker.com/engine/reference/commandline/docker/)

[Docker Compose CLI reference](https://docs.docker.com/compose/reference/overview/)

[Dockerfile reference](https://docs.docker.com/engine/reference/builder/)

## Guides

[Develop with Docker](https://docs.docker.com/develop/)

[Docker development best practices](https://docs.docker.com/develop/dev-best-practices/)

[Configure networking](https://docs.docker.com/network/)

[Use bridge networks](https://docs.docker.com/network/bridge/)

<https://12factor.net/>

### Configs

[Store configuration data using Docker Configs](https://docs.docker.com/engine/swarm/configs/)

### Dockerfiles

[Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

[Use multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/)

[Dockerfile reference](https://docs.docker.com/engine/reference/builder/)

[Builder pattern vs. Multi-stage builds in Docker](https://blog.alexellis.io/mutli-stage-docker-builds/)

### Secrets

[Manage sensitive data with Docker secrets](https://docs.docker.com/engine/swarm/secrets/)

### Volumes

[volumes](https://docs.docker.com/compose/compose-file/#volumes)

## Tutorials

<https://docs.docker.com/get-started/>

<https://github.com/docker/labs>

<https://github.com/play-with-docker/play-with-docker>

<https://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html>

[12 Factor Application](https://github.com/docker/labs/tree/master/12factor)

### Network

[Networking overview](https://docs.docker.com/network/)

[Use bridge networks](https://docs.docker.com/network/bridge/)

[Bridge network tutorial](https://docs.docker.com/network/network-tutorial-standalone/)

[Use overlay networks](https://docs.docker.com/network/overlay/)

[Overlay networking tutorial](https://docs.docker.com/network/network-tutorial-overlay/)

## Samples

<https://docs.docker.com/samples/>

## Images

[Official Images](https://hub.docker.com/search?image_filter=official&type=image)

## GUI

<https://kitematic.com/>（已停更）

<https://www.portainer.io/>

<https://dockstation.io/>
