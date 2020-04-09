<!-- #ruby-install -->
<!-- omit in toc -->
# RVM Manual

- [Install](#install)
  - [CentOS](#centos)
  - [Mac](#mac)
- [Uninstall](#uninstall)
- [Commands](#commands)
  - [ruby installation](#ruby-installation)
    - [`rvm install`](#rvm-install)
    - [`rvm list`](#rvm-list)
    - [`rvm remove`](#rvm-remove)
    - [`rvm requirements`](#rvm-requirements)
    - [`rvm uninstall`](#rvm-uninstall)
  - [running different ruby versions](#running-different-ruby-versions)
    - [`rvm current`](#rvm-current)
    - [`rvm gemdir`](#rvm-gemdir)
    - [`rvm use`](#rvm-use)
  - [managing gemsets](#managing-gemsets)
    - [`rvm gemset`](#rvm-gemset)
  - [rvm configuration](#rvm-configuration)
    - [`rvm alias`](#rvm-alias)
  - [rvm maintenance](#rvm-maintenance)
    - [`rvm get`](#rvm-get)
    - [`rvm reset`](#rvm-reset)
- [Gemsets](#gemsets)

<http://rvm.io/>

<https://github.com/rvm/rvm>

The Basics of RVM
http://rvm.io/rvm/basics

Upgrading RVM
http://rvm.io/rvm/upgrading

Examples of using RVM
http://rvm.io/workflow/examples

Cheat Sheet
http://cheat.errtheblog.com/s/rvm

RVM CLI Usage
http://rvm.io/rvm/cli

RVM Best Practices
http://rvm.io/rvm/best-practices

Myths
http://rvm.io/rvm/myths

<!-- #rvm-install -->
## Install

<http://rvm.io/rvm/install>

### CentOS

```bash
## CentOS 7.3

gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Install RVM stable with ruby:
curl -sSL https://get.rvm.io | bash -s stable --ruby

source /usr/local/rvm/scripts/rvm
```

检查安装结果

```bash
rvm
rvm list known

ruby -v
which ruby
```

### Mac

```bash
curl -sSL https://get.rvm.io | bash
```

## Uninstall

```bash
rvm implode
```

## Commands

```bash
rvm
rvm -h
rvm --help
rvm help
rvm help install
```

### ruby installation

#### `rvm install`

<https://rvm.io/rubies/installing/>

<https://rvm.io/rubies/upgrading>

```bash
rvm help install
```

```bash
rvm install 2.1
```

> 提示：在 Mac 上安装时，如果出现 `There was an error while trying to resolve rubygems version for 'latest'.` 的提示，可忽略!

#### `rvm list`

<https://rvm.io/rubies/list>

```bash
rvm help list
```

To list all *known* RVM installable Rubies

```bash
rvm list known
```

To list all installed rubies

```bash
rvm list rubies
```

To list the default ruby

```bash
rvm list default
```

#### `rvm remove`

<http://rvm.io/rubies/removing>

remove ruby and downloaded sources

#### `rvm requirements`

installs dependencies for building ruby

#### `rvm uninstall`

uninstall ruby, keeping it's sources.

<http://rvm.io/rubies/uninstalling>

### running different ruby versions

#### `rvm current`

print current ruby version and name of used gemsets

```bash
$ rvm current
ruby-2.6.3
```

#### `rvm gemdir`

display path to current gem directory (`$GEM_HOME`)

```bash
$ rvm gemdir
/home/ubuntu/.rvm/gems/ruby-2.6.3
```

#### `rvm use`

切换版本

```bash
rvm use 2.4
```

切换版本 + 设置默认版本 <http://rvm.io/rubies/default>

```bash
rvm --default use 2.1.1
```

设置默认版本

```bash
rvm alias create default 2.1.1
```

切换为默认版本

```bash
rvm use default
```

切换为系统版本

```bash
rvm use system
```

切换为系统版本 + 设置系统版本为默认版本

```bash
rvm reset
```

### managing gemsets

#### `rvm gemset`

### rvm configuration

#### `rvm alias`

define aliases for `rvm use`

<https://rvm.io/rubies/alias/>

```bash
rvm help alias
```

创建别名

```bash
# 设置默认版本
rvm alias create default 2.1.1
# 使用默认版本 2.1.1
rvm use default
```

列出所有别名

```bash
rvm alias list
```

删除别名

```bash
rvm alias delete dotnet
```

### rvm maintenance

#### `rvm get`

upgrades RVM to latest head, stable or branched version

```bash
rvm get stable
```

#### `rvm reset`

切换为系统版本 + 设置系统版本为默认版本

```bash
rvm reset
```

<!-- #ruby-env -->
## Gemsets

<https://rvm.io/gemsets>

```bash
rvm help gemset
```
