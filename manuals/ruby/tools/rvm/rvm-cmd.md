<!-- omit in toc -->
# RVM - Commands

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

<http://rvm.io/rvm/cli>

```bash
rvm
rvm -h
rvm --help
rvm help
rvm help install
```

## ruby installation

### `rvm install`

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

### `rvm list`

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

### `rvm remove`

<http://rvm.io/rubies/removing>

remove ruby and downloaded sources

### `rvm requirements`

installs dependencies for building ruby

### `rvm uninstall`

uninstall ruby, keeping it's sources.

<http://rvm.io/rubies/uninstalling>

## running different ruby versions

### `rvm current`

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

### `rvm gemdir`

display path to current gem directory (`$GEM_HOME`)

```bash
$ rvm gemdir
/home/ubuntu/.rvm/gems/ruby-2.6.3
```

### `rvm use`

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

## managing gemsets

### `rvm gemset`

[manage gemsets](#gemsets)

```bash
rvm help gemset
```

## rvm configuration

### `rvm alias`

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

## rvm maintenance

### `rvm get`

upgrades RVM to latest head, stable or branched version

```bash
rvm get stable
```

### `rvm reset`

切换为系统版本 + 设置系统版本为默认版本

```bash
rvm reset
```

## information and documentation

### `rvm info`

<https://rvm.io/rubies/info>

打印当前 Ruby 的详细信息

```bash
rvm help info
```

```bash
rvm info
```
