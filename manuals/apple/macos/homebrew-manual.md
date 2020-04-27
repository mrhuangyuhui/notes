<!-- omit in toc -->
# Homebrew Manual

- [Install](#install)
  - [Mac](#mac)
  - [Docker](#docker)
- [Uninstall](#uninstall)
- [Mirrors](#mirrors)
  - [Aliyun](#aliyun)
- [Commands](#commands)
  - [`brew install`](#brew-install)
  - [`brew uninstall`](#brew-uninstall)
  - [`brew list`](#brew-list)
  - [`brew update`](#brew-update)
  - [`brew cat`](#brew-cat)
- [Formulae](#formulae)
- [Guides](#guides)

<https://brew.sh/>

<https://docs.brew.sh/>

<https://formulae.brew.sh/>

<https://github.com/Homebrew>

<https://github.com/Homebrew/brew>

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

### Docker

<https://hub.docker.com/r/homebrew/brew>

## Uninstall

<https://docs.brew.sh/FAQ#how-do-i-uninstall-homebrew>

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
```

## Mirrors

<https://github.com/Homebrew/homebrew-core>

<https://docs.brew.sh/Taps>

<https://docs.brew.sh/Interesting-Taps-and-Forks>

查看仓库地址

```bash
# 查看 brew.git
cd "$(brew --repo)" && git remote -v

# 查看 homebrew-core.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core" && git remote -v
```

### Aliyun

阿里云

<https://developer.aliyun.com/mirror/homebrew>

<https://mirrors.aliyun.com/homebrew/>

Bash 终端配置

```bash
# 替换 brew.git
cd "$(brew --repo)" && git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git

# 替换 homebrew-core.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core" && git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git

# 应用生效
brew update

# 替换 homebrew-bottles
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles' >> ~/.bash_profile

source ~/.bash_profile
```

恢复默认配置

```bash
# 重置 brew.git
cd "$(brew --repo)"

git remote set-url origin https://github.com/Homebrew/brew.git

# 重置homebrew-core.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"

git remote set-url origin https://github.com/Homebrew/homebrew-core.git

# 删掉 HOMEBREW_BOTTLE_DOMAIN 环境变量
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

source ~/.bash_profile
```

## Commands

<https://docs.brew.sh/Manpage#commands>

[Homebrew Shell Completion](https://docs.brew.sh/Shell-Completion)

```bash
brew
brew -h
brew --help
brew help

brew install -h
brew install --help
brew help install
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

```bash
brew install -h
brew install --help
brew help install
```

```bash
brew install pyenv
```

### `brew uninstall`

<https://docs.brew.sh/Manpage#uninstall-rm-remove-options-formula>

Uninstall formula.

```bash
brew uninstall -h
brew uninstall --help
brew help uninstall
```

```bash
brew uninstall pyenv
```

### `brew list`

<https://docs.brew.sh/Manpage#list-ls-options-formula>

List all installed formulae.

### `brew update`

<https://docs.brew.sh/Manpage#update-up-options>

Fetch the newest version of Homebrew and all formulae from GitHub using `git` and perform any necessary migrations.

```bash
brew help update
```

更新

> 提示：如果该命令执行失败，可尝试先卸载 Homebrew 再重装！！！

### `brew cat`

<https://docs.brew.sh/Manpage#cat-formula>

查看 Formula 的源码，也就是安装某个软件的 Ruby 脚本。

```bash
brew cat wget
```

## Formulae

<https://formulae.brew.sh/>

> 提示：Homebrew 中的 Formula 不是软件，而是安装软件的 Ruby 脚本，例如 <https://github.com/Homebrew/homebrew-core/blob/master/Formula/wget.rb>

## Guides

<https://docs.brew.sh/>

[Frequently Asked Questions](https://docs.brew.sh/FAQ)

[Tips and Tricks](https://docs.brew.sh/Tips-N'-Tricks)

[Ruby Gems, Python Eggs and Perl Modules](https://docs.brew.sh/Gems,-Eggs-and-Perl-Modules)

[Python](https://docs.brew.sh/Homebrew-and-Python)
