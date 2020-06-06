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
  - [`pyenv shell`](#pyenv-shell)
- [Environment Variables](#environment-variables)
  - [`PYENV_VERSION`](#pyenv_version)
- [virtualenv](#virtualenv)
- [virtualenvwrapper](#virtualenvwrapper)

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

[安装依赖](https://github.com/pyenv/pyenv/wiki/Common-build-problems#prerequisites)

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

pyenv help install
pyenv install --help
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
# -v 表示打印安装过程
pyenv install 3.6.5 -v
```

列出已安装的 Python 版本

```bash
pyenv versions
```

### `pyenv global`

设置或查看全局 Python 版本

[COMMANDS.md#pyenv-global](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md#pyenv-global)

> Sets the global version of Python to be used in all shells by writing the version name to the `~/.pyenv/version` file. This version can be overridden by an application-specific `.python-version` file, or by setting the `PYENV_VERSION` environment variable.

```bash
pyenv help global
pyenv global --help
```

设置全局版本

```bash
pyenv global 3.6.1

# 提示：可以同时设置多个版本
pyenv global 3.6.1 3.7.0

# 通过环境变量设置
$ echo $PYENV_VERSION
3.8.2:2.7.17
```

列出所有全局版本

```bash
pyenv global
```

### `pyenv install`

安装一个 Python 版本

[COMMANDS.md#pyenv-install](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md#pyenv-install)

```bash
pyenv help install
pyenv install --help
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

设置或查看在当前目录（一般是项目目录）使用的 Python 版本

```bash
pyenv help local
pyenv local --help
```

设置 Python 版本

> 提示：会在当前目录创建文件 `.python-version`

```bash
pyenv local 3.8.2

$ cat .python-version
3.8.2

# 提示：可以指定多个版本
pyenv local 3.7.0 2.7.15
```

查看 Python 版本

```bash
pyenv local
```

取消设置

> 提示：会在当前目录删除文件 `.python-version`

```bash
pyenv local --unset
```

### `pyenv uninstall`

卸载

```bash
pyenv help uninstall
pyenv uninstall --help
```

```bash
pyenv uninstall 3.6.1
```

### `pyenv version`

查看当前使用的 Python 版本

```bash
pyenv help version
pyenv version --help
```

```bash
pyenv version
```

### `pyenv versions`

列出所有可用的 Python 版本

```bash
pyenv help versions
pyenv versions --help
```

```bash
pyenv versions
```

### `pyenv shell`

设置当前 Shell 的 Python 版本

[COMMANDS.md#pyenv-shell](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md#pyenv-shell)

```bash
pyenv shell 2.7.6

# 可以同时设置多个版本
pyenv shell 2.7.6 3.3.3
```

> 提示：也可以通过环境变量 `PYENV_VERSION` 来设置

## Environment Variables

<https://github.com/pyenv/pyenv#environment-variables>

### `PYENV_VERSION`

设置使用的 Python 版本

```bash
$ echo $PYENV_VERSION
3.8.2:2.7.17
```

## virtualenv

<https://github.com/pyenv/pyenv-virtualenv>

[`manuals/python/tools/virtualenv-manual.md`](/manuals/python/tools/virtualenv-manual.md)

> 提示：安装 pyenv 会自动安装插件 virtualenv

[手动安装](https://github.com/pyenv/pyenv-virtualenv#installation)

> 注意：必须先安装 pyenv

```bash
# 直接把 pyenv-virtualenv 下载到 pyenv 的子目录
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile

source ~/.bash_profile
```

[常用命令](https://github.com/pyenv/pyenv-virtualenv#usage)

```bash
pyenv help virtualenv
pyenv virtualenv --help
```

```bash
pyenv virtualenv --version
```

## virtualenvwrapper

[pyenv-virtualenvwrapper](https://github.com/pyenv/pyenv-virtualenvwrapper)
