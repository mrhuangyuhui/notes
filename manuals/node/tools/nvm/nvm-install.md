# NVM - Install

<https://github.com/nvm-sh/nvm#installation-and-update>

## Install & Update Script

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

## Git Install

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
