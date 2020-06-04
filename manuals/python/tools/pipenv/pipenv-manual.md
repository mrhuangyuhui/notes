<!-- omit in toc -->
# Pipenv Manual

- [Quick Start](#quick-start)
- [Install](#install)
  - [Mac](#mac)
- [Repos](#repos)
- [Commands](#commands)
  - [`pipenv install`](#pipenv-install)
  - [`pipenv uninstall`](#pipenv-uninstall)
  - [`pipenv lock`](#pipenv-lock)
  - [`pipenv shell`](#pipenv-shell)
  - [`pipenv run`](#pipenv-run)

<https://pipenv.pypa.io/>

<https://pypi.org/project/pipenv/>

## Quick Start

<https://rootnroll.com/d/pipenv/>

## Install

```bash
pip install pipenv
```

### Mac

```bash
brew install pipenv
```

## Repos

<https://github.com/pypa/pipenv>

## Commands

<https://pipenv.pypa.io/en/latest/cli/>

```bash
pipenv
pipenv -h
pipenv --help
```

```bash
pipenv --version
```

### `pipenv install`

<https://pipenv.pypa.io/en/latest/cli/#pipenv-install>

安装项目依赖

```bash
pipenv install

# Install both develop and default packages
pipenv install -d

# Specify a PyPI mirror
pipenv install --pypi-mirror https://pypi.tuna.tsinghua.edu.cn/simple
```

安装软件包

```bash
pipenv install requests
```

### `pipenv uninstall`

### `pipenv lock`

### `pipenv shell`

激活 Python 虚拟环境

```bash
pipenv shell
```

### `pipenv run`

执行 Python 命令

```bash
pipenv run python main.py
```
