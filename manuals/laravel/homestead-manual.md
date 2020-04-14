<!-- omit in toc -->
# Homestead Manual

- [Install](#install)
- [Debug](#debug)

<https://laravel.com/docs/5.8/homestead>

<https://app.vagrantup.com/laravel/boxes/homestead>

<https://github.com/laravel/homestead>

<https://gitee.com/mrhuangyuhui/laravel-homestead>

<https://gitee.com/mrhuangyuhui/summerblue-homestead>

## Install

<https://laravel.com/docs/5.8/homestead#installation-and-setup>

> 国内网络问题导致安装失败，请参考以下文章：
>
> [Laravel 开发环境部署](https://learnku.com/docs/laravel-development-environment/5.8)
>
> [Homestead 安装需要知道的一些信息](https://learnku.com/laravel/t/2090/homestead-installation-needs-to-know-some-information)

<!-- #vagrant-cmd -->
```bash
# 安装最新版本
vagrant box add laravel/homestead --provider virtualbox
# 安装指定版本
vagrant box add laravel/homestead --provider virtualbox --box-version 9.4.0

# 下载并初始化 Homestead
git clone https://github.com/laravel/homestead.git ~/Homestead

cd ~/Homestead

git checkout release

bash init.sh

# 启动并登录虚拟主机
vagrant up

vagrant ssh
```

[Per Project Installation](https://laravel.com/docs/5.8/homestead#per-project-installation)

```bash
composer require laravel/homestead --dev

php vendor/bin/homestead make
```

## Debug

[Debugging Web Requests With Xdebug](https://laravel.com/docs/5.8/homestead#debugging-web-requests)

```bash
# 启用 Xdebug 模块
sudo phpenmod xdebug

# 禁用 Xdebug 模块
sudo phpdismod xdebug

# 检查安装结果
php --version | grep Xdebug
```
