<!-- #python-install -->
<!-- omit in toc -->
# Pyenv Manual

- [Install](#install)
  - [Homebrew](#homebrew)
  - [CentOS](#centos)
  - [Ubuntu](#ubuntu)
  - [Plugins](#plugins)
- [Commands](#commands)
  - [`pyenv install`](#pyenv-install)
  - [`pyenv global`](#pyenv-global)

<https://github.com/pyenv/pyenv>

## Install

[自动安装工具](https://github.com/pyenv/pyenv-installer)

[依赖软件列表](https://github.com/pyenv/pyenv/wiki/Common-build-problems)

### Homebrew

<https://github.com/pyenv/pyenv#homebrew-on-macos>

<https://formulae.brew.sh/formula/pyenv>

安装

```bash
brew update

brew install pyenv
```

配置

> 注意：配置完成后重启终端

```bash
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
```

验证

```bash
pyenv
```

### CentOS

```bash
# 安装依赖
yum install @development zlib-devel bzip2 bzip2-devel readline-devel sqlite \
sqlite-devel openssl-devel xz xz-devel libffi-devel findutils

# 安装 pyenv
curl https://pyenv.run | bash

# 设置路径
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc

echo 'eval "$(pyenv init -)"' >> ~/.bashrc

echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

source ~/.bashrc

# 检查安装结果
pyenv
```

### Ubuntu

```bash
# 安装依赖
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

# 安装 pyenv
curl https://pyenv.run | bash

# 设置路径
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc

echo 'eval "$(pyenv init -)"' >> ~/.bashrc

echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

source ~/.bashrc

# 检查安装结果
pyenv
```

### Plugins

[pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)

[pyenv-virtualenvwrapper](https://github.com/pyenv/pyenv-virtualenvwrapper)

## Commands

<https://github.com/pyenv/pyenv/blob/master/COMMANDS.md>

```bash
pyenv
pyenv -h
pyenv --help
pyenv help

pyenv install
pyenv install -h
pyenv install --help
pyenv help install
```

```bash
pyenv --version
```

列出可安装的 Python 版本

```bash
pyenv install -l
pyenv install --list
```

安装指定的 Python 版本

```bash
pyenv install 3.6.5 -v
```

列出已安装的 Python 版本

```bash
pyenv versions
```

### `pyenv install`

<https://github.com/pyenv/pyenv/blob/master/COMMANDS.md#pyenv-install>

```bash
pyenv install
pyenv install -h
pyenv install --help
pyenv help install
```

列出可安装的 Python 版本

```bash
pyenv install -l
pyenv install --list
```

安装指定的 Python 版本

```bash
pyenv install 3.6.5 -v
```

### `pyenv global`

<https://github.com/pyenv/pyenv/blob/master/COMMANDS.md#pyenv-global>

```bash
# 设置全局版本
pyenv global 3.6.1

# 查看全局版本
pyenv global
```

Set or show the local application-specific Python version
```
$ pyenv local 3.4.6
$ pyenv local
```

Unset the local version
```
$ pyenv local --unset
```

Show the current Python version and its origin
```
$ pyenv version
```

Uninstall a specific Python version
```
$ pyenv uninstall 3.6.1
```
