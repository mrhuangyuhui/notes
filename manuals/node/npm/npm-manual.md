<!-- omit in toc -->
# NPM Manual

- [Install](#install)
- [Registry](#registry)
- [Commands](#commands)
  - [`npm install`](#npm-install)
  - [`init`](#init)
  - [`ls`](#ls)
  - [`npm run`](#npm-run)
- [Files](#files)
  - [`package.json`](#packagejson)
  - [`npmrc`](#npmrc)
- [References](#references)
- [Tutorials](#tutorials)

<https://www.npmjs.com/>

<https://docs.npmjs.com/>

<https://docs.npmjs.com/getting-started/>

<https://npm.taobao.org/>

<https://npm.runkit.com/>

## Install

<https://www.npmjs.com/get-npm>

`npm` is distributed with Node.js- which means that when you download Node.js, you automatically get `npm` installed on your computer.

升级 `npm` 到最新版本

```bash
npm install npm@latest -g
```

## Registry

[CNPM](https://npm.taobao.org/)

```bash
# 查看当前仓库配置
npm config get registry

# 配置淘宝镜像
npm config set registry https://registry.npm.taobao.org -g
```

安装 `cnpm`

```bash
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

## Commands

<https://docs.npmjs.com/cli-documentation/cli>

查看帮助

```bash
npm
npm -h
npm help
# 查看子命令帮助
npm install -h
```

列出所有子命令的使用方法

```bash
npm -l
```

使用手册

```bash
npm help npm
```

### [`npm install`](https://docs.npmjs.com/cli/install)

安装

```bash
# 安装 package.json 列出的包
npm install
# 局部安装指定包
npm install jshint
# 安装并保存到 package.json
npm install jshint --save
npm install jshint --save-dev
# 全局安装指定包
npm install -g jshint
```

[Installing npm packages locally](https://docs.npmjs.com/getting-started/installing-npm-packages-locally)

[Installing npm packages globally](https://docs.npmjs.com/getting-started/installing-npm-packages-globally)

### [`init`](https://docs.npmjs.com/cli/init)

创建 `package.json`

```bash
npm init
# 按默认方式创建
npm init -y
```

[Using a `package.json`](https://docs.npmjs.com/getting-started/using-a-package.json)

### [`ls`](https://docs.npmjs.com/cli/ls)

列出已安装的包，该命令可以查看包的版本信息。

```bash
npm ls mongodb
npm ls mongodb -g
```

### `npm run`

监控资源变更

```bash
npm run watch-poll
```

## Files

### [`package.json`](https://docs.npmjs.com/files/package.json)

- [devDependencies](https://docs.npmjs.com/files/package.json#devdependencies)
- [files](https://docs.npmjs.com/files/package.json#files)
- [keywords](https://docs.npmjs.com/files/package.json#keywords)
- [main](https://docs.npmjs.com/files/package.json#main)
- [repository](https://docs.npmjs.com/files/package.json#repository)
- [scripts](https://docs.npmjs.com/files/package.json#scripts)

[Working with `package.json`](https://docs.npmjs.com/getting-started/using-a-package.json)

### [`npmrc`](https://docs.npmjs.com/files/npmrc)

## References

<https://docs.npmjs.com/>

## Tutorials

<https://docs.npmjs.com/getting-started/>
