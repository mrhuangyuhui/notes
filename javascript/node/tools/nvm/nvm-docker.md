<!-- omit in toc -->
# NVM - Docker

- [Build](#build)
- [Run](#run)

<https://github.com/mrhuangyuhui/nvm-playground>

<https://hub.docker.com/r/mrhuangyuhui/nvm-playground>

基础镜像

```bash
docker run -it buildpack-deps:stretch bash
```

## Build

下载仓库

```bash
git clone git@github.com:mrhuangyuhui/nvm-playground.git
```

构建镜像

```bash
cd nvm-playground

docker build . -t mrhuangyuhui/nvm-playground:stretch -t mrhuangyuhui/nvm-playground:latest
```

验证结果

```bash
docker images

docker run -it --rm mrhuangyuhui/nvm-playground bash

nvm
```

```bash
docker login

docker push mrhuangyuhui/nvm-playground
```

## Run

```bash
docker run -it mrhuangyuhui/nvm-playground bash

docker run -it --rm mrhuangyuhui/nvm-playground bash
```
