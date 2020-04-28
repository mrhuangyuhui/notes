<!-- omit in toc -->
# Flutter Manual

- [Install](#install)
  - [Mac](#mac)
- [Mirrors](#mirrors)
- [Commands](#commands)
  - [`flutter create`](#flutter-create)
  - [`flutter devices`](#flutter-devices)
  - [`flutter run`](#flutter-run)
  - [`flutter pub`](#flutter-pub)
- [References](#references)
- [Examples](#examples)
- [Tutorials](#tutorials)

<https://github.com/flutter/flutter>

<https://flutter-io.cn/>

[Flutter Packages](/manuals/flutter/packages/README.md)

[Flutter Errors](/errors/flutter/README.md)

## Install

[Flutter SDK 版本列表](https://flutter.cn/docs/development/tools/sdk/releases)

### Mac

<https://flutter.cn/docs/get-started/install/macos>

[下载地址](https://flutter.cn/docs/development/tools/sdk/releases?tab=macos)

```bash
# 下载并解压安装包到目录 ~/flutter
cd ~/flutter

# 创建符号链接
ln -s flutter_macos_v1.12.13+hotfix.9-stable current

# 配置 PATH
echo 'export PATH=${PATH}:~/flutter/current/bin' >> ~/.bash_profile

source ~/.bash_profile
```

验证安装结果

```bash
flutter --version
```

检查环境配置

```bash
flutter doctor
```

## Mirrors

<https://flutter-io.cn/#cn-mirror>

<https://flutter.dev/community/china>

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

## References

<https://api.flutter.dev/index.html>

## Examples

<https://github.com/flutter/samples>

<https://github.com/nisrulz/flutter-examples>

<https://github.com/flutter/samples/blob/master/INDEX.md>

<https://github.com/Solido/awesome-flutter>

## Tutorials

<https://github.com/Solido/awesome-flutter>

[Flutter 中文网](https://flutterchina.club/)

[Flutter 核心技术与实战](https://time.geekbang.org/column/intro/200)

[Flutter 从入门到进阶——实战携程网 App](https://coding.imooc.com/class/321.html)

[Flutter 入门与案例实战](https://www.imooc.com/learn/1090)

[Flutter 开发第一步：Dart 编程语言入门](https://www.imooc.com/learn/1035)
