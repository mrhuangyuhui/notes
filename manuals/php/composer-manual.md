<!-- omit in toc -->
# Composer Manual

- [Install](#install)
- [Docker](#docker)
- [Mirrors](#mirrors)
  - [Aliyun](#aliyun)
  - [Packagist](#packagist)
- [Commands](#commands)
  - [`composer create-project`](#composer-create-project)
  - [`composer config`](#composer-config)
  - [`composer list`](#composer-list)
  - [`composer selfupdate`](#composer-selfupdate)
- [`composer.json`](#composerjson)
  - [`config`](#config)
  - [`repositories`](#repositories)
  - [`scripts`](#scripts)
- [References](#references)
- [Packages](#packages)

<https://getcomposer.org/>

<https://getcomposer.org/doc/>

<https://packagist.org/>

<https://github.com/composer/composer>

<https://gitee.com/mrhuangyuhui/composer>

## Install

[如何安装 Composer](https://pkg.phpcomposer.com/#how-to-install-composer)

```bash
php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"

php composer-setup.php

php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/local/bin/composer

composer --version
```

更新到最新版本

```bash
composer selfupdate
```

## Docker

<https://hub.docker.com/_/composer>

<https://github.com/composer/docker>

```bash
docker pull composer:1.10.4
```

启动交互容器

```bash
docker run -it --rm --volume `pwd`:/app composer:1.10.4 /bin/sh
```

安装项目依赖

```bash
docker run -it --rm --volume `pwd`:/app composer:1.10.4 install
```

<!-- #composer-mirror -->
## Mirrors

查看当前源镜像

```bash
composer config -g repo
```

> 注意：若项目之前已通过其他源安装，则需要更新 `composer.lock` 文件。

```bash
composer update --lock
```

### Aliyun

[阿里云 Composer 全量镜像](https://developer.aliyun.com/composer)

全局配置（推荐）

```bash
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# 取消配置
composer config -g --unset repos.packagist
```

项目配置

```bash
composer config repo.packagist composer https://mirrors.aliyun.com/composer/

# 取消配置
composer config --unset repos.packagist
```

### Packagist

[Packagist / Composer 中国全量镜像](https://pkg.phpcomposer.com/)

全局配置（推荐）

```bash
composer config -g repo.packagist composer https://packagist.phpcomposer.com

# 取消配置
composer config -g --unset repos.packagist
```

项目配置

```bash
composer config repo.packagist composer https://packagist.phpcomposer.com

# 取消配置
composer config --unset repos.packagist
```

<!-- #composer-cmd -->
## Commands

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

### `composer create-project`

```bash
composer help create-project
```

```bash
composer create-project --prefer-dist laravel/lumen myapp 5.8.8
```

### `composer config`

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

### `composer list`

列出所有可用命令

```bash
composer help list
```

```bash
composer list
```

### `composer selfupdate`

更新到最新版本

```bash
composer selfupdate -h
composer selfupdate --help
composer help selfupdate
```

```bash
composer selfupdate
```

## `composer.json`

### `config`

<https://getcomposer.org/doc/04-schema.md#config>

<https://getcomposer.org/doc/06-config.md>

### `repositories`

<https://getcomposer.org/doc/04-schema.md#repositories>

### `scripts`

<https://getcomposer.org/doc/04-schema.md#scripts>

<https://getcomposer.org/doc/articles/scripts.md>

## References

<https://getcomposer.org/doc/>

## Packages

数据填充包

<https://github.com/fzaninotto/Faker>
