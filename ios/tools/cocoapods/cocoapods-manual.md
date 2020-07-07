<!-- omit in toc -->
# CocoaPods Manual

- [Install](#install)
- [Repos](#repos)
- [Commands](#commands)
- [Podfile](#podfile)
- [Mirrors](#mirrors)

<https://cocoapods.org/>

> 提示：遇到问题请看 <https://guides.cocoapods.org/using/troubleshooting>

## Install

<https://guides.cocoapods.org/using/getting-started.html>

安装 Ruby 请参考笔记 [RVM Manual](/ruby/tools/rvm/rvm-manual.md)

```bash
gem install cocoapods
# 使用系统 Ruby，需要加 sudo。
sudo gem install cocoapods
```

验证安装结果

```bash
pod --version
which pod
```

> 提示：安装过程中遇到 Ruby 或 Gem 的错误，尝试以下命令。

```bash
sudo gem update --system
sudo gem install cocoapods -n /usr/local/bin
```

桌面客户端 <https://cocoapods.org/app>

## Repos

<https://github.com/CocoaPods>

<https://github.com/CocoaPods/CocoaPods>

<https://github.com/CocoaPods/Specs>

## Commands

[cocoapods-cmd.md](cocoapods-cmd.md)

## Podfile

[Podfile.md](Podfile.md)

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
