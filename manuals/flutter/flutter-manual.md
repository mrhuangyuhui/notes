<!-- omit in toc -->
# Flutter Manual

- [Quick Start](#quick-start)
- [Install](#install)
  - [Mac](#mac)
- [Repos](#repos)
- [Downloads](#downloads)
- [Mirrors](#mirrors)
- [Commands](#commands)
  - [`flutter create`](#flutter-create)
  - [`flutter devices`](#flutter-devices)
  - [`flutter run`](#flutter-run)
  - [`flutter pub`](#flutter-pub)
- [IDE](#ide)
  - [VSCode](#vscode)
  - [IDEA](#idea)
- [Platforms](#platforms)
  - [iOS](#ios)
  - [Desktop](#desktop)
- [Guides](#guides)
- [API](#api)
- [Codes](#codes)
- [Tutorials](#tutorials)

<https://flutter.dev/> ([GitHub](https://github.com/flutter/website))

<https://flutter.cn/> ([GitHub](https://github.com/cfug/flutter.cn))

相关笔记：

- [Dart Codes](https://gitee.com/mrhuangyuhui/dart-codes)
- [Flutter Packages](packages/README.md)
- [Flutter Issues](/issues/flutter/README.md)

## Quick Start

<https://flutter.dev/docs/get-started>

## Install

> [DownLoads](#downloads), [Mirrors](#mirrors)

<https://flutter.dev/docs/get-started/install>

### Mac

<https://flutter.dev/docs/get-started/install/macos>

[下载安装包](https://flutter.dev/docs/development/tools/sdk/releases?tab=macos)

解压安装包到目录 `~/flutter`

创建符号链接

```bash
cd ~/flutter

ln -s flutter_macos_v1.12.13+hotfix.9-stable current
```

配置 `PATH`

```bash
cat >> ~/.bash_profile << EOF
export FLUTTER_HOME=$HOME/flutter/current
export PATH=${PATH}:$FLUTTER_HOME/bin
EOF

source ~/.bash_profile
```

验证配置结果

```bash
flutter --version
```

检查依赖安装

```bash
flutter doctor
```

[创建并运行一个简单的 Flutter 应用](https://flutter.dev/docs/get-started/install/macos#create-and-run-a-simple-flutter-app)

- [设置 iOS 开发环境](#ios)

```bash
flutter create my_app

cd my_app

flutter run
```

## Repos

<https://github.com/flutter/flutter> ([Gitee](https://gitee.com/mrhuangyuhui/flutter))

<https://github.com/flutter/website>

## Downloads

[Flutter 版本说明](https://github.com/flutter/flutter/wiki/Flutter-build-release-channels)

<https://flutter.dev/docs/development/tools/sdk/releases>

<https://flutter.cn/docs/development/tools/sdk/releases>

## Mirrors

<https://flutter.dev/community/china>

<https://flutter.dev/#cn-mirror>

Flutter 社区

```bash
cat >> ~/.bash_profile << EOF
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
EOF
```

清华大学 TUNA 协会

```bash
cat >> ~/.bash_profile << EOF
export PUB_HOSTED_URL=https://mirrors.tuna.tsinghua.edu.cn/dart-pub
export FLUTTER_STORAGE_BASE_URL=https://mirrors.tuna.tsinghua.edu.cn/flutter
EOF
```

## Commands

```bash
flutter
flutter -h
flutter --help
flutter help

flutter create -h
flutter create --help
flutter help create
```

```bash
flutter --version
```

检查环境配置

```bash
flutter doctor
```

### `flutter create`

创建项目

```bash
flutter create -h
flutter create --help
flutter help create
```

```bash
flutter create myapp
```

### `flutter devices`

列出所有已连接的设备

```bash
flutter devices
```

### `flutter run`

运行项目

```bash
flutter run
```

### `flutter pub`

安装依赖包

```bash
flutter pub get
```

## IDE

### VSCode

[Set up an editor > VSCode](https://flutter.dev/docs/get-started/editor?tab=vscode)

[Test drive > VSCode](https://flutter.dev/docs/get-started/test-drive?tab=vscode)

[Development > Tools > VSCode](https://flutter.dev/docs/development/tools/vs-code)

[Flutter - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) ([GitHub](https://github.com/Dart-Code/Flutter))

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-vscode-4.png)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-vscode-5.png)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-vscode-1.jpg)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-vscode-2.png)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-vscode-3.png)

### IDEA

[Set up an editor > Android Studio and IntelliJ](https://flutter.dev/docs/get-started/editor?tab=androidstudio)

[Test drive > Android Studio and IntelliJ](https://flutter.dev/docs/get-started/test-drive?tab=androidstudio)

[Development > Tools > Android Studio and IntelliJ](https://flutter.dev/docs/development/tools/android-studio)

[Flutter - plugin for IntelliJ IDEA and Android Studio | JetBrains](https://plugins.jetbrains.com/plugin/9212-flutter) ([GitHub](https://github.com/flutter/flutter-intellij))

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-idea-1.png)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-idea-2.png)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-idea-3.png)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-idea-4.png)

## Platforms

### iOS

[设置 iOS 开发环境](https://flutter.dev/docs/get-started/install/macos#ios-setup)

- [配置 iOS 模拟器](https://flutter.dev/docs/get-started/install/macos#set-up-the-ios-simulator)
- [部署到 iOS 真机上](https://flutter.dev/docs/get-started/install/macos#deploy-to-ios-devices)

### Desktop

> **This page covers desktop support for macOS which is available as an alpha release as of 1.13.** This page does not cover Windows or Linux platforms, which are in technical preview.

<https://flutter.dev/desktop>

```bash
flutter channel master

flutter upgrade

flutter config --enable-macos-desktop

mkdir myapp

cd myapp

flutter create .

flutter run -d macOS
```

Samples

- [Flutter Gallery](https://github.com/flutter/samples/tree/master/gallery)
- [Photo Search app](https://github.com/flutter/samples/tree/master/experimental/desktop_photo_search)

<https://github.com/flutter/flutter/wiki/Desktop-shells>

## Guides

[Flutter 开发文档](https://flutter.dev/docs)

[撰写双端平台代码（插件编写实现）](https://flutter.dev/docs/development/platform-integration/platform-channels)

## API

[Flutter API 文档](https://api.flutter-io.cn/)

<!-- #flutter-code -->
## Codes

[Flutter Gallery](https://github.com/flutter/gallery/) ([Gitee](https://gitee.com/mrhuangyuhui/flutter-gallery))

<https://github.com/flutter/flutter/tree/master/examples> ([Gitee](https://gitee.com/mrhuangyuhui/flutter/tree/master/examples))

<https://github.com/flutter/samples> ([Index](https://github.com/flutter/samples/blob/master/INDEX.md))

<https://github.com/nisrulz/flutter-examples>

## Tutorials

[开始使用 Flutter](https://flutter.dev/docs/get-started)

<<https://github.com/Solido/awesome-flutter>>

[Flutter Gallery](https://flutter.github.io/gallery/#/) ([GitHub](https://github.com/flutter/gallery/), [Gitee](https://gitee.com/mrhuangyuhui/flutter-gallery))

[Flutter Samples](https://flutter.github.io/samples/#)

[Flutter Codelabs](https://codelabs.flutter-io.cn/) (<https://flutter.dev/#codelabs>, <https://flutter.dev/docs/codelabs>)

[Flutter 实用教程](https://flutter.dev/docs/cookbook)

[Flutter 实践教程](https://flutter.dev/docs/reference/tutorials)

<https://www.youtube.com/flutterdev>

<https://github.com/Solido/awesome-flutter>

<https://www.appbrewery.co/p/intro-to-flutter>

[Flutter 中文网](https://flutterchina.club/)

[Flutter 核心技术与实战](https://time.geekbang.org/column/intro/200)

[Flutter 从入门到进阶——实战携程网 App](https://coding.imooc.com/class/321.html)

[Flutter 入门与案例实战](https://www.imooc.com/learn/1090)

[Flutter 开发第一步：Dart 编程语言入门](https://www.imooc.com/learn/1035)
