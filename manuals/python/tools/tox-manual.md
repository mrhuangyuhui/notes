# Tox Manual

<https://github.com/tox-dev/tox>

<https://tox.readthedocs.io/en/latest/>

## Install

<https://tox.readthedocs.io/en/latest/install.html>

```bash
pip install tox
```

> It is fine to install tox itself into a virtualenv environment.

## Configs

[tox configuration specification](https://tox.readthedocs.io/en/latest/config.html)

[tox environments](https://tox.readthedocs.io/en/latest/config.html#tox-environments)

- `[testenv]`
- `[testenv:NAME]`

[tox environment settings](https://tox.readthedocs.io/en/latest/config.html#tox-environment-settings)

- `basepython`

## Commands

```bash
tox -h
tox --help
```

```bash
tox --help-ini
tox --hi
```

```bash
tox --version
```

列出所有测试环境

```bash
tox -l
```

## Examples

[tox configuration and usage examples](https://tox.readthedocs.io/en/latest/examples.html)

[Basic example](https://tox.readthedocs.io/en/latest/index.html#basic-example)
