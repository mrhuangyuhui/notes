<!-- omit in toc -->
# Homebrew Manual

- [Install](#install)
- [Uninstall](#uninstall)
- [Mirrors](#mirrors)
- [Commands](#commands)
  - [`brew update`](#brew-update)
- [Packages](#packages)

<https://brew.sh/>

<https://github.com/Homebrew>

<https://formulae.brew.sh/>

## Install

<https://github.com/Homebrew/install>

<https://docs.brew.sh/Installation.html>

> 提示：如果安装过程中一直卡在 `Downloading Command Line Tools for Xcode`，请直接到官方下载安装后再重新执行命令。
>
> [Command Line Tools for Xcode](https://developer.apple.com/download/more/?=Command%20Line%20Tools%20for%20Xcode)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## Uninstall

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
```

## Mirrors

<https://developer.aliyun.com/mirror/homebrew>

<https://mirrors.aliyun.com/homebrew/>

## Commands

```bash
brew
brew -h
brew --help
brew help
man brew
brew help list
```

### `brew update`

```bash
brew help update
```

> 提示：如果该命令执行失败，可尝试先卸载 Homebrew 再重装！！！

## Packages

<https://formulae.brew.sh/>
