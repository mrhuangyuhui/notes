<!-- omit in toc -->
# Yarn Manual

- [Quick Start](#quick-start)
- [Install](#install)
- [Repos](#repos)
- [Commands](#commands)
- [Mirrors](#mirrors)

<https://yarnpkg.com/> | [1.x](https://classic.yarnpkg.com/en/)

## Quick Start

<https://yarnpkg.com/getting-started>

## Install

<https://yarnpkg.com/getting-started/install>

Global Install

```bash
npm install -g yarn
```

Per-project install

```bash
cd ~/path/to/project

yarn policies set-version berry # below v1.22

yarn set version berry          # on v1.22+
```

验证安装结果

```bash
yarn --version
```

1.x <https://classic.yarnpkg.com/en/docs/install>

## Repos

<https://github.com/yarnpkg>

<https://github.com/yarnpkg/yarn>

<https://github.com/yarnpkg/berry>

<https://github.com/mrhuangyuhui/yarn-playground>

## Commands

<https://yarnpkg.com/getting-started/usage>

<https://yarnpkg.com/cli>

```bash
yarn -h
yarn --help
yarn help

yarn install -h
yarn install --help
```

```bash
yarn -v
yarn --version
```

## Mirrors

查看源地址

```bash
yarn config get registry
```

修改源地址

```bash
yarn config set registry https://registry.npm.taobao.org/
```
