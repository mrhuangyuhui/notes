# Laravel Commands

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

## Controller

```bash
# 创建控制器类
php artisan make:controller StaticPagesController
```

## Key

```bash
php artisan key:generate -h
php artisan key:generate --help
```

```bash
php artisan key:generate
```

## Migrate

```bash
# 数据库迁移
php artisan migrate

# 数据库回滚
php artisan migrate:rollback

# 重置数据库并重新运行所有迁移
php artisan migrate:refresh
```

## Model

```bash
# 创建数据模型类
# 默认命名空间 namespace App;
php artisan make:model Article

# 指定命名空间 namespace App\Models;
php artisan make:model Models/Article

# 同时创建数据库迁移文件
php artisan make:model Models/Article -m
```

## Tinker

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

## Route

列出已添加的路由

```bash
php artisan route:list
```

## Policy

创建授权策略

```bash
php artisan make:policy UserPolicy
```

## Factory

创建 Factory 类

```bash
php artisan make:factory StatusFactory --model=Status
```

## Seeder

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
