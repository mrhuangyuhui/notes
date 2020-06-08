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
- [Configs](#configs)
  - [Terminal Proxy](#terminal-proxy)
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

## Configs

### Terminal Proxy

如果使用的客户端是 Mac 的 ShadowsocksX-NG，可拷贝相关终端命令，参考以下截图。

![img](https://gitee.com/mrhuangyuhui/images/raw/master/shadowsocks/shadowsocks-terminal-1.png)

```bash
# 拷贝出来的终端命令
export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;
```

如果使用的是 PandaVPN，可在设置中查看代理端口号，参考以下截图。

![img](https://gitee.com/mrhuangyuhui/images/raw/master/pandavpn/pandavpn-proxy-1.png)

- **方法一：临时设置环境变量**

```bash
# 注意：以下环境变量是临时的，退出或重开终端窗口设置立即失效！！！
export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;
```

- **方法二：写入到 Shell 配置文件**

```bash
## Mac/Bash

# 提示：不同的 Shell 配置文件不一样，此处以 Bash 为例。

# 注意：修改重要配置文件前一定要先备份！！！
cp ~/.bash_profile ~/.bash_profile.`date +%Y-%m-%d-%H-%M-%S`

# “追加”写入到配置文件 ~/.bash_profile
cat >> ~/.bash_profile << EOF
## Shadowsocks Proxy
alias proxy="export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;"
alias unproxy="unset http_proxy https_proxy"
## End
EOF

# 在当前终端窗口使配置生效
source ~/.bash_profile
# 或者另外打开一个终端窗口使配置生效
```

打开和关闭代理

> 注意：打开和关闭代理只在当前 Shell 窗口有效！！！

```bash
# 需要在终端使用代理时输入命令 proxy
proxy
# 需要在终端关闭代理时输入命令 unproxy
unproxy
```

验证配置结果

```bash
# 返回状态码应该是 200
curl -I https://www.facebook.com/
```

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
||brew.sh
||amazon.com
```
