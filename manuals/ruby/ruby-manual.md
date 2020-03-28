# Ruby Manual

<https://www.ruby-lang.org/>

<https://ruby-china.org/>

<http://ruby-doc.org/>

<https://bitnami.com/stack/ruby>

<https://bitnami.com/stack/ruby/containers>

RubyGems 国内镜像 <https://gems.ruby-china.com/>

<https://github.com/fastlane/fastlane>

## Reference

http://ruby-doc.org/core-2.4.2/

http://ruby-doc.org/stdlib-2.4.2/

https://rubydocs.org/

http://docs.rubydocs.org/ruby-2-4-2/

<https://devdocs.io/ruby~2.6/>

## [Install](https://www.ruby-lang.org/zh_cn/documentation/installation/)

<https://www.ruby-lang.org/zh_cn/downloads/>

### `ruby-install`

参考笔记 `ruby-install.md`

### Docker

<https://hub.docker.com/_/ruby>

<https://bitnami.com/stack/ruby/containers>

### CentOS

### APT
```bash
apt-get install ruby-full
```

### YUM
```bash
yum install ruby
```

### RVM

http://rvm.io/

### Others

ruby-install
https://github.com/postmodern/ruby-install

ruby-build
https://github.com/rbenv/ruby-build

### Version Management

chruby
https://github.com/postmodern/chruby

rbenv
https://github.com/rbenv/rbenv

### [Source](https://www.ruby-lang.org/zh_cn/documentation/installation/#building-from-source)

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

## Tutorials

<https://www.rubyguides.com/ruby-tutorial/>