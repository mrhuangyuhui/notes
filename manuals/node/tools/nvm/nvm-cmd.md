<!-- omit in toc -->
# NVM - Commands

- [`nvm ls-remote`](#nvm-ls-remote)
- [`nvm install`](#nvm-install)
- [`nvm uninstall`](#nvm-uninstall)
- [`nvm list`](#nvm-list)
- [`nvm use`](#nvm-use)
- [`nvm current`](#nvm-current)
- [`nvm alias`](#nvm-alias)
- [`nvm deactivate`](#nvm-deactivate)
- [`nvm which`](#nvm-which)

<https://github.com/nvm-sh/nvm#usage>

```bash
nvm
nvm -h
nvm --help
```

设置默认 Node 版本

```bash
nvm alias default 12.16.2
```

## `nvm ls-remote`

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

## `nvm install`

To download, compile, and install the latest release of node, do this:

```bash
nvm install node # "node" is an alias for the latest version
```

To install a specific version of node:

```bash
nvm install 6.14.4 # or 10.10.0, 8.9.1, etc
```

## `nvm uninstall`

```bash
nvm uninstall 10.19.0
```

## `nvm list`

列出已安装的版本

```bash
nvm list
```

## `nvm use`

使用指定版本

```bash
nvm use 8.9.1
```

## `nvm current`

查看当前使用版本

```bash
nvm current
```

## `nvm alias`

列出所有别名

```bash
nvm alias
```

设置别名

```bash
# 设置默认 Node 版本
nvm alias default 12.16.2
```

## `nvm deactivate`

在当前 Shell 停用 `nvm`

```bash
$ nvm deactivate
/root/.nvm/*/bin removed from $PATH
$ node -v
-bash: node: command not found
```

## `nvm which`

查看指定版本 Node 的安装路径

```bash
nvm which 5.0
```

查看当前版本

```bash
nvm which current
```
