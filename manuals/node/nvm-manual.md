<!-- #node-install -->
<!-- omit in toc -->
# NVM Manual

- [Install](#install)
  - [Install & Update Script](#install--update-script)
  - [Git Install](#git-install)
- [Uninstall](#uninstall)
- [Commands](#commands)
  - [`nvm ls-remote`](#nvm-ls-remote)
  - [`nvm install`](#nvm-install)
  - [`nvm uninstall`](#nvm-uninstall)
  - [`nvm list`](#nvm-list)
  - [`nvm use`](#nvm-use)
  - [`nvm current`](#nvm-current)
  - [`nvm alias`](#nvm-alias)
  - [`nvm deactivate`](#nvm-deactivate)

<https://github.com/nvm-sh/nvm>

<https://gitee.com/mrhuangyuhui/nvm>

## Install

<https://github.com/nvm-sh/nvm#installation-and-update>

### Install & Update Script

<https://github.com/nvm-sh/nvm#install--update-script>

> 提示：网络出现问题可选择 [Git Install](#git-install)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
# 或
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```

在安装过程中，一般会自动添加以下环境配置到相关文件，如果没有，可手动添加。

`~/.bash_profile`, `~/.zshrc`, `~/.profile`, or `~/.bashrc`

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

> 提示：在 Mac 中，以上配置一般会在安装过程中自动添加到文件 `~/.bashrc` 中，如果 `nvm` 命令没有生效，请在文件 `~/.bash_profile` 的第一行加入 `source ~/.bashrc`。

验证安装结果

```bash
command -v nvm
```

> which should output 'nvm' if the installation was successful. Please note that `which nvm` will not work, since `nvm` is a sourced shell function, not an executable binary.

### Git Install

<https://github.com/nvm-sh/nvm#git-install>

> 提示：网络出现问题可选择这种方式

```bash
cd ~/ && git clone git@gitee.com:mrhuangyuhui/nvm.git .nvm
cd ~/.nvm && git checkout v0.35.3
. nvm.sh
```

添加以下环境配置到相关文件

`~/.bash_profile`, `~/.zshrc`, `~/.profile`, or `~/.bashrc`

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

## Uninstall

<https://github.com/nvm-sh/nvm#uninstalling--removal>

删除文件

```bash
rm -rf "$NVM_DIR"
```

删除配置

`~/.bash_profile`, `~/.zshrc`, `~/.profile`, or `~/.bashrc`

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion
```

<!-- #nvm-cmd -->
## Commands

<https://github.com/nvm-sh/nvm#usage>

```bash
nvm
nvm --help
```

设置默认 Node 版本

```bash
nvm alias default 12.16.2
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

### `nvm uninstall`

```bash
nvm uninstall 10.19.0
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

### `nvm alias`

列出所有别名

```bash
nvm alias
```

设置别名

```bash
# 设置默认 Node 版本
nvm alias default 12.16.2
```

### `nvm deactivate`

在当前 Shell 停用 `nvm`

```bash
$ nvm deactivate
/root/.nvm/*/bin removed from $PATH
$ node -v
-bash: node: command not found
```
