<!-- #ruby-install -->
<!-- omit in toc -->
# `ruby-install`

- [Install](#install)
  - [CentOS](#centos)
  - [Ubuntu](#ubuntu)
  - [Mac](#mac)
- [Commands](#commands)

<https://github.com/postmodern/ruby-install>

## Install

### CentOS

安装相关工具

```bash
yum group install 'Development Tools' -y
```

下载并安装

```bash
wget -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz

tar -xzvf ruby-install-0.7.0.tar.gz

cd ruby-install-0.7.0/

make install

# 检查安装结果
ruby-install
```

[Aliyun CentOS 7.3 安装失败录屏](https://asciinema.org/a/289407)

### Ubuntu

```bash
## Aliyun Ubuntu 16.04

wget -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz

tar -xzvf ruby-install-0.7.0.tar.gz

cd ruby-install-0.7.0/

make install

# 检查安装结果
ruby-install
```

### Mac

## Commands

列出可安装的版本

```bash
ruby-install
```

安装

```bash
## Aliyun Ubuntu 16.04
apt-get update
ruby-install --rubies-dir /usr/local/rubies/ ruby

# Aliyun CentOS 7.3
ruby-install --rubies-dir /usr/local/rubies/ ruby
```
