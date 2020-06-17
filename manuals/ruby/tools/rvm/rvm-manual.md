<!-- #ruby-install -->
<!-- omit in toc -->
# RVM Manual

- [Install](#install)
- [Uninstall](#uninstall)
- [Commands](#commands)
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

[rvm-install.md](rvm-install.md)

## Uninstall

```bash
rvm implode
```

<!-- #rvm-cmd #rvm-example -->
## Commands

[rvm-cmd.md](rvm-cmd.md)

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
