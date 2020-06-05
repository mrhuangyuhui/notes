# Poetry Manual

<https://python-poetry.org/>

## Quick Start

<https://rootnroll.com/d/poetry/>

## Install

> Poetry requires Python 2.7 or 3.4+.

<https://python-poetry.org/docs/#installation>

```bash
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
```

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

## Docs

<https://python-poetry.org/docs/>
