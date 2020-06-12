<!-- omit in toc -->
# Rbenv Manual

- [Install](#install)
  - [Basic GitHub Checkout](#basic-github-checkout)
  - [rbenv-installer](#rbenv-installer)
  - [CentOS](#centos)
  - [Mac](#mac)
- [Uninstall](#uninstall)
- [Commands](#commands)
  - [`rbenv install`](#rbenv-install)
  - [`rbenv global`](#rbenv-global)
  - [`rbenv versions`](#rbenv-versions)

<https://github.com/rbenv/rbenv>

## Install

<https://github.com/rbenv/rbenv#installation>

### Basic GitHub Checkout

<https://github.com/rbenv/rbenv#basic-github-checkout>

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# Optionally, try to compile dynamic bash extension to speed up rbenv. Don't worry if it fails; rbenv will still work normally:
cd ~/.rbenv && src/configure && make -C src

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

~/.rbenv/bin/rbenv init

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

source ~/.bash_profile
```

验证安装结果

```bash
rbenv
```

安装插件 [ruby-build](ruby-build.md)

```bash
mkdir -p "$(rbenv root)"/plugins

git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```

验证安装结果

```bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
```

### rbenv-installer

<https://github.com/rbenv/rbenv-installer>

```bash
# with curl
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

# alternatively, with wget
wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | bash
```

### CentOS

```bash
yum group install -y 'Development Tools'
```

### Mac

```bash
brew install rbenv

# 初始化配置
rbenv init

# 添加 eval "$(rbenv init -)" 到文件 .bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

# 另开一个终端，配置生效。

# 验证安装和配置结果
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
```

## Uninstall

[Uninstalling rbenv](https://github.com/rbenv/rbenv#uninstalling-rbenv)

## Commands

<https://github.com/rbenv/rbenv#command-reference>

```bash
rbenv
rbenv -h
rbenv --help

rbenv install -h
rbenv install --help
rbenv help install
```

### `rbenv install`

[Installing Ruby versions](https://github.com/rbenv/rbenv#installing-ruby-versions)

```bash
rbenv install -h
rbenv install --help
rbenv help install
```

列出可安装的 Ruby 版本

```bash
rbenv install -l
```

安装一个 Ruby 版本

```bash
rbenv install 2.7.1 -v
```

### `rbenv global`

<https://github.com/rbenv/rbenv#rbenv-global>

Sets the global version of Ruby to be used in all shells by writing the version name to the `~/.rbenv/version` file. This version can be overridden by an application-specific `.ruby-version` file, or by setting the `RBENV_VERSION` environment variable.

```bash
rbenv global --help
rbenv help global
```

```bash
rbenv global 1.8.7-p352
```

列出当前使用的全局 Ruby 版本

```bash
rbenv global
```

### `rbenv versions`

<https://github.com/rbenv/rbenv#rbenv-versions>

Lists all Ruby versions known to rbenv, and shows an asterisk next to the currently active version.

```bash
rbenv versions -h
rbenv versions --help
rbenv help versions
```

```bash
rbenv versions
```
