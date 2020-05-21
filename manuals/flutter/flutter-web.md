# Flutter - Web

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

使用 Docker 部署

```bash
docker run -v `pwd`:/usr/share/nginx/html:ro -p 8080:80 -d --rm nginx:1.16.1-alpine
```
