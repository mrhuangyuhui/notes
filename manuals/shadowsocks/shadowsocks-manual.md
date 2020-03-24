<!-- omit in toc -->
# Shadowsocks Manual

- [Install](#install)
  - [Ubuntu](#ubuntu)
  - [CentOS](#centos)
  - [Auto Install Shadowsocks Server for CentOS/Debian/Ubuntu](#auto-install-shadowsocks-server-for-centosdebianubuntu)
- [Commands](#commands)
- [Clients](#clients)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)
  - [Android](#android)
- [User Rules For PAC](#user-rules-for-pac)

<https://shadowsocks.org/>

<https://github.com/shadowsocks/shadowsocks>

<https://github.com/shadowsocks/shadowsocks/wiki>

GFWList <https://github.com/gfwlist/gfwlist>

User Rules <https://adblockplus.org/en/filter-cheatsheet>

## Install

<https://github.com/shadowsocks/shadowsocks/tree/master#install>

### Ubuntu

卸载阿里云盾

```bash
curl -L https://raw.githubusercontent.com/mrhuangyuhui/shadowsocks/master/uninstall_aliyundun.sh | bash
```

安装 Shadowsocks

```bash
curl -L https://github.com/mrhuangyuhui/shadowsocks/raw/master/install-shadowsocks-apt.sh | bash
```

### CentOS

```bash
yum install python-setuptools && easy_install pip
pip install git+https://github.com/shadowsocks/shadowsocks.git@master
```

### Auto Install Shadowsocks Server for CentOS/Debian/Ubuntu

<https://github.com/teddysun/shadowsocks_install>

## [Commands](https://github.com/shadowsocks/shadowsocks/tree/master#usage)

启动

```bash
# 端口 443 密码 123456 加密方法 aes-256-cfb
ssserver -p 443 -k 123456 -m aes-256-cfb
```

后台启动

```bash
sudo ssserver -p 443 -k password -m aes-256-cfb --user nobody -d start
```

停止

```bash
sudo ssserver -d stop
```

## [Clients](https://shadowsocks.org/en/download/clients.html)

### macOS

[ShadowsocksX-NG](https://github.com/shadowsocks/ShadowsocksX-NG/releases)

### Windows

[Shadowsocks for Windows](https://github.com/shadowsocks/shadowsocks-windows/releases)

### Linux

[Shadowsocks-Qt5](https://github.com/shadowsocks/shadowsocks-qt5/releases)

### Android

[Shadowsocks for Android](https://github.com/shadowsocks/shadowsocks-android/releases)

## User Rules For PAC

```
! Put user rules line by line in this file.
! See https://adblockplus.org/en/filter-cheatsheet

||w3schools.com
||evernote.com
||xmarks.com
||apple.com
||tutorialspoint.com
||npmjs.com
||github.com
||github.io
||thymeleaf.org
||linux.vbird.org
||fontawesome.com
||tradingview.com
||sphinx-doc.org
||php.net
||laravel.com
||vagrantup.com
||gitbooks.io
||jetbrains.com
||sourcegraph.com
||amazonaws.com
||phpunit.de
||docker.com
||raywenderlich.com
||okex.com
||swift.org
||developer.mozilla.org
||asciinema.org
||outlook.live.com
```
