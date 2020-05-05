<!-- omit in toc -->
# Flutter Manual

- [Quick Start](#quick-start)
- [Install](#install)
- [Downloads](#downloads)
- [Mirrors](#mirrors)
- [Repos & Codes](#repos--codes)
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
  - [Web](#web)
- [Guides](#guides)
- [API](#api)
- [Tutorials](#tutorials)

<https://flutter.dev/> | [GitHub](https://github.com/flutter/website) | [Gitee](https://gitee.com/mrhuangyuhui/flutter-website)

<https://flutter.cn/> | [GitHub](https://github.com/cfug/flutter.cn)

> 提示：`flutter.dev` 对应的中文域名是 `flutter.cn`

相关笔记：

- [Dart Codes](https://gitee.com/mrhuangyuhui/dart-codes)
- [Flutter Packages](packages/README.md)
- [Flutter Issues](/issues/flutter/README.md)

## Quick Start

<https://flutter.dev/docs/get-started>

<!-- #flutter-install -->
## Install

> [Downloads](#downloads), [Mirrors](#mirrors)

[`flutter-install.md`](flutter-install.md)

<!-- #flutter-download -->
## Downloads

[Flutter 版本说明](https://github.com/flutter/flutter/wiki/Flutter-build-release-channels)

[Flutter SDK releases](https://flutter.dev/docs/development/tools/sdk/releases) | [Flutter SDK 版本列表](https://flutter.cn/docs/development/tools/sdk/releases)

<!-- #flutter-mirror -->
## Mirrors

[Using Flutter in China](https://flutter.dev/community/china) | [在中国网络环境下使用 Flutter](https://flutter.cn/community/china)

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

<!-- #flutter-repo #flutter-code -->
## Repos & Codes

> 相关笔记：[Dart Codes](https://gitee.com/mrhuangyuhui/dart-codes)

[flutter/flutter](https://github.com/flutter/flutter) | [Gitee](https://gitee.com/mrhuangyuhui/flutter)

[flutter/flutter > examples](https://github.com/flutter/flutter/tree/master/examples) | [Gitee](https://gitee.com/mrhuangyuhui/flutter/tree/master/examples)

[flutter/gallery](https://github.com/flutter/gallery) | [Gitee](https://gitee.com/mrhuangyuhui/flutter-gallery)

[flutter/samples](https://github.com/flutter/samples) | [Gitee](https://gitee.com/mrhuangyuhui/flutter-samples)

[nisrulz/flutter-examples](https://github.com/nisrulz/flutter-examples) | [Gitee](https://gitee.com/mrhuangyuhui/flutter-examples)

[flutter/website](https://github.com/flutter/website) | [Gitee](https://gitee.com/mrhuangyuhui/flutter-website)

[cfug/flutter.cn](https://github.com/cfug/flutter.cn)

<!-- #flutter-cmd -->
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

<!-- #flutter-ide -->
## IDE

<!-- #flutter-vscode -->
### VSCode

[Set up an editor > VSCode](https://flutter.dev/docs/get-started/editor?tab=vscode)

[Test drive > VSCode](https://flutter.dev/docs/get-started/test-drive?tab=vscode)

[Development > Tools > VSCode](https://flutter.dev/docs/development/tools/vs-code)

[Flutter - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) | [GitHub](https://github.com/Dart-Code/Flutter)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-vscode-4.png)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-vscode-5.png)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-vscode-1.jpg)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-vscode-2.png)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-vscode-3.png)

<!-- #flutter-idea -->
### IDEA

[Set up an editor > Android Studio and IntelliJ](https://flutter.dev/docs/get-started/editor?tab=androidstudio)

[Test drive > Android Studio and IntelliJ](https://flutter.dev/docs/get-started/test-drive?tab=androidstudio)

[Development > Tools > Android Studio and IntelliJ](https://flutter.dev/docs/development/tools/android-studio)

[Flutter - plugin for IntelliJ IDEA and Android Studio | JetBrains](https://plugins.jetbrains.com/plugin/9212-flutter) | [GitHub](https://github.com/flutter/flutter-intellij)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-idea-1.png)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-idea-2.png)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-idea-3.png)

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-idea-4.png)

## Platforms

<!-- #flutter-ios -->
### iOS

[iOS setup](https://flutter.dev/docs/get-started/install/macos#ios-setup)

- [Set up the iOS simulator](https://flutter.dev/docs/get-started/install/macos#set-up-the-ios-simulator)
- [Deploy to iOS devices](https://flutter.dev/docs/get-started/install/macos#deploy-to-ios-devices)

<!-- #flutter-mac -->
### Desktop

> **This page covers desktop support for macOS which is available as an alpha release as of 1.13.** This page does not cover Windows or Linux platforms, which are in technical preview.

<https://flutter.dev/desktop>

> 注意：如果是用 Gitee 或其他方式同步 GitHub 上的 Fluttr 仓库，请确保同步是最新的！

```bash
$ git remote get-url origin
git@gitee.com:mrhuangyuhui/flutter.git
```

初始化

```bash
flutter channel master

flutter upgrade

flutter config --enable-macos-desktop
```

验证初始化结果

```bash
$ cat ~/.flutter_settings
{
  "enable-macos-desktop": true
}

$ flutter devices
macOS
```

运行项目

```bash
flutter run -d macOS
```

Samples

- [Flutter Gallery](https://github.com/flutter/samples/tree/master/gallery)
- [Photo Search app](https://github.com/flutter/samples/tree/master/experimental/desktop_photo_search)

> [关注桌面平台的开发进展](https://github.com/flutter/flutter/wiki/Desktop-shells)

<!-- #flutter-web -->
### Web

> As of 1.12, Flutter has early support for running web applications, but you need to be running the **beta** channel of Flutter at present.

[Building a web application with Flutter](https://flutter.dev/docs/get-started/web) | [使用 Flutter 构建 Web 应用](https://flutter.cn/docs/get-started/web)

> 注意：如果是用 Gitee 或其他方式同步 GitHub 上的 Fluttr 仓库，请确保同步是最新的！

```bash
$ git remote get-url origin
git@gitee.com:mrhuangyuhui/flutter.git
```

初始化

```bash
# 切换到 beta 分支
flutter channel beta
# 或 切换到 master 分支
flutter channel master

flutter upgrade

flutter config --enable-web
```

验证初始化结果

```bash
$ cat ~/.flutter_settings
{
  "enable-web": true,
}

$ flutter devices
Chrome
```

运行项目

```bash
flutter run -d chrome
```

构建项目（输出文件在 `build/web` 目录下）

```bash
flutter build web
# 或
flutter run --release
```

<!-- #flutter-guide -->
## Guides

[Flutter Documentation](https://flutter.dev/docs)

[Writing custom platform-specific code](https://flutter.dev/docs/development/platform-integration/platform-channels) | [撰写双端平台代码（插件编写实现）](https://flutter.cn/docs/development/platform-integration/platform-channels)

<!-- #flutter-api -->
## API

[Flutter API](https://api.flutter-io.cn/)

<!-- #flutter-tutorial -->
## Tutorials

[Get started](https://flutter.dev/docs/get-started)

[Flutter Gallery](https://flutter.github.io/gallery/#/) | [GitHub](https://github.com/flutter/gallery) | [Gitee](https://gitee.com/mrhuangyuhui/flutter-gallery)

[Flutter Samples](https://flutter.github.io/samples/#) | [GitHub](https://github.com/flutter/samples) | [Gitee](https://gitee.com/mrhuangyuhui/flutter-samples)

[Flutter Codelabs](https://flutter.dev/docs/codelabs) | [zh-CN](https://flutter.cn/docs/codelabs)

[Flutter Cookbook](https://flutter.dev/docs/cookbook) | [实用教程](https://flutter.cn/docs/cookbook)

[Flutter Tutorials](https://flutter.dev/docs/reference/tutorials) | [Flutter 实践教程](https://flutter.cn/docs/reference/tutorials)

[Flutter - YouTube](https://www.youtube.com/flutterdev)

[Solido/awesome-flutter](https://github.com/Solido/awesome-flutter)

[Introduction to Flutter Development with Dart | The App Brewery](https://www.appbrewery.co/p/intro-to-flutter)

[Flutter 中文网](https://flutterchina.club/)

[Flutter 核心技术与实战](https://time.geekbang.org/column/intro/200)

慕课网

- [Flutter 从入门到进阶——实战携程网 App](https://coding.imooc.com/class/321.html)
- [Flutter 入门与案例实战](https://www.imooc.com/learn/1090)
- [Flutter 开发第一步：Dart 编程语言入门](https://www.imooc.com/learn/1035)
