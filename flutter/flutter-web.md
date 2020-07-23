# Flutter - Web

> As of 1.12, Flutter has early support for running web applications, but you need to be running the **beta** channel of Flutter at present.

[Building a web application with Flutter](https://flutter.dev/docs/get-started/web) | [zh-cn](https://flutter.cn/docs/get-started/web)

> 注意：如果是用 Gitee 同步 GitHub 上的 Fluttr 仓库，请确保代码是最新的！

查看远程同步地址

```bash
$ git remote get-url origin
git@gitee.com:mrhuangyuhui/flutter.git
```

配置环境

```bash
# 切换到 beta 分支
flutter channel beta
# 或 master 分支
flutter channel master

flutter upgrade

flutter config --enable-web
```

验证配置结果

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
cd build/web

docker run -v `pwd`:/usr/share/nginx/html:ro -p 8080:80 -d --rm nginx:1.16.1-alpine
```
