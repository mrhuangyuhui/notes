<!-- #node-install -->
<!-- omit in toc -->
# NVM Manual

- [Install](#install)
- [Uninstall](#uninstall)
- [Commands](#commands)

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
