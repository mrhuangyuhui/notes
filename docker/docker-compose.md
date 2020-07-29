<!-- omit in toc -->
# Docker Compose

- [Install](#install)
- [Commands](#commands)
  - [`docker-compose run`](#docker-compose-run)
  - [`docker-compose up`](#docker-compose-up)
- [References](#references)
  - [Docker Compose CLI reference](#docker-compose-cli-reference)
  - [Compose file reference](#compose-file-reference)
- [Examples](#examples)

<https://docs.docker.com/compose/>

## Install

<https://docs.docker.com/compose/install/>

<https://github.com/docker/compose/releases>

下载并安装

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```

检查安装结果

```bash
docker-compose --version
```

## Commands

[Docker Compose CLI reference](https://docs.docker.com/compose/reference/overview/)

查看帮助

```bash
docker-compose
docker-compose -h
docker-compose --help
# 查看子命令帮助
docker-compose up --help
```

### `docker-compose run`

<https://docs.docker.com/compose/reference/run/>

```bash
docker-compose run --help
```

### `docker-compose up`

<https://docs.docker.com/compose/reference/up/>

查看帮助

```bash
docker-compose up --help
```

以后台模式启动

```bash
docker-compose up -d
```

列出容器

```bash
docker-compose ps
```

启动服务容器

```bash
docker-compose start
```

停止服务容器

```bash
docker-compose stop
```

## References

### Docker Compose CLI reference

<https://docs.docker.com/compose/reference/overview/>

### Compose file reference

<https://docs.docker.com/compose/compose-file/>

## Examples

<https://docs.docker.com/compose/django/>

<https://docs.docker.com/compose/rails/>

<https://docs.docker.com/compose/wordpress/>

[Deploying an app to a Swarm](https://github.com/docker/labs/blob/master/beginner/chapters/votingapp.md)
