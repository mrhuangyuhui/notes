# Laravel - PhpStorm

[PhpStorm](https://www.jetbrains.com/help/phpstorm/laravel.html?keymap=primary_default_for_macos)

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
