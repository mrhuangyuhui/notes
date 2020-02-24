# PHP 日期和时间

获取 UNIX 时间戳

```php
<?php
echo time();
?>
```

使用 `getdate()` 获取日期信息

```php
<?php
$date_array = getdate();
foreach ($date_array as $key => $value) {
    echo "$key = $value<br>";
}
?>
<br/>
<?php
echo "<p>Today's date: ".$date_array['mon']."/".$date_array['mday']."/".$date_array['year']."</p>";
?>
```

使用 `date()` 格式化一个日期

```php
<?php
$time = time();
echo date("m/d/y G:i:s e", $time);
echo "<br/>";
echo "Today is ";
// 如果包含的字符是格式化代码，必须在其前面放置一个斜杠来转义它们。对于转义时变成了控制字符的那些字符，必须转义它们前面的反斜杠。
echo date("jS \of F Y, \a\\t g:ia \i\\n e", $time);
?>
```

使用 `mktime()` 创建一个时间戳

```php
<?php
$time = mktime(21, 34, 0, 1, 17, 2012);
echo date("m/d/y G:i:s e", $time);
echo "<br/>";
echo "The date is ";
echo date("jS \of F Y, \a\\t g:ia \i\\n e", $time);
?>
```