<!-- omit in toc -->
# Yarn Commands

- [`yarn install`](#yarn-install)
- [`yarn config`](#yarn-config)
- [`yarn config get`](#yarn-config-get)

<https://yarnpkg.com/getting-started/usage>

<https://yarnpkg.com/cli>

1.x <https://classic.yarnpkg.com/en/docs/cli/>

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

<https://yarnpkg.com/cli/config>

Display the current configuration.

```bash
yarn config -h
yarn config --help
```

```bash
yarn config
```

## `yarn config get`

<https://yarnpkg.com/cli/config/get>

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
