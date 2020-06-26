<!-- #node-install -->
<!-- omit in toc -->
# NVM Manual

- [Install](#install)
- [Uninstall](#uninstall)
- [Commands](#commands)
- [`.nvmrc`](#nvmrc)
- [Environment Variables](#environment-variables)
  - [`$NVM_SYMLINK_CURRENT`](#nvm_symlink_current)

<https://github.com/nvm-sh/nvm>

<https://gitee.com/mrhuangyuhui/nvm>

## Install

[nvm-install.md](nvm-install.md)

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

[nvm-cmd.md](nvm-cmd.md)

## `.nvmrc`

[nvmrc.md](nvmrc.md)

## Environment Variables

### `$NVM_SYMLINK_CURRENT`

`nvm use` will not, by default, create a "current" symlink. Set `$NVM_SYMLINK_CURRENT` to "true" to enable this behavior, which is sometimes useful for IDEs. Note that using `nvm` in multiple shell tabs with this environment variable enabled can cause race conditions.

[Using nvm with WebStorm or other IDE](https://medium.com/@danielzen/using-nvm-with-webstorm-or-other-ide-d7d374a84eb1)

```bash
$ export NVM_SYMLINK_CURRENT=true
$ nvm use default
$ ls -ld $NVM_DIR/current
lrwxr-xr-x 1 zen staff 6 Nov 9 18:50:53 2016 current@ -> /Users/zen/.nvm/versions/node/v6.9.1
```
