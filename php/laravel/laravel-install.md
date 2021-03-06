<!-- #laravel-install -->
<!-- omit in toc -->
# Laravel - Install

- [Composer Create-Project](#composer-create-project)
- [Laravel Installer](#laravel-installer)

<https://laravel.com/docs/7.x/installation>

<https://laravel.com/docs/5.8/installation>

<https://github.com/mrhuangyuhui/laravel-playground>

## Composer Create-Project

```bash
# 安装最新稳定版
composer create-project --prefer-dist laravel/laravel blog

# 指定版本 7.x
composer create-project --prefer-dist laravel/laravel blog 7.*

# 5.8.x
composer create-project --prefer-dist laravel/laravel blog 5.8.*

# 5.8.35
composer create-project --prefer-dist laravel/laravel blog 5.8.35
```

```bash
cd blog

php artisan serve
```

## Laravel Installer

```bash
composer global require laravel/installer
```

```bash
(echo; echo 'export PATH=$PATH:$HOME/.composer/vendor/bin'; echo) >> ~/.bash_profile

source ~/.bash_profile
```

```bash
laravel new blog

cd blog

php artisan serve
```
