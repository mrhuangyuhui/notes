<!-- omit in toc -->
# Ruby Manual

- [Development Environments](#development-environments)
- [Language Reference](#language-reference)
- [Install](#install)
  - [Docker](#docker)
  - [RVM](#rvm)
  - [Mac](#mac)
  - [CentOS](#centos)
  - [Ubuntu](#ubuntu)
  - [ruby-install](#ruby-install)
  - [Source](#source)
- [Version Management](#version-management)
- [Commands](#commands)
  - [`irb`](#irb)
- [Docs](#docs)
- [API](#api)
- [Tutorials](#tutorials)
- [Searches](#searches)

<https://www.ruby-lang.org/>

<https://github.com/ruby/ruby>

<https://github.com/topics/ruby>

<https://github.com/ruby/www.ruby-lang.org>

<https://github.com/ruby/docs.ruby-lang.org>

<https://sourcegraph.com/github.com/ruby/ruby>

<https://ruby-china.org/>

<https://bitnami.com/stack/ruby>

<https://bitnami.com/stack/ruby/containers>

相关笔记：

- [`rubygems-manual.md`](rubygems-manual.md)

## Development Environments

[rvm-manual.md](/manuals/ruby/tools/rvm-manual.md)

[gitpod-manual.md#ruby](/manuals/ide/gitpod-manual.md#ruby)

## Language Reference

> 相关笔记：[Ruby 语言参考](/langs/ruby/README.md)

<!-- #ruby-install -->
## Install

<https://www.ruby-lang.org/zh_cn/documentation/installation/>

<https://www.ruby-lang.org/zh_cn/downloads/>

> 提示：本地安装推荐使用 [RVM](#rvm)

<!-- #ruby-docker -->
### Docker

<https://hub.docker.com/_/ruby>

<https://bitnami.com/stack/ruby/containers>

```bash
docker pull ruby:2.7.1-alpine3.10
```

```bash
docker run -it --rm -v `pwd`:/usr/src/app
```

### RVM

参考笔记 [RVM Manual](rvm-manual.md)

### Mac

> 提示：推荐使用 [RVM](#rvm)，另外，千万不要删除操作系统预装的 Ruby，许多软件需要用到！！！

### CentOS

> 提示：推荐使用 [RVM](#rvm)

<https://www.ruby-lang.org/en/documentation/installation/#yum>

```bash
sudo yum install ruby
```

### Ubuntu

> 提示：推荐使用 [RVM](#rvm)

<https://www.ruby-lang.org/en/documentation/installation/#apt>

```bash
sudo apt-get install ruby-full
```

### ruby-install

参考笔记 [ruby-install](ruby-install.md)

### Source

<https://www.ruby-lang.org/zh_cn/documentation/installation/#building-from-source>

[下载 Ruby](https://www.ruby-lang.org/zh_cn/downloads/)

[各系统的依赖包](https://github.com/rbenv/ruby-build/wiki#suggested-build-environment)

CentOS

```bash
## CentOS 7.3

# 安装依赖
yum install -y gcc-6 bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel

# 编译安装
./configure
make
sudo make install
```

Ubuntu

```bash
# 安装依赖
apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev

# 编译安装
./configure
make
sudo make install
```

## Version Management

<https://rvm.io/gemsets>

[chruby](https://github.com/postmodern/chruby)

[rbenv](rbenv-manual.md)

<!-- #ruby-cmd -->
## Commands

### `irb`

Ruby 交互式终端

```bash
irb -h
irb --help
```

启动

```bash
irb
```

## Docs

<!-- #ruby-api -->
## API

[Index of Files, Classes & Methods in Ruby 2.7.1 (Ruby 2.7.1)](https://ruby-doc.org/core-2.7.1/)

[Official API Documentation](https://docs.ruby-lang.org/en/)

[Ruby-Doc.org: Documenting the Ruby Language](https://ruby-doc.org/)

- [Ruby Core Reference](http://www.ruby-doc.org/core)
- [Ruby Standard Library Reference](http://www.ruby-doc.org/stdlib)

<https://ruby-doc.com/search.html>

[Ruby 2.6 documentation — DevDocs](https://devdocs.io/ruby~2.6/)

[RubyDocs - Fancy docs for any Ruby project](https://rubydocs.org/)

[RubyDoc.info: Documenting RubyGems, Stdlib, and GitHub Projects](https://www.rubydoc.info/gems)

<!-- #ruby-tutorial -->
## Tutorials

[Ruby 电子书](http://mrhuangyuhui.gitee.io/ruby-books/)

[Ruby 基础教程（第 5 版）| 京东图书](https://item.jd.com/12239070.html)

[Ruby 基础教程（第 5 版）| 图灵社区](https://www.ituring.com.cn/book/1843)

[Ruby 基础教程（第 4 版）](/tutorials/ruby/ruby-programming-4/README.md)

[“笨办法”学 Ruby（第 3 版）](/tutorials/ruby/learn-ruby-the-hard-way-3/README.md)

[The Definitive Ruby Tutorial For Complete Beginners](https://www.rubyguides.com/ruby-tutorial/)

[Learn Ruby](https://www.tutorialspoint.com/ruby/index.htm)

[Programming Ruby](http://www.ruby-doc.org/docs/ProgrammingRuby/)

[The Ruby Programming Wikibook](http://en.wikibooks.org/wiki/Ruby_programming_language)

## Searches

<https://ruby-doc.com/search.html>

<https://sourcegraph.com/github.com/ruby/ruby>

Google Advanced Search

```
"ruby" site:docs.ruby-lang.org
```

Chrome Search Engine

```
https://www.google.com/search?as_q=%s&as_sitesearch=docs.ruby-lang.org
```
