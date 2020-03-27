# PHP Cookie

## Notes

[第 12 章 使用 Cookie 和用户会话](https://gitee.com/mrhuangyuhui/notes/blob/master/books/php/php-mysql-apache-5e/ch12.md)

## Snippets

设置并显示一个 cookie 值

```php
<?php
setcookie("vagetable", "artichoke", time()+3600, "/", "localhost", 0);

if (isset($_COOKIE['vagetable'])) {
    echo "<p>Hello again! You have chosen: ".$_COOKIE['vagetable']."</p>";
} else {
    echo "<p>Hello, you. This may be your first visit.</p>";
}
?>
```

删除一个 cookie

使用一个确定已经过期的时间，还要确保传递给 `setcookie()` 与最初设置 `cookie` 时候所使用的是相同的路径、域和安全参数。

```php
<?php
setcookie("vagetable", "artichoke", time()-60, "/", "localhost", 0);
```