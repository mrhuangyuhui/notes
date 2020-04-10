<!-- omit in toc -->
# CocoaPods Manual

- [Install](#install)
  - [Mac](#mac)
  - [Docker](#docker)
- [Commands](#commands)
- [Mirrors](#mirrors)

<https://cocoapods.org/>

<https://github.com/CocoaPods/CocoaPods>

> 提示：遇到问题请看 <https://guides.cocoapods.org/using/troubleshooting>

## Install

<https://guides.cocoapods.org/using/getting-started.html>

### Mac

安装 Ruby 请参考笔记 [RVM Manual](/manuals/ruby/rvm-manual.md)

```bash
sudo gem install cocoapods
```

> 提示：安装过程中遇到 Ruby 或 Gem 的错误，尝试以下命令。

```bash
sudo gem update --system
sudo gem install cocoapods -n /usr/local/bin
```

桌面客户端 <https://cocoapods.org/app>

### Docker

<https://hub.docker.com/r/gaetan/cocoapods>

```bash
docker run -it --rm -v `pwd`:/usr/src/myapp -w /usr/src/myapp cocoapods pod init
```

```bash
docker run -it --rm -v `pwd`:/usr/src/myapp -w /usr/src/myapp cocoapods pod install
```

## Commands

```bash
pod --help
pod --version
```

初始化 `Podfile` 文件

```bash
pod init
```

安装依赖库

```bash
pod install
```

## Mirrors

<https://mirror.tuna.tsinghua.edu.cn/help/CocoaPods/>

对于旧版的 CocoaPods 可以使用如下方法使用 tuna 的镜像：

```bash
pod repo remove master
pod repo add master https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git
pod repo update
```

新版的 CocoaPods 不允许用 `pod repo add` 直接添加 master 库了，但是依然可以：

```bash
cd ~/.cocoapods/repos
pod repo remove master
git clone https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git master
```

最后进入自己的工程，在自己工程的 `Podfile` 第一行加上：

```bash
source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
```
