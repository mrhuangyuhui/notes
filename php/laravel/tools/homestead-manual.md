<!-- omit in toc -->
# Homestead Manual

- [Install](#install)
- [Debug](#debug)
- [Repos](#repos)
- [Docs](#docs)
- [`user-customizations.sh`](#user-customizationssh)
- [Settler](#settler)
- [Articles](#articles)

<https://laravel.com/docs/homestead>

<https://app.vagrantup.com/laravel/boxes/homestead>

Homestead Repo、Homestead Box、Settler Repo 三者简介：

- [Homestead Repo](https://github.com/laravel/homestead)：存放运行 Homestead 虚拟机时配置各种环境的脚本，主要是 [`Homestead.yaml`](https://github.com/laravel/homestead/blob/master/Homestead.yaml.example)；
- [Homestead Box](https://app.vagrantup.com/laravel/boxes/homestead)：Homestead 虚拟机；
- [Settler Repo](https://github.com/laravel/settler)：存放创建 Homestead 虚拟机时安装各种软件的脚本，主要是 [`provision.sh`](https://github.com/laravel/settler/blob/master/scripts/provision.sh)。

> 提示：Homestead Box 的版本与 Settler Repo 的版本一一对应，例如：<https://github.com/laravel/settler/releases/tag/v9.4.0> 和 <https://app.vagrantup.com/laravel/boxes/homestead/versions/9.4.0>。

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
git clone https://github.com/laravel/homestead.git

cd ~/homestead

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

部署多个版本盒子的 Homestead 环境，可以采取以下步骤：

- 添加两个版本的盒子

```bash
vagrant box add laravel/homestead --provider virtualbox --box-version 9.1.0
vagrant box add laravel/homestead --provider virtualbox --box-version 9.4.0
```

- Clone 两个目录

```bash
git@gitee.com:mrhuangyuhui/homestead.git ~/homestead_box_v9.1.0
git@gitee.com:mrhuangyuhui/homestead.git ~/homestead_box_v9.4.0
```

- 修改两个版本的 YAML

```bash
bash init.sh
```

`~/homestead_box_v9.1.0/Homestead.yml`

```yml
# ...
name: homestead_box_v9.1.0
version: "= 9.1.0"
# ...
```

 `~/homestead_box_v9.4.0/Homestead.yml`

```yml
# ...
name: homestead_box_v9.4.0
version: "= 9.4.0"
# ...
```

<!-- #homestead-debug -->
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

## Repos

<https://github.com/laravel/homestead>

<https://github.com/laravel/settler>

<https://gitee.com/mrhuangyuhui/laravel-homestead>

<https://gitee.com/mrhuangyuhui/summerblue-homestead>

## Docs

<https://laravel.com/docs/homestead>

## `user-customizations.sh`

自定义配置脚本

[`repo:^github\.com/laravel/homestead$ user-customizations.sh - Sourcegraph`](https://sourcegraph.com/search?q=repo:%5Egithub%5C.com/laravel/homestead%24+user-customizations.sh&patternType=literal)

```bash
cd ~homestead

touch user-customizations.sh

chmod a+x user-customizations.sh

vagrant provision
```

```sh
#!/bin/sh

# 设置阿里云镜像
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# 启用调试模块
sudo phpenmod xdebug
```

## Settler

<https://github.com/laravel/settler>

## Articles

[Explaining Laravel Settler](https://joeferguson.me/explaining-laravel-settler/)
