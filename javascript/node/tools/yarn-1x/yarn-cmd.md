<!-- omit in toc -->
# Yarn Commands - 1.x

- [`yarn install`](#yarn-install)
- [`yarn add`](#yarn-add)
- [`yarn global`](#yarn-global)
- [`yarn config`](#yarn-config)
- [`yarn list`](#yarn-list)
- [`yarn init`](#yarn-init)
- [`yarn bin`](#yarn-bin)

<https://classic.yarnpkg.com/en/docs/usage>

<https://classic.yarnpkg.com/en/docs/cli/>

```bash
yarn -h
yarn --help
yarn help

yarn install -h
yarn install --help
yarn help install
```

```bash
yarn -v
yarn --version
```

安装项目依赖

```bash
yarn
yarn install
```

## `yarn install`

<https://classic.yarnpkg.com/en/docs/cli/install>

Install all the dependencies listed within package.json in the local node_modules folder.

```bash
yarn install -h
yarn install --help
yarn help install
```

```bash
yarn install
```

## `yarn add`

<https://classic.yarnpkg.com/en/docs/cli/add>

Installs a package and any packages that it depends on.

```bash
yarn add -h
yarn add --help
yarn help add
```

```bash
yarn add package-name
yarn add package-name@1.2.3
yarn add package-name@tag
```

## `yarn global`

<https://classic.yarnpkg.com/en/docs/cli/global>

Install packages globally on your operating system.

`yarn global` is a prefix used for a number of commands like `add`, `bin`, `list` and `remove`.

```bash
yarn global -h
yarn global --help
yarn help global
```

Adding the install location to your `PATH`

```bash
echo 'export PATH="$(yarn global bin):$PATH"' >> ~/.bashrc
```

```bash
yarn global add nodemon
# 指定安装目录
yarn global add nodemon --prefix /usr/local
```

全局安装目录

```bash
$ yarn global dir
/home/gitpod/.config/yarn/global # 默认
```

全局链接目录

```bash
$ yarn global bin
/home/gitpod/.yarn/bin # 默认
```

## `yarn config`

<https://classic.yarnpkg.com/en/docs/cli/config>

Manages the yarn configuration files.

```bash
yarn config -h
yarn config --help
yarn help config
```

Displays the current configuration.

```bash
yarn config list
```

Echoes the value for a given `key` to `stdout`.

```bash
yarn config get init-license
```

Sets the config `key` to a certain `value`.

```bash
yarn config set init-license BSD-2-Clause
```

## `yarn list`

<https://classic.yarnpkg.com/en/docs/cli/list>

List installed packages.

```bash
yarn list -h
yarn list --help
yarn help list
```

```bash
yarn list
```

## `yarn init`

<https://classic.yarnpkg.com/en/docs/cli/init>

Interactively creates or updates a `package.json` file.

```bash
yarn init -h
yarn init --help
yarn help init
```

```bash
yarn init
```

## `yarn bin`

<https://classic.yarnpkg.com/en/docs/cli/bin>

Displays the location of the yarn `bin` folder.

```bash
yarn bin -h
yarn bin --help
yarn help bin
```

```bash
$ yarn bin
/workspace/formidable/node_modules/.bin
```
