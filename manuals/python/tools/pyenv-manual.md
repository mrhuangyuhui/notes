<!-- #python-install -->
<!-- omit in toc -->
# Pyenv Manual

- [Install](#install)
  - [Mac](#mac)
  - [CentOS & Ubuntu](#centos--ubuntu)
- [Commands](#commands)
  - [`pyenv global`](#pyenv-global)
  - [`pyenv install`](#pyenv-install)
  - [`pyenv local`](#pyenv-local)
  - [`pyenv uninstall`](#pyenv-uninstall)
  - [`pyenv version`](#pyenv-version)
  - [`pyenv versions`](#pyenv-versions)
- [Plugins](#plugins)

<https://github.com/pyenv/pyenv>

## Install

<https://github.com/pyenv/pyenv-installer>

[Prerequisites](https://github.com/pyenv/pyenv/wiki/Common-build-problems#prerequisites)

### Mac

<https://github.com/pyenv/pyenv#homebrew-on-macos>

<https://formulae.brew.sh/formula/pyenv>

安装

```bash
brew update

brew install pyenv
```

配置

```bash
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile

source ~/.bash_profile
```

验证安装结果

```bash
pyenv
```

### CentOS & Ubuntu

安装依赖

```bash
# CentOS
sudo yum install @development zlib-devel bzip2 bzip2-devel readline-devel sqlite \
sqlite-devel openssl-devel xz xz-devel libffi-devel findutils

# Ubuntu
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
```

安装 pyenv

```bash
curl https://pyenv.run | bash
```

配置

```bash
cat >> ~/.bashrc << EOF
# Pyenv BEGIN
export PATH="\$HOME/.pyenv/bin:\$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
# Pyenv END
EOF
```

验证安装结果

```bash
tail -5 ~/.bashrc
source ~/.bashrc
pyenv
```

## Commands

<https://github.com/pyenv/pyenv/blob/master/COMMANDS.md>

```bash
pyenv
pyenv -h
pyenv --help
pyenv help

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

### `pyenv global`

查看或设置全局 Python 版本

> 注意：可以同时设置多个全局版本！

<https://github.com/pyenv/pyenv/blob/master/COMMANDS.md#pyenv-global>

```bash
pyenv help global
pyenv global --help
```

设置全局版本

```bash
pyenv global 3.6.1

# 同时设置多个
pyenv global 3.6.1 3.7.0
```

列出所有全局版本

```bash
pyenv global
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

### `pyenv local`

在当前终端设置指定的 Python 版本

```bash
pyenv local 3.4.6
```

```bash
pyenv local
```

取消设置

```bash
pyenv local --unset
```

### `pyenv uninstall`

卸载

```bash
pyenv uninstall 3.6.1
```

### `pyenv version`

查看当前终端的 Python 版本

```bash
pyenv version
```

### `pyenv versions`

列出所有可用的 Python 版本

```bash
pyenv versions -h
pyenv versions --help
pyenv help versions
```

```bash
pyenv versions
```

## Plugins

[pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)

[pyenv-virtualenvwrapper](https://github.com/pyenv/pyenv-virtualenvwrapper)
