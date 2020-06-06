<!-- omit in toc -->
# Tox Manual

- [Install](#install)
- [Repos](#repos)
- [Docs](#docs)
- [Configs](#configs)
- [Commands](#commands)
- [Examples](#examples)

<https://tox.readthedocs.io/en/latest/>

tox workflow diagram

[![img](https://tox.readthedocs.io/en/latest/_images/tox_flow.png)](https://tox.readthedocs.io/en/latest/index.html#system-overview)

## Install

<https://tox.readthedocs.io/en/latest/install.html>

```bash
pip install tox
```

> It is fine to install tox itself into a virtualenv environment.

## Repos

<https://github.com/tox-dev/tox>

<https://sourcegraph.com/github.com/tox-dev/tox>

## Docs

<https://tox.readthedocs.io/en/latest/>

## Configs

[tox-configs.md](/manuals/python/tools/tox/tox-configs.md)

[xtox.ini.md]tox.ini.md)

## Commands

<https://tox.readthedocs.io/en/latest/config.html#cli>

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

在指定的环境测试

```bash
tox -e py35
```

## Examples

[`manuals/python/tools/tox/tox-example.md`](/manuals/python/tools/tox/tox-example.md)
