<!-- omit in toc -->
# Pipenv Manual

- [Quick Start](#quick-start)
- [Install](#install)
  - [Homebrew](#homebrew)
  - [PIP](#pip)
- [Repos](#repos)
- [Commands](#commands)
  - [`pipenv`](#pipenv)
  - [`pipenv install`](#pipenv-install)
  - [`pipenv shell`](#pipenv-shell)
- [PyCharm](#pycharm)

<https://pipenv.pypa.io/>

<https://pypi.org/project/pipenv/>

## Quick Start

<https://rootnroll.com/d/pipenv/>

## Install

<https://pipenv.pypa.io/en/latest/install/#installing-pipenv>

### Homebrew

```bash
brew install pipenv
```

验证安装结果

```bash
pipenv --version
```

### PIP

[pragmatic-installation-of-pipenv](https://pipenv.pypa.io/en/latest/install/#pragmatic-installation-of-pipenv)

```bash
pip install --user pipenv
```

验证安装结果

```bash
pipenv --version

$ which pipenv
/home/ubuntu/.local/bin/pipenv
```

## Repos

<https://github.com/pypa/pipenv>

## Commands

<https://pipenv.pypa.io/en/latest/cli/>

```bash
pipenv
pipenv -h
pipenv --help
pipenv --man
```

```bash
pipenv --version
```

### `pipenv`

Output virtualenv information.

```bash
pipenv --venv
```

Remove the virtualenv.

```bash
pipenv --rm
```

### `pipenv install`

<https://pipenv.pypa.io/en/latest/cli/#pipenv-install>

安装项目依赖

```bash
# Install both develop and default packages
pipenv install -d
# Specify a PyPI mirror
pipenv install -d --pypi-mirror https://pypi.tuna.tsinghua.edu.cn/simple

# 不安装开发环境的依赖包
pipenv install
pipenv install --pypi-mirror https://pypi.tuna.tsinghua.edu.cn/simple
```

安装指定依赖包

```bash
pipenv install requests
```

### `pipenv shell`

激活 Python 虚拟环境

```bash
pipenv shell
```

## PyCharm

![img](https://gitee.com/mrhuangyuhui/images/raw/master/pycharm/pycharm-pipenv-1.jpg)
