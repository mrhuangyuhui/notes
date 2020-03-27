# Composer Manual

<https://getcomposer.org/>

<https://packagist.org/>

查看源配置

```bash
composer config -g repo
```

阿里云镜像

```bash
composer config -g repos.packagist composer https://mirrors.aliyun.com/composer/
```

[中国全量镜像](https://pkg.phpcomposer.com/)

```bash
composer config -g repo.packagist composer https://packagist.phpcomposer.com
```

解除镜像

```bash
composer config -g --unset repos.packagist
```

## Install

[如何安装 Composer](https://pkg.phpcomposer.com/#how-to-install-composer)

```bash
php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"

php composer-setup.php

php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/local/bin/composer

composer --version
```

[Packagist 镜像使用方法](https://pkg.phpcomposer.com/#how-to-use-packagist-mirror)

```bash
composer config -g repo.packagist composer https://packagist.phpcomposer.com
```

## Commands

查看帮助

```bash
composer -h
```

查看某个命令的帮助

```bash
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

## Packages

数据填充包

<https://github.com/fzaninotto/Faker>