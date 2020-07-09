<!-- omit in toc -->
# Yarn Commands - 1.x

- [`yarn install`](#yarn-install)
- [`yarn add`](#yarn-add)
- [`yarn remove`](#yarn-remove)
- [`yarn global`](#yarn-global)
- [`yarn config`](#yarn-config)
- [`yarn run`](#yarn-run)
- [`yarn policies`](#yarn-policies)
- [`yarn test`](#yarn-test)
- [`yarn list`](#yarn-list)
- [`yarn info`](#yarn-info)
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
yarn install --registry https://registry.npm.taobao.org/
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

## `yarn remove`

<https://classic.yarnpkg.com/en/docs/cli/remove>

Running `yarn remove foo` will remove the package named `foo` from your direct dependencies updating your `package.json` and `yarn.lock` files in the process.

```bash
yarn remove -h
yarn remove --help
yarn help remove
```

```bash
yarn remove express
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

## `yarn run`

<https://classic.yarnpkg.com/en/docs/cli/run>

Runs a defined package script.

```bash
yarn run -h
yarn run --help
yarn help run
```

```bash
yarn run test
```

If you do not specify a script to the `yarn run` command, the `run` command will list all of the scripts available to run for a package.

```bash
yarn run
```

Running this command will list environment variables available to the scripts at runtime.

```bash
yarn run env
```

## `yarn policies`

<https://classic.yarnpkg.com/en/docs/cli/policies>

Defines project-wide policies for your project.

```bash
yarn policies -h
yarn policies --help
yarn help policies
```

Enforcing Yarn’s version across your project

```bash
yarn policies set-version # will download the latest stable release
yarn policies set-version --rc # will download the latest rc release
yarn policies set-version 1.13.0 # will download a specific version
yarn policies set-version '^1.12.0' # will download the latest minor
```

`.yarnrc`

```
yarn-path ".yarn/releases/yarn-1.22.4.js"
```

## `yarn test`

<https://classic.yarnpkg.com/en/docs/cli/test>

Runs the test script defined by the package.

```bash
yarn test -h
yarn test --help
yarn help test
```

`yarn test` is also a shortcut for `yarn run test`.

```bash
yarn test
yarn run test
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

## `yarn info`

<https://classic.yarnpkg.com/en/docs/cli/info>

Show information about a package.

```bash
yarn info -h
yarn info --help
yarn help info
```

```bash
yarn info react
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

```bash
$ yarn bin jest
/workspace/formidable/node_modules/.bin/jest
```

