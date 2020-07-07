<!-- #ruby-tutorial #ruby-example -->
<!-- omit in toc -->
# 《“笨办法”学 Ruby（第 3 版）》学习笔记

- [环境搭建](#%e7%8e%af%e5%a2%83%e6%90%ad%e5%bb%ba)
  - [Docker](#docker)
  - [RVM](#rvm)

## 环境搭建

<!-- #ruby-docker #docker-example -->
### Docker

> 推荐使用 Docker

```bash
# 拉取镜像
docker pull ruby:2.1-alpine

# 直接运行代码
docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp ruby:2.1-alpine ruby example01.rb

# 启动容器的 Shell 交互终端
docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp ruby:2.1-alpine /bin/sh

# 启动容器的 Ruby 交互终端
docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp ruby:2.1-alpine irb
```

<!-- #rvm-example -->
### RVM

> 本地安装推荐使用 RVM，详情请参考笔记 [RVM Manual](/manuals/ruby/rvm-manual.md)。

```bash
# 安装 Ruby 2.1
rvm install 2.1
# 创建项目的 Ruby 环境配置文件
rvm --rvmrc use 2.1
# 验证配置文件
rvm rvmrc trust .rvmrc
```

运行代码

```bash
ruby example01.rb
```

启动 Ruby 交互终端

```bash
irb
```
