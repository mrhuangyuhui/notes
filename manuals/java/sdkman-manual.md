<!-- omit in toc -->
# SDKMAN Manual

- [Install](#install)
  - [Mac](#mac)
- [Uninstall](#uninstall)
- [Commands](#commands)
  - [`sdk list`](#sdk-list)
  - [`sdk install`](#sdk-install)
  - [`sdk default`](#sdk-default)
  - [`sdk current`](#sdk-current)
  - [`sdk uninstall`](#sdk-uninstall)

<http://sdkman.io/>

<https://github.com/sdkman>

<https://github.com/sdkman/sdkman-cli>

<https://sdkman.io/sdks>

<https://sdkman.io/jdks>

## Install

<https://sdkman.io/install>

### Mac

```bash
curl -s "https://get.sdkman.io" | bash

source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk version
```

## Uninstall

<https://sdkman.io/install>

The following will guide you through backing up, then removing the entire installation from your system.

```bash
tar zcvf ~/sdkman-backup_$(date +%F-%kh%M).tar.gz -C ~/ .sdkman
$ rm -rf ~/.sdkman
```

The last step involves editing and removing the initialisation snippet from your `.bashrc`, `.bash_profile` and/or `.profile` files. If you use ZSH, remove it from the `.zshrc` file. The snippet of code to be removed looks something like this:

```bash
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/home/dudette/.sdkman/bin/sdkman-init.sh" ]] && source "/home/dudette/.sdkman/bin/sdkman-init.sh"
```

## Commands

<https://sdkman.io/usage>

<https://sdkman.io/usage#help>

```bash
sdk help
```

### `sdk list`

列出所有可安装的 SDK

<https://sdkman.io/usage#listcandidates>

```bash
sdk list
```

列出指定 SDK 的所有可安装版本

```bash
sdk list java
```

### `sdk install`

<https://sdkman.io/usage#installdefault>

安装 SDK 的最新稳定版本

```bash
sdk install java
```

<https://sdkman.io/usage#installspecific>

安装 SDK 的指定版本

```bash
sdk install scala 2.12.1
```

### `sdk default`

设置 SDK 的全局版本

```bash
sdk default scala 2.11.6
```

### `sdk current`

查看指定 SDK 的当前版本

```bash
sdk current java
```

查看所有 SDK 的当前版本

```bash
sdk current
```

### `sdk uninstall`

删除 SDK 的指定版本

```bash
sdk uninstall scala 2.11.6
```
