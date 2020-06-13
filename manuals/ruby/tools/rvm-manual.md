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
  - [`rvm do`](#rvm-do)
    - [`rvm gemdir`](#rvm-gemdir)
    - [`rvm use`](#rvm-use)
  - [managing gemsets](#managing-gemsets)
    - [`rvm gemset`](#rvm-gemset)
  - [rvm configuration](#rvm-configuration)
    - [`rvm alias`](#rvm-alias)
  - [rvm maintenance](#rvm-maintenance)
    - [`rvm get`](#rvm-get)
    - [`rvm reset`](#rvm-reset)
  - [information and documentation](#information-and-documentation)
    - [`rvm info`](#rvm-info)
- [Project Workflow](#project-workflow)
- [Gemsets](#gemsets)
  - [`rvm gemset create`](#rvm-gemset-create)
  - [`rvm gemset use`](#rvm-gemset-use)
  - [`rvm gemset list`](#rvm-gemset-list)
  - [`rvm gemset name`](#rvm-gemset-name)
  - [`rvm gemset delete`](#rvm-gemset-delete)

<http://rvm.io/>

<https://github.com/rvm/rvm>

<https://github.com/rvm/rvm-site>

[The Basics of RVM](http://rvm.io/rvm/basics)

[Upgrading RVM](http://rvm.io/rvm/upgrading)

<!-- #rvm-example -->
[Examples of using RVM](http://rvm.io/workflow/examples)

[RVM Cheat Sheet](http://cheat.errtheblog.com/s/rvm)

[Myths](http://rvm.io/rvm/myths)

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

验证安装结果

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

验证安装结果

```bash
rvm
rvm list known

ruby -v
which ruby
```

## Uninstall

```bash
rvm implode
```

<!-- #rvm-cmd #rvm-example -->
## Commands

<http://rvm.io/rvm/cli>

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

[Examples of using RVM](http://rvm.io/workflow/examples)

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

### `rvm do`

在多版本的 Ruby 环境上执行命令

```bash
rvm help do
```

```bash
rvm all do ruby -v
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
rvm 2.4
rvm use 2.4
# 切换版本并指定 Gemset
rvm 2.1.1@rails410
rvm use 2.1.1@rails410
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

[manage gemsets](#gemsets)

```bash
rvm help gemset
```

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

### information and documentation

#### `rvm info`

<https://rvm.io/rubies/info>

打印当前 Ruby 的详细信息

```bash
rvm help info
```

```bash
rvm info
```

<!-- #ruby-env -->
## Project Workflow

[RVM Best Practices](http://rvm.io/rvm/best-practices)

[Typical RVM Project Workflow](https://rvm.io/workflow/projects)

<https://rvm.io/workflow/rvmrc>

<https://github.com/rvm/rvm/tree/master/examples>

```bash
cd myapp
# 配置项目使用的 Ruby 版本和 Gemset，创建文件 .rvmrc。
rvm --create use 2.7.1@myapp --rvmrc
# 验证配置文件
rvm rvmrc trust .rvmrc
```

<!-- #ruby-env -->
## Gemsets

<https://rvm.io/gemsets>

```bash
rvm help gemset
```

切换 Ruby 版本并指定 Gemset

```bash
rvm 2.1.1@rails410
rvm use 2.1.1@rails410
```

安装 Gem 到当前 Ruby 版本的全局 Gemset <https://rvm.io/gemsets/global>

```bash
rvm @global do gem install rails -v 4.1.0
```

使用当前 Ruby 版本默认的 Gemset，忽略所有配置。

<https://rvm.io/gemsets/ignoring>

```bash
rvm use 1.9.3@my_project --ignore-gemsets
```

### `rvm gemset create`

<https://rvm.io/gemsets/creating>

创建 Gemset

```bash
$ rvm 2.1.1
$ rvm gemset create teddy
Gemset 'teddy' created.
```

同时创建多个 Gemset

```bash
$ rvm 2.1.1
$ rvm gemset create teddy rosie
Gemset 'teddy' created.
Gemset 'rosie' created.
```

切换 Ruby+Gemset 版本的同时创建 Gemset

```bash
rvm use 2.1.1@teddy --create
```

设置默认在切换 Ruby+Gemset 版本的同时创建 Gemset

`~/.rvmrc` 或 `/etc/rvmrc`

```bash
rvm_gemset_create_on_use_flag=1
```

### `rvm gemset use`

<https://rvm.io/gemsets/using>

切换到指定 Gemset

```bash
rvm 2.1.1
# 创建 Gemset
rvm gemset create teddy
# 切换到指定 Gemset
rvm gemset use teddy
```

切换 Ruby 版本 + 指定 Gemset 并设置为默认

```bash
rvm use 2.1.1@teddy --default
```

切换到默认 Gemset

```bash
rvm gemset use default
# 或
rvm use @default
```

切换 Ruby 版本的同时指定 Gemset

```bash
rvm use 2.1.1@teddy
```

### `rvm gemset list`

<https://rvm.io/gemsets/listing>

列出当前 Ruby 版本的所有 Gemset

```bash
rvm gemset list
```

列出所有 Ruby 版本的所有 Gemset

```bash
rvm gemset list_all
```

### `rvm gemset name`

查看当前 Gemset 的名称

```bash
rvm gemset name
```

查看当前 Gemset 的所在目录

```bash
$ rvm gemdir
/Users/rys/.rvm/gems/2.1.1@teddy
```

### `rvm gemset delete`

删除 Gemset

```bash
rvm gemset delete rails410
```