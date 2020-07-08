<!-- omit in toc -->
# Yarn Commands - 1.x

- [`yarn install`](#yarn-install)
- [`yarn add`](#yarn-add)
- [`yarn config`](#yarn-config)

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
