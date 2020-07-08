<!-- omit in toc -->
# Yarn Commands - 2.x

- [`yarn install`](#yarn-install)
- [`yarn config`](#yarn-config)

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

Installing all the dependencies

```bash
yarn
yarn install
```

Adding a dependency

```bash
yarn add [package]
yarn add [package]@[version]
yarn add [package]@[tag]
```

Adding a dependency to different categories of dependencies

```bash
yarn add [package] --dev  # dev dependencies
yarn add [package] --peer # peer dependencies
```

## `yarn install`

<https://yarnpkg.com/cli/install>

Install the project dependencies.

```bash
yarn install -h
yarn install --help
```

```bash
yarn install
```

## `yarn config`

2.x <https://yarnpkg.com/cli/config>

```bash
yarn config -h
yarn config --help
```

Displays the current configuration.

```bash
yarn config
```

2.x <https://yarnpkg.com/cli/config/get>

Read a configuration settings.

```bash
yarn config get -h
yarn config get --help
```

Print a simple configuration setting:

```bash
yarn config get yarnPath
```

Print a configuration setting as JSON:

```bash
yarn config get packageExtensions --json
```
