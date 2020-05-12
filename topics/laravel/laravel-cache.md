# Laravel - Cache

> 相关笔记：[`laravel-redis.md`](laravel-redis.md)

<https://laravel.com/docs/5.8/cache>

> Laravel supports popular caching backends like Memcached and Redis out of the box.

> By default, Laravel is configured to use the `file` cache driver, which stores the serialized, cached objects in the filesystem.

> The `Illuminate\Contracts\Cache\Factory` and `Illuminate\Contracts\Cache\Repository` contracts provide access to Laravel's cache services. The `Factory` contract provides access to **all cache drivers** defined for your application. The `Repository` contract is typically an implementation of the **default cache driver** for your application as specified by your `cache` configuration file.
>
> However, you may also use the `Cache` facade, which is what we will use throughout this documentation. The `Cache` facade provides convenient, terse access to the underlying implementations of the Laravel cache contracts.

> In addition to using the `Cache` facade or cache contract, you may also use the global `cache` function to retrieve and store data via the cache.
>
> When the `cache` function is called without any arguments, it returns an instance of the `Illuminate\Contracts\Cache\Factory` implementation, allowing you to call other caching methods.

## Config

[`config/cache.php`](https://github.com/laravel/laravel/blob/v5.8.35/config/cache.php)

## API & Code

- [Illuminate\Contracts\Cache\Factory | Laravel API](https://laravel.com/api/5.8/Illuminate/Contracts/Cache/Factory.html) | [Code](https://github.com/laravel/framework/blob/5.8/src/Illuminate/Contracts/Cache/Factory.php)
- [Illuminate\Contracts\Cache\Repository | Laravel API](https://laravel.com/api/5.8/Illuminate/Contracts/Cache/Repository.html) | [Code](https://github.com/laravel/framework/blob/5.8/src/Illuminate/Contracts/Cache/Repository.php)
- [Illuminate\Support\Facades\Cache | Laravel API](https://laravel.com/api/5.8/Illuminate/Support/Facades/Cache.html) | [Code](https://github.com/laravel/framework/blob/5.8/src/Illuminate/Support/Facades/Cache.php)
