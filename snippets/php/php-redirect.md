# PHP 重定向

通过发送一个 `Location` 标头而不是 PHP 的默认标头，可以使浏览器重定向到一个新的页面。

```php
} elseif ($_POST['guess'] == $num_to_guess) {
    // 重定向到一个新的页面
    header("Location: http://www.163.com/");
    exit;
}
```

为了调用 `header()` 函数，必须绝对确保没有向浏览器发送输出。任何来自文档的输出，即便是脚本标记外的一个换行或者空格，都会引起标头发送。如果想要在脚本中使用 `header()` 函数，必须确保包含函数调用的 PHP 代码之前没有内容。

```php

} elseif ($_POST['guess'] == $num_to_guess) {
    // 不应该有输出
    echo "Congratulation!";
    // 重定向到一个新的页面
    header("Location: http://www.163.com/");
    exit;
}

```

输出结果

```html
Congratulation!<br />
<b>Warning</b>:  Cannot modify header information - headers already sent by (output started at /Applications/MAMP/htdocs/example.php:9) in <b>/Applications/MAMP/htdocs/example.php</b> on line <b>11</b><br />
```