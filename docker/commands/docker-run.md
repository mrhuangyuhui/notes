# `docker run`

`docker run`

<https://docs.docker.com/engine/reference/commandline/run/>

[Docker run reference](https://docs.docker.com/engine/reference/run/)

```bash
docker run --help
```

> 注意：官方已不推荐使用 [--link](https://docs.docker.com/network/links/) 连接两个容器

Examples

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

映射多个端口

```bash
docker run -it -v `pwd`:/mybook -w /mybook -p 4000:4000 -p 35729:35279 mrhuangyuhui/gitbook sh
```
