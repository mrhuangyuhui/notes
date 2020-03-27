# PHP Session

## Notes

[第 12 章 使用 Cookie 和用户会话](https://gitee.com/mrhuangyuhui/notes/blob/master/books/php/php-mysql-apache-5e/ch12.md)

## Snippets

启动会话的两种方式：

- 在配置文件 `php.ini` 中设置 `session.auto_start = 1`，这样可以确保一个会话针对每个 PHP 脚本而启动。
- 在每个脚本中调用 `session_start()` 函数。

开始或继续一个会话

```php
<?php
session_start();
echo "<p>Your session ID is ".session_id()."</p>";
?>
```

注意：

- 第一次初始化一个会话的时候，由于 `session_start()` 尝试设置一个 cookie，因此必须在向浏览器输出任何内容之前调用这个函数。
- 只要浏览器是激活的，会话将一直保持。如果重新打开浏览器，cookie 将不再存储。
- 在配置文件中可以修改 `session.cookie_lifetime` 的值，设置 cookie 的过期周期。

可以在超全局变量 `$_SESSION` 中存储任意多个变量，然后在任何支持会话的页面上访问它们。

```php
<?php
session_start();
$_SESSION['product1'] = "Sonic Screwdriver";
$_SESSION['product2'] = "HAL 2000";
echo "The products have been registered.";
?>
```

在同一个浏览器打开以下页面，访问存储的会话变量。

```php
<?php
session_start();
?>
<p>Your chosen products are:</p>
<ul>
    <li><?php echo $_SESSION['product1']; ?></li>
    <li><?php echo $_SESSION['product2']; ?></li>
</ul>
```

在幕后，PHP 把会话变量写入到一个临时文件，函数 `session_save_path()` 可以查看这个文件保存在系统上的什么地方。

```php
<?php
session_start();
$_SESSION['product1'] = "Sonic Screwdriver";
$_SESSION['product2'] = "HAL 2000";
echo "The products have been registered.<br>";
// 打印临时文件保存的路径
echo session_save_path();
?>
```

`session_destroy()` 函数可以用来销毁一个会话，删除保存在服务器上的会话文件，但不会立刻删除已注册的变量，因为仍保存在内存中。

```php
<?php
session_start();
$_SESSION['test'] = 5;
// 销毁会话会删除服务器上的 session 文件
session_destroy();
// 仍然可以访问已注册的变量，因为还保留在内存当中。
echo $_SESSION['test'];
?>
```

要从一个会话中删除所有已注册变量，需要重置变量。

```php
<?php
session_start();
$_SESSION['test'] = 5;
session_destroy();
// 重置变量也就是从内存中重置
unset($_SESSION['test']);
echo $_SESSION['test'];
?>
```

因此，释放用户的所有 session 资源，需要顺序执行如下代码：

```php
<?php
session_start();
$_SESSION['user'] = 'wangh';
session_unset();
session_destroy();
?>
```