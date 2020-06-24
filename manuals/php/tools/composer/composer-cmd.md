<!-- omit in toc -->
# Composer Commands

- [`composer create-project`](#composer-create-project)
- [`composer config`](#composer-config)
- [`composer list`](#composer-list)
- [`composer selfupdate`](#composer-selfupdate)
- [`composer global`](#composer-global)
- [`composer about`](#composer-about)

```bash
composer -h
composer --help
composer help

composer install -h
composer install --help
composer help list
```

列出所有命令

```bash
composer list
```

安装项目依赖 `composer.json`

```bash
composer install
```

## `composer create-project`

```bash
composer create-project -h
composer create-project --help
composer help create-project
```

```bash
composer create-project --prefer-dist laravel/lumen blog 5.8.8
```

## `composer config`

查看帮助

```bash
composer help config
```

列出所有配置项

```bash
composer config -l
```

查看源配置

```bash
composer config -g repo
```

## `composer list`

列出所有可用命令

```bash
composer help list
```

```bash
composer list
```

## `composer selfupdate`

更新到最新版本

```bash
composer selfupdate -h
composer selfupdate --help
composer help selfupdate
```

```bash
composer selfupdate
```

## `composer global`

Allows running commands in the global composer dir ($COMPOSER_HOME).

```bash
composer global -h
composer global --help
composer help global
```

查看全局软件包的安装位置

```bash
composer global about
```

## `composer about`

Shows the short information about Composer.

```bash
composer about -h
composer about --help
composer help about
```
