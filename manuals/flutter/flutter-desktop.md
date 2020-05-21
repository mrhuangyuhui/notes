# Flutter - Desktop

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
