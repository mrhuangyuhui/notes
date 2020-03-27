# Flutter Manual

<https://github.com/flutter/flutter>

[Flutter 社区中文资源](https://flutter-io.cn/)

<https://flutter-io.cn/docs>

[Flutter中文网](https://flutterchina.club/)

[Flutter核心技术与实战](https://time.geekbang.org/column/intro/200)

[Flutter 从入门到进阶 实战携程网 App](https://coding.imooc.com/class/321.html)

[Flutter 入门与案例实战](https://www.imooc.com/learn/1090)

[Flutter 开发第一步：Dart 编程语言入门](https://www.imooc.com/learn/1035)

<https://api.flutter.dev/index.html>

<https://pub.flutter-io.cn/flutter>

<https://github.com/Solido/awesome-flutter>

## Install

[Flutter SDK 版本列表](https://flutter.cn/docs/development/tools/sdk/releases)

[配置网络镜像](https://flutter.dev/community/china)

### [macOS](https://flutter.cn/docs/get-started/install/macos)

```bash
cd ~/flutter

# 创建符号链接
ln -s flutter_macos_v1.9.1+hotfix.5-stable/ current

# 写入 PATH 环境变量
echo 'export PATH=${PATH}:~/flutter/current/bin' >> ~/.bash_profile

# 配置网络镜像
echo 'export PUB_HOSTED_URL=https://pub.flutter-io.cn' >> ~/.bash_profile
echo 'export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn' >> ~/.bash_profile
```

## Cmds

查看帮助

```bash
flutter -h
```

查看版本

```bash
flutter --version
```

创建项目

```bash
flutter create myapp
```

列出所有已连接的设备

```bash
flutter devices
```

运行项目

```bash
flutter run
```

安装依赖包

```bash
flutter pub get
```

## Examples

<https://github.com/flutter/samples>

<https://github.com/nisrulz/flutter-examples>

<https://github.com/flutter/samples/blob/master/INDEX.md>

<https://github.com/Solido/awesome-flutter>

## Packages

<https://pub.flutter-io.cn/packages/provider>

<https://pub.flutter-io.cn/packages/english_words>

## Errors

```bash
# Waiting for another flutter command to release the startup lock...
rm ~/flutter/current/bin/cache/lockfile
```
