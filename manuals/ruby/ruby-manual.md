<!-- omit in toc -->
# Ruby Manual

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
- [References](#references)
- [Documentation](#documentation)
- [RubyGems](#rubygems)
- [Tutorials](#tutorials)

<https://www.ruby-lang.org/>

<https://ruby-china.org/>

<http://ruby-doc.org/>

<https://bitnami.com/stack/ruby>

<https://bitnami.com/stack/ruby/containers>

RubyGems 国内镜像 <https://gems.ruby-china.com/>

<https://github.com/fastlane/fastlane>

<!-- #ruby-install -->
## Install

<https://www.ruby-lang.org/zh_cn/documentation/installation/>

<https://www.ruby-lang.org/zh_cn/downloads/>

> 提示：本地安装推荐使用 [RVM](#rvm)

<!-- #ruby-docker -->
### Docker

<https://hub.docker.com/_/ruby>

<https://bitnami.com/stack/ruby/containers>

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
<!-- #ruby-ref -->
## References

<https://rubydocs.org/>

http://ruby-doc.org/core-2.4.2/

http://ruby-doc.org/stdlib-2.4.2/

http://docs.rubydocs.org/ruby-2-4-2/

<https://devdocs.io/ruby~2.6/>

## Documentation

Ruby User's Guide
http://www.rubyist.net/~slagell/ruby/

## RubyGems

https://rubygems.org/

https://github.com/rubygems/rubygems

Installation
https://rubygems.org/pages/download

Command Reference
http://guides.rubygems.org/command-reference/

Guides

http://guides.rubygems.org/

http://guides.rubygems.org/rubygems-basics/

Make your own gem
http://guides.rubygems.org/make-your-own-gem/

Specification reference
http://guides.rubygems.org/specification-reference/


FINDING GEMS
```
# 支持正则表达式搜索
$ gem search ^rails

# 查看详细信息
$ gem search ^rails$ -d

```

INSTALLING GEMS
```
$ gem install drip
```

LISTING INSTALLED GEMS
```
$ gem list
```

UNINSTALLING GEMS
```
$ gem uninstall drip
```

FETCHING AND UNPACKING GEMS
```
$ gem fetch malice
$ gem unpack malice-13.gem
```

<!-- #ruby-tutorial -->
## Tutorials

[Ruby 基础教程（第 4 版）](/tutorials/ruby/ruby-programming-4/README.md)

[“笨办法”学 Ruby（第 3 版）](/tutorials/ruby/learn-ruby-the-hard-way-3/README.md)

[The Definitive Ruby Tutorial For Complete Beginners](https://www.rubyguides.com/ruby-tutorial/)

[Learn Ruby](https://www.tutorialspoint.com/ruby/index.htm)
