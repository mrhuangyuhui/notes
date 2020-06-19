<!-- omit in toc -->
# Rbenv - Docker

- [Run](#run)
- [Build](#build)

<https://hub.docker.com/r/mrhuangyuhui/rbenv>

## Run

```bash
docker run -it mrhuangyuhui/rbenv bash
```

## Build

运行基础镜像

```bash
docker run -it buildpack-deps:buster bash
```

安装 rbenv 和 ruby-build

```bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
```

配置

```bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

# 因为这条语句在 Dockerfile 执行会失败，所以暂时通过容器来创建镜像。
~/.rbenv/bin/rbenv init

echo 'eval "$(rbenv init -)"' >> ~/.bashrc

echo 'if [ -f ~/.bashrc ]; then . ~/.bashrc; fi' >> ~/.bash_profile

source ~/.bash_profile
```

验证安装结果

```bash
rbenv

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
```

创建 rbenv 镜像

```bash
# 4f0232e1b02b 是容器 ID
docker commit 4f0232e1b02b mrhuangyuhui/rbenv:buster

docker tag mrhuangyuhui/rbenv:buster mrhuangyuhui/rbenv:latest

docker login

docker push mrhuangyuhui/rbenv:buster

docker push mrhuangyuhui/rbenv:latest
```

验证创建结果

```bash
docker run -it --rm mrhuangyuhui/rbenv bash
```
