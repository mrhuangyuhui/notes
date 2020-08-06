<!-- omit in toc -->
# Git Manual

- [Installation](#installation)
  - [YUM](#yum)
  - [Source](#source)
  - [Windows](#windows)
- [Commands](#commands)
  - [`clone`](#clone)
  - [`config`](#config)
  - [`pull`](#pull)
  - [`checkout`](#checkout)
  - [`git log`](#git-log)
  - [`git reset`](#git-reset)
  - [`ssh-keygen`](#ssh-keygen)
  - [`submodule`](#submodule)
  - [`git remote`](#git-remote)
- [Docs](#docs)
- [Tutorials](#tutorials)
- [Servers](#servers)

<https://git-scm.com/>

<https://git-scm.com/doc>

<https://git-scm.com/book/en/v2>

<https://github.com/git/git>

## [Installation](https://git-scm.com/downloads)

<https://git-scm.com/downloads>

[GUI Clients](https://git-scm.com/downloads/guis)

### YUM

```bash
sudo yum install git -y
```

### [Source](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

[install-git-from-source.sh](https://github.com/mrhuangyuhui/git/blob/master/install-git-from-source.sh)

```bash
# CentOS 6.9/7.4, Ubuntu 16.04
curl -L https://github.com/mrhuangyuhui/git/raw/master/install-git-from-source.sh | bash
```

```bash
# CentOS
yum install epel-release -y
yum install wget tar autoconf automake libtool -y
yum install dh-autoreconf libcurl-devel expat-devel gettext-devel openssl-devel perl-devel zlib-devel -y
yum install asciidoc xmlto docbook2X -y

# Ubuntu
apt-get install wget tar
apt-get install dh-autoreconf libcurl4-gnutls-dev libexpat1-dev  gettext zlib1g-dev libssl-dev -y
apt-get install asciidoc xmlto docbook2x -y

ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

wget https://www.kernel.org/pub/software/scm/git/git-2.15.0.tar.gz
tar -zxf git-2.15.0.tar.gz
cd git-2.15.0
make configure
./configure --prefix=/usr/local/git/git-2.15.0
make all doc info
make install install-doc install-html install-info
```

### Windows

<https://git-scm.com/download/win>

<!-- #git-cmd -->
## Commands

<https://git-scm.com/docs>

快速帮助

```bash
git
git --help
# 子命令使用手册
git help pull
# 列出所有子命令
git help -a
```

使用手册

```bash
man git
```

### `clone`

克隆仓库

```bash
git clone https://github.com/mrhuangyuhui/notes.git
```

### `config`

设置目录名和文件名大小写敏感

```bash
cd repo/
git config core.ignorecase false
```

### `pull`

更新本地工作目录

```bash
git pull
```

### `checkout`

切换分支

```bash
git checkout develop
```

### `git log`

```bash
git log --help
```

查看提交记录

```bash
git log
```

### `git reset`

```bash
git help reset
```

### `ssh-keygen`

<https://www.git-tower.com/learn/git/ebook/cn/command-line/advanced-topics/ssh-public-keys>

<https://help.github.com/articles/connecting-to-github-with-ssh/>

### `submodule`

添加子模块

```bash
git submodule add https://github.com/chaconinc/DbConnector
```

### `git remote`

```bash
man git-remote
git help remote
git remote --help
git remote -h
```

列出仓库的 Fetch URL 和 Push URL

```bash
git remote -v
```

## Docs

<https://git-scm.com/docs>

忽略配置

<https://git-scm.com/docs/gitignore>

<https://github.com/github/gitignore>

## Tutorials

<https://www.git-tower.com/learn/>

<https://gitee.com/all-about-git>

## Servers

[GitLab](https://gitlab.com/)

[Gogs](https://gogs.io/)