<!-- #flutter-install -->
<!-- omit in toc -->
# Flutter - Install

- [Mac](#mac)

<https://flutter.dev/docs/get-started/install>

## Mac

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

# Flutter
export FLUTTER_HOME=\$HOME/flutter/current
export PATH=\$PATH:\$FLUTTER_HOME/bin

EOF

source ~/.bash_profile
```

验证配置结果

```bash
tail -n 5 ~/.bash_profile

flutter --version
```

检查依赖安装

```bash
flutter doctor
```
