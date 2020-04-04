<!-- omit in toc -->
# NVM Manual

- [Install](#install)
- [Commands](#commands)
  - [`nvm ls-remote`](#nvm-ls-remote)
  - [`nvm install`](#nvm-install)
  - [`nvm list`](#nvm-list)
  - [`nvm use`](#nvm-use)
  - [`nvm current`](#nvm-current)

<https://github.com/creationix/nvm>

## [Install](https://github.com/nvm-sh/nvm#installation-and-update)

安装

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
# 或
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```

检查安装结果

```bash
command -v nvm
```

> which should output 'nvm' if the installation was successful. Please note that `which nvm` will not work, since `nvm` is a sourced shell function, not an executable binary.

<!-- #nvm-cmd -->
## Commands

查看帮助

```bash
nvm
nvm --help
```

### `nvm ls-remote`

列出可安装的版本

```bash
# 列出所有版本
nvm ls-remote

# 只列出 LTS 版本
nvm ls-remote --lts

# 只列出指定版本号的版本
nvm ls-remote 8
nvm ls-remote 8.9

# 只列出指定版本号的 LTS 版本
nvm ls-remote 8.9 --lts
```

### `nvm install`

To download, compile, and install the latest release of node, do this:

```bash
nvm install node # "node" is an alias for the latest version
```

To install a specific version of node:

```bash
nvm install 6.14.4 # or 10.10.0, 8.9.1, etc
```

### `nvm list`

列出已安装的版本

```bash
nvm list
```

### `nvm use`

使用指定版本

```bash
nvm use 8.9.1
```

### `nvm current`

查看当前使用版本

```bash
nvm current
```

在当前 shell 停用 `nvm`

```bash
$ nvm deactivate
/root/.nvm/*/bin removed from $PATH
$ node -v
-bash: node: command not found
```
