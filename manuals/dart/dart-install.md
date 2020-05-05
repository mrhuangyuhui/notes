<!-- #dart-install -->
<!-- omit in toc -->
# Dart - Install

- [Mac](#mac)

[Install the Dart SDK](https://dart.dev/get-dart#install) | [安装 Dart SDK](https://dart.dev/get-dart#install)

> [Downloads](#downloads)

## Mac

[下载安装包](https://dart.dev/tools/sdk/archive)

解压安装包到目录 `~/dart`

创建符号链接

```bash
cd ~/dart

ln -s dartsdk-macos-x64-release current
```

配置 `PATH`

```bash
cat >> ~/.bash_profile << EOF

# Dart
export DART_HOME=\$HOME/dart/current
export PATH=\$PATH:\$DART_HOME/bin

EOF

source ~/.bash_profile
```

验证配置结果

```bash
tail -n 5 ~/.bash_profile

dart --version
```
