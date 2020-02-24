# Pyenv Manual

<https://github.com/pyenv/pyenv>

## Install

[自动安装工具](https://github.com/pyenv/pyenv-installer)

[依赖软件列表](https://github.com/pyenv/pyenv/wiki/Common-build-problems)

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

## Cmds

<https://github.com/pyenv/pyenv/blob/master/COMMANDS.md>

查看帮助

```bash
pyenv
pyenv -h
# 查看子命令帮助
pyenv help install
```

查看可安装的 Python 版本

```bash
pyenv install -l
```

安装指定版本的 Python

```bash
pyenv install 3.6.5 -v
```

列出当前可用的 Python 版本

```bash
pyenv versions
```

### [`pyenv global`](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md#pyenv-global)

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
