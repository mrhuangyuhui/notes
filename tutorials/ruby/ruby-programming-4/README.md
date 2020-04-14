<!-- #ruby-tutorial -->
<!-- omit in toc -->
# 《Ruby 基础教程（第 4 版）》学习笔记

- [环境搭建](#%e7%8e%af%e5%a2%83%e6%90%ad%e5%bb%ba)
  - [Docker](#docker)
  - [RVM](#rvm)
- [API 文档](#api-%e6%96%87%e6%a1%a3)

## 环境搭建

<!-- #ruby-docker #docker-example -->
### Docker

> 推荐使用 Docker

```bash
# 拉取镜像
docker pull ruby:2.0.0-slim

# 直接运行代码
docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp ruby:2.0.0-slim ruby example.rb

# 启动容器的 Shell 交互终端
docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp ruby:2.0.0-slim /bin/bash

# 启动容器的 Ruby 交互终端
docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp ruby:2.0.0-slim irb
```

<!-- #rvm-example -->
### RVM

> 本地安装推荐使用 RVM，详情请参考笔记 [RVM Manual](/manuals/ruby/rvm-manual.md)。

```bash
# 安装 Ruby 2.0
rvm install 2.0
# 创建项目的 Ruby 环境配置文件
rvm --rvmrc use 2.0
# 验证配置文件
rvm rvmrc trust .rvmrc
```

运行代码

```bash
ruby example.rb
```

启动 Ruby 交互终端

```bash
irb
# 简洁模式
irb --simple-prompt
```

## API 文档

<https://rubydocs.org/d/ruby-2-0-0-p648/>
