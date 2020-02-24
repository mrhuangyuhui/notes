# Laravel Manual

<https://laravel.com/>

<https://github.com/laravel/laravel>

<https://github.com/laravel/framework>

<https://gitee.com/mrhuangyuhui/laravel>

<https://laravel.com/api/5.8/index.html>

<https://packagist.org/packages/laravel/laravel>

<https://www.golaravel.com/>

生成 API 文档 <https://github.com/FriendsOfPHP/Sami>

[Laravel 入门指南](https://laravel-china.org/topics/7227/laravel-introductory-guide)

[Laravel China 社区](https://learnku.com/laravel)

[Laravel 社区文档](https://learnku.com/laravel/docs)

- [Laravel 5.8 中文文档](https://learnku.com/docs/laravel/5.8)
- [Laravel 开发环境部署](https://learnku.com/docs/laravel-development-environment/5.8)
- [Laravel 速查表](https://learnku.com/docs/laravel-cheatsheet/5.8)
- [Laravel 项目开发规范](https://learnku.com/docs/laravel-specification/5.5)

[优质外文翻译](https://learnku.com/laravel/c/translations)

[Composer 中文镜像](https://laravel-china.org/composer)

[《如何选择 Laravel 框架版本》](https://learnku.com/laravel/t/2595)

[《为什么必须使用 Homestead 来开发 Laravel 应用？》](https://learnku.com/articles/4668/why-do-you-have-to-use-homestead-to-develop-laravel-applications)

<https://github.com/summerblue/laravel-ubuntu-init>

[阿里云 Composer 全量镜像](https://developer.aliyun.com/composer)

创建项目

```bash
composer create-project laravel/laravel laravel54 5.4.*
```

## Commands

<https://learnku.com/docs/laravel/5.4/artisan/1245>

查看帮助信息

```bash
php artisan help

# 查看某个命令的帮助信息
php artisan help migrate
```

列出所有命令

```bash
php artisan list
```

启动内置服务器

```bash
# 默认端口 8000
php artisan serve

# 自定义端口 9000
php artisan serve --port 9000

# 接受外部访问
php artisan serve --host 0.0.0.0
```

列出可创建的资源

```bash
php artisan list make
```

创建 `APP_KEY`

```bash
php artisan key:generate
```

### Controller

```bash
# 创建控制器类
php artisan make:controller StaticPagesController
```

### Key

```bash
php artisan key:generate -h
php artisan key:generate --help
```

```bash
php artisan key:generate
```

### Migrate

```bash
# 数据库迁移
php artisan migrate

# 数据库回滚
php artisan migrate:rollback

# 重置数据库并重新运行所有迁移
php artisan migrate:refresh
```

### Model

```bash
# 创建数据模型类
# 默认命名空间 namespace App;
php artisan make:model Article

# 指定命名空间 namespace App\Models;
php artisan make:model Models/Article

# 同时创建数据库迁移文件
php artisan make:model Models/Article -m
```

### Tinker

```bash
# 启动 Tinker
php artisan tinker
```

创建对象

```bash
>>> use App\Models\User

# 创建用户
>>> User::create(['name'=> 'Summer', 'email'=>'summer@example.com','password'=>bcrypt('password')])
```

查找对象

```bash
# 查找 id 为 1 的用户
>>> User::find(1)

# 查找第一个用户
>>> User::first()

# 查找所有用户
>>> User::all()
```

更新对象

```bash
# 通过 `save` 方法更新
>>> $user = User::first()
>>> $user->name = 'Monkey'
>>> $user->save()

# 通过 `update` 方法更新
>>> $user = User::first()
>>> $user->update(['name'=>'Summer'])
```

### Route

列出已添加的路由

```bash
php artisan route:list
```

### Policy

创建授权策略

```bash
php artisan make:policy UserPolicy
```

### Factory

创建 Factory 类

```bash
php artisan make:factory StatusFactory --model=Status
```

### Seeder 假数据填充

创建 Seeder 类

```bash
php artisan make:seeder UsersTableSeeder
```

执行假数据填充

```bash
# 重置数据库
php artisan migrate:refresh
# 执行假数据填充
php artisan db:seed

# 执行某个模型的假数据填充
php artisan db:seed --class=UsersTableSeeder

# 重置数据库并执行假数据填充
php artisan migrate:refresh --seed
```

## API

<https://laravel.com/api/5.8/index.html>

<https://github.com/FriendsOfPHP/Sami>

## References

默认提示信息多语言版本翻译

<https://github.com/overtrue/laravel-lang/>

## Tutorials

[Laravel 实战课程系列](https://learnku.com/laravel/courses)

## Plugins

<https://github.com/filp/whoops>

<https://github.com/mewebstudio/captcha>

## IDEs

### [PhpStorm](https://www.jetbrains.com/help/phpstorm/laravel.html?keymap=primary_default_for_macos)

安装 [Laravel](https://plugins.jetbrains.com/plugin/7532-laravel-plugin) 插件

- [Laravel Plugin](https://plugins.jetbrains.com/plugin/7532-laravel-plugin)
- [Managing plugins](https://www.jetbrains.com/help/phpstorm/managing-plugins.html)

配置 Composer

- [Composer Dependency Manager](https://www.jetbrains.com/help/phpstorm/using-the-composer-dependency-manager.html)

安装 [Laravel IDE helper](https://github.com/barryvdh/laravel-ide-helper)

```bash
composer require --dev barryvdh/laravel-ide-helper
```

添加 `ServiceProvider`

`app/config/app.php`

```php
return array(
    // ...
    'providers' => array(
        // ...
        // Laravel IDE helper
        'Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider',
    ),
    // ...
);
```
