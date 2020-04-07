<!-- omit in toc -->
# CocoaPods Manual

- [Install](#install)
- [Commands](#commands)

<https://cocoapods.org/>

<https://github.com/CocoaPods/CocoaPods>

> 提示：遇到问题请看 <https://guides.cocoapods.org/using/troubleshooting>

## Install

<https://guides.cocoapods.org/using/getting-started.html>

```bash
sudo gem install cocoapods
```

> 提示：安装过程中遇到 Ruby 或 Gem 的错误，尝试以下命令。

```bash
sudo gem update --system
sudo gem install cocoapods -n /usr/local/bin
```

桌面客户端 <https://cocoapods.org/app>

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
