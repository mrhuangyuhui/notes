# Lumen Manual

<https://lumen.laravel.com/>

<https://github.com/laravel/lumen>

<https://packagist.org/packages/laravel/lumen>

<https://lumen.laravel.com/docs/5.8>

## Install

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
