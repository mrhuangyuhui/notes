<!-- omit in toc -->
# Rbenv - Docker

- [Build](#build)
- [Run](#run)

<https://hub.docker.com/r/mrhuangyuhui/rbenv>

## Build

运行 Docker 基础镜像

```bash
docker pull ruby:2.7.1-buster

docker run -it ruby:2.7.1-buster bash
```

安装 rbenv 和 ruby-build

```bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
```

配置

```bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

~/.rbenv/bin/rbenv init

echo 'eval "$(rbenv init -)"' >> ~/.bashrc

source ~/.bashrc

echo 'if [ -f ~/.bashrc ]; then . ~/.bashrc; fi' >> ~/.bash_profile
```

验证安装结果

```bash
rbenv

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
```

创建 rbenv 镜像

```bash
docker commit bdead9415952 mrhuangyuhui/rbenv:buster

docker tag mrhuangyuhui/rbenv:buster mrhuangyuhui/rbenv:latest

docker login

docker push mrhuangyuhui/rbenv:buster

docker push mrhuangyuhui/rbenv:latest
```

验证创建结果

```bash
docker run -it --rm mrhuangyuhui/rbenv bash
```

## Run

```bash
docker run -it mrhuangyuhui/rbenv bash
```
