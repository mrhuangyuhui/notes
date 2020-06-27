<!-- #npm-mirror -->
<!-- omit in toc -->
# NPM - Mirrors

- [Taobao](#taobao)
- [mirror-config-china](#mirror-config-china)

查看当前仓库配置

```bash
npm config get registry
# 或
npm config ls -l | grep registry
```

## Taobao

配置淘宝镜像

```bash
npm config set registry https://registry.npm.taobao.org -g
```

写入配置文件

```bash
echo 'registry = "https://registry.npm.taobao.org/"' >> ~/.npmrc
```

安装 [`cnpm`](https://npm.taobao.org/)

```bash
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

## mirror-config-china

<https://www.npmjs.com/package/mirror-config-china>
