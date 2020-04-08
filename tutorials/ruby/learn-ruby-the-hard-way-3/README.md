<!-- #ruby-tutorial #ruby-example -->
# 《“笨办法”学 Ruby（第 3 版）》学习笔记

## 环境部署

<!-- #ruby-docker #docker-example -->
### Docker

推荐使用 Docker

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

### Mac

[安装 Ruby](/manuals/ruby/ruby-manual.md#install)

运行代码

```bash
ruby example01.rb
```

启动 Ruby 交互终端

```bash
irb
```
