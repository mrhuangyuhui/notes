<!-- omit in toc -->
# Homebrew Manual

- [Install](#install)
  - [Mac](#mac)
- [Uninstall](#uninstall)
- [Mirrors](#mirrors)
- [Commands](#commands)
  - [`brew install`](#brew-install)
  - [`brew list`](#brew-list)
  - [`brew update`](#brew-update)
- [Packages](#packages)

<https://brew.sh/>

<https://docs.brew.sh/>

<https://formulae.brew.sh/>

<https://docs.brew.sh/FAQ>

<https://github.com/Homebrew>

<https://github.com/Homebrew/homebrew-core>

## Install

<https://github.com/Homebrew/install>

<https://docs.brew.sh/Installation.html>

### Mac

macOS Requirements

- A 64-bit Intel CPU
- macOS High Sierra (10.13) (or higher)
- Command Line Tools (CLT) for Xcode: `xcode-select --install`, [developer.apple.com/downloads](https://developer.apple.com/downloads) or Xcode
- A Bourne-compatible shell for installation (e.g. `bash` or `zsh`)

> 提示：如果安装过程中一直卡在 `Downloading Command Line Tools for Xcode`，请直接到官方下载安装后再重新执行命令。
>
> [Command Line Tools for Xcode](https://developer.apple.com/download/more/?=Command%20Line%20Tools%20for%20Xcode)

安装命令

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## Uninstall

<https://docs.brew.sh/FAQ#how-do-i-uninstall-homebrew>

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
```

## Mirrors

<https://docs.brew.sh/Taps>

<https://docs.brew.sh/Interesting-Taps-and-Forks>

<https://github.com/Homebrew/homebrew-core>

列出当前的 Formulae 仓库

```bash
brew tap
```

阿里云仓库

<https://developer.aliyun.com/mirror/homebrew>

<https://mirrors.aliyun.com/homebrew/>

## Commands

<https://docs.brew.sh/Manpage#commands>

[Homebrew Shell Completion](https://docs.brew.sh/Shell-Completion)

```bash
brew
brew -h
brew --help
brew help
brew help list
```

```bash
man brew
```

```bash
brew --version
```

### `brew install`

<https://docs.brew.sh/Manpage#install-options-formula>

Install formula.

### `brew list`

<https://docs.brew.sh/Manpage#list-ls-options-formula>

List all installed formulae.

### `brew update`

```bash
brew help update
```

> 提示：如果该命令执行失败，可尝试先卸载 Homebrew 再重装！！！

## Packages

<https://formulae.brew.sh/>
