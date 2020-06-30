<!-- omit in toc -->
# NVM - Install

- [Install & Update Script](#install--update-script)
- [Git Install](#git-install)
- [Manual Install](#manual-install)

[Installing and Updating](https://github.com/nvm-sh/nvm#installation-and-update)

## Install & Update Script

<https://github.com/nvm-sh/nvm#install--update-script>

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
# 或
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```

在安装过程中，一般会自动添加以下配置到文件 `~/.bashrc`，如果没有，则手动添加：

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

检查 `~/.bash_profile` 的第一行是否有以下命令，如果没有，则手动添加：

```bash
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
```

激活配置

```bash
source ~/.bash_profile
```

验证安装结果

```bash
command -v nvm

nvm

nvm --version

nvm --help
```

> which should output 'nvm' if the installation was successful. Please note that `which nvm` will not work, since `nvm` is a sourced shell function, not an executable binary.

## Git Install

<https://github.com/nvm-sh/nvm#git-install>

```bash
cd ~/ && git clone https://github.com/nvm-sh/nvm.git .nvm

cd ~/.nvm && git checkout v0.35.3

. nvm.sh
```

手动添加以下环境配置到相关文件

`~/.bash_profile`, `~/.zshrc`, `~/.profile`, or `~/.bashrc`

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

或

```bash
curl https://raw.githubusercontent.com/mrhuangyuhui/bashrc/master/nvm >> ~/.bashrc

curl https://raw.githubusercontent.com/mrhuangyuhui/bashrc/master/nvm >> ~/.bash_profile
```

激活环境配置

```bash
source ~/.bashrc

source ~/.bash_profile
```

## Manual Install

<https://github.com/nvm-sh/nvm#manual-install>

```bash
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
```

环境配置同上
