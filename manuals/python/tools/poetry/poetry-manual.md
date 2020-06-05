<!-- omit in toc -->
# Poetry Manual

- [Quick Start](#quick-start)
- [Install](#install)
- [Upgrade](#upgrade)
- [Repos](#repos)
- [Commands](#commands)
  - [`poetry install`](#poetry-install)
  - [`poetry new`](#poetry-new)
  - [`poetry add`](#poetry-add)
- [Docs](#docs)

<https://python-poetry.org/>

## Quick Start

<https://rootnroll.com/d/poetry/>

<https://python-poetry.org/docs/basic-usage/>

## Install

> Poetry requires Python 2.7 or 3.4+.

<https://python-poetry.org/docs/#installation>

```bash
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
```

```bash
source $HOME/.poetry/env
```

自动补全

```bash
# Bash
poetry completions bash > /etc/bash_completion.d/poetry.bash-completion

# Bash (macOS/Homebrew)
poetry completions bash > $(brew --prefix)/etc/bash_completion.d/poetry.bash-completion

# Fish
poetry completions fish > ~/.config/fish/completions/poetry.fish

# Zsh
poetry completions zsh > ~/.zfunc/_poetry

# Oh-My-Zsh
mkdir $ZSH/plugins/poetry
poetry completions zsh > $ZSH/plugins/poetry/_poetry
```

## Upgrade

```bash
poetry self update
```

## Repos

<https://github.com/python-poetry/poetry>

## Commands

<https://python-poetry.org/docs/cli/>

```bash
poetry -h
poetry --help
poetry help

poetry help install
poetry install -h
poetry install --help
```

```bash
poetry -V
poetry --version
```

### `poetry install`

安装依赖

```bash
poetry install
```

### `poetry new`

创建项目

```bash
poetry new poetry-demo
```

### `poetry add`

添加依赖

```bash
poetry add pendulum
```

## Docs

<https://python-poetry.org/docs/>
