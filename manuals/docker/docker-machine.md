# Docker Machine

<https://docs.docker.com/machine/overview/>

<https://docs.docker.com/machine/get-started/>

<https://github.com/boot2docker/boot2docker>

## Install

<https://docs.docker.com/machine/install-machine/>

<https://github.com/docker/machine/releases/>

```bash
$ curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
```

检查安装结果

```bash
docker-machine -v
```

## Commands

<https://docs.docker.com/machine/reference/>

查看帮助

```bash
docker-machine -h
docker-machine --help
docker-machine help
# 查看子命令帮助
docker-machine create --help
docker-machine help create
```

设置 Docker client 的环境变量

```bash
eval $(docker-machine env default)
```

删除 Docker client 的环境变量

```bash
eval $(docker-machine env -u)
```

### `docker-machine create`

```bash
docker-machine create --help
# 查看指定驱动的帮助
docker-machine create --driver virtualbox --help
docker-machine create --driver digitalocean --help
```

```bash
docker-machine create --driver virtualbox default
```

```bash
# You can register an already existing docker host by passing the daemon url. With that, you can have the same workflow as on a host provisioned by docker-machine.
docker-machine create --driver none --url=tcp://50.134.234.20:2376 custombox
```

### `docker-machine env`

```bash
docker-machine env --help
```

```bash
docker-machine env default
```

```bash
docker-machine env -u
```

### `docker-machine ip`

```bash
docker-machine ip --help
```

```bash
docker-machine ip default
```

### `docker-machine ls`

```bash
docker-machine ls --help
```

```bash
docker-machine ls
```

### `docker-machine start`

```bash
docker-machine start --help
```

```bash
docker-machine start default
```

### `docker-machine stop`

```bash
docker-machine stop --help
```

```bash
docker-machine stop default
```

## Drivers

[Machine drivers](https://docs.docker.com/machine/drivers/)

- [Amazon Web Services](https://docs.docker.com/machine/drivers/aws/)
- [VMware Fusion](https://docs.docker.com/machine/drivers/vm-fusion/)

[Available driver plugins](https://github.com/docker/docker.github.io/blob/master/machine/AVAILABLE_DRIVER_PLUGINS.md)

[Driver options and operating system defaults](https://docs.docker.com/machine/drivers/os-base/)
