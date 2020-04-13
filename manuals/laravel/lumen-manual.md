# Lumen Manual

<https://lumen.laravel.com/>

<https://packagist.org/packages/laravel/lumen>

<https://lumen.laravel.com/docs/5.8>

<https://github.com/laravel/lumen>

<https://github.com/laravel/lumen-framework>

<https://gitee.com/mrhuangyuhui/lumen>

<https://gitee.com/mrhuangyuhui/lumen-framework>

## Install

### Docker

> 提示：以下命令只用来创建项目，开发环境仍然使用 [Homestead](#homestead)。

```bash
# 启动交互容器
docker run -it --rm --volume `pwd`:/app composer:1.10.4 /bin/sh

# 配置阿里云镜像
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# 创建项目
composer create-project --prefer-dist laravel/lumen blog 5.8.8
```

### Homestead

- 配置 Homestead

> 提示：Homestead 的环境搭建请参考笔记 [Homestead Manual](homestead-manual.md#install)

[`~/Homestead/Homestead.yml`](https://gitee.com/mrhuangyuhui/homestead/blob/v10.1.0/Homestead.yaml.example)

```yml
---
ip: "192.168.10.10"
memory: 2048
cpus: 2
provider: virtualbox

authorize: ~/.ssh/id_rsa.pub

keys:
    - ~/.ssh/id_rsa

folders:
    # 目录映射
    - map: ~/code
      to: /home/vagrant/code

sites:
    # 站点映射
    - map: blog.test
      to: /home/vagrant/code/blog/public

databases:
    # 数据库名称
    - blog

features:
    - mariadb: false
    - ohmyzsh: false
    - webdriver: false
```

- 配置 `hosts`

```bash
# Mac
$ sudo vim /private/etc/hosts
192.168.10.10 blog.test
```

- 创建项目

> 提示：Composer 配置国内源镜像请参考笔记 [Composer Manual](/manuals/php/composer-manual.md#mirrors)

```bash
cd ~/Homestead

# 启动虚拟机
vagrant up

# 列出所有虚拟机
vagrant global-status

# 登录虚拟机
vagrant ssh 6b5a146

# 创建项目
composer create-project --prefer-dist laravel/lumen blog 5.8.8
```

- 配置项目

`blog/.env`

> 提示：`APP_KEY` 可在 <https://www.random.org/passwords/> 上创建

```
APP_NAME=Blog
APP_ENV=local
APP_KEY=kuveL3R7xzY2LKq7qpxdZ8z2
APP_DEBUG=true
APP_URL=http://blog.test
APP_TIMEZONE=UTC

LOG_CHANNEL=stack
LOG_SLACK_WEBHOOK_URL=

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=blog
DB_USERNAME=homestead
DB_PASSWORD=secret

CACHE_DRIVER=file
QUEUE_CONNECTION=sync
```

- 验证安装结果

在浏览器打开 <http://blog.test/>
