<!-- #ruby-install -->
<!-- omit in toc -->
# Rbenv Manual

- [Install](#install)
- [Uninstall](#uninstall)
- [Docker](#docker)
- [Commands](#commands)
- [Environment Variables](#environment-variables)

<https://github.com/rbenv/rbenv>

## Install

[rbenv-install.md](rbenv-install.md)

## Uninstall

<https://github.com/rbenv/rbenv#uninstalling-rbenv>

删除安装目录

```bash
rm -rf `rbenv root`
```

检查以下文件并删除相关配置

- `~/.bashrc`
- `~/.bash_profile`
- `~/.profile`
- `~/.zshrc`

如果是用 Homebrew 安装的，执行卸载操作。

```bash
brew uninstall rbenv
```

## Docker

[rbenv-docker.md](rbenv-docker.md)

## Commands

[rbenv-cmd.md](rbenv-cmd.md)

## Environment Variables
