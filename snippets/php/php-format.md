# PHP 格式化

使用 `printf()`

```php
<?php
$number = 543;
printf("Decimal: %d<br/>", $number);
printf("Binary: %b<br/>", $number);
printf("Double: %f<br/>", $number);
printf("Octal: %o<br/>", $number);
printf("String: %s<br/>", $number);
printf("Hex (lower): %x<br/>", $number);
printf("Hex (upper): %X<br/>", $number);
?>
```

输出结果

```html
Decimal: 543<br/>Binary: 1000011111<br/>Double: 543.000000<br/>Octal: 1037<br/>String: 543<br/>Hex (lower): 21f<br/>Hex (upper): 21F<br/>
```

使用 0 作为占位符来填充

```php
<?php
printf("%04d", 36)
?>
```

输出结果

```html
0036
```

使用空格作为占位符来填充（`<pre>` 标记强制 HTML 显示空格）

```php
<?php
echo "<pre>";
printf("% 4d", 36);
echo "</pre>";
?>
```

输出结果

```html
  36
```

可以在填充指示符中指定空格或 0 以外的任何字符，只需要一个单引号后面跟着你想用的字符就行。

```php
<?php
printf("%'x4d", 36);
?>
```

输出结果

```html
xx36
```

指定一个字段宽度

默认情况下是右对齐的

```php
<?php
echo "<pre>\n";
printf("%20s\n", "Books");
printf("%20s\n", "CDs");
printf("%20s\n", "DVDs");
printf("%20s\n", "Games");
printf("%20s\n", "Magazines");
echo "</pre>";
?>
```

输出结果

```html
<pre>
               Books
                 CDs
                DVDs
               Games
           Magazines
</pre>
```

在字段宽度指示符前面加一个减号，让其左对齐。

```php
<?php
echo "<pre>\n";
printf("%-20s\n", "Books");
printf("%-20s\n", "CDs");
printf("%-20s\n", "DVDs");
printf("%-20s\n", "Games");
printf("%-20s\n", "Magazines");
echo "</pre>";
?>
```

输出结果

```html
<pre>
Books
CDs
DVDs
Games
Magazines
</pre>
```

指定精度

```php
<?php
printf("%.2f", 5.333333);
?>
```

输出结果

```html
5.33
```

参数交换

```php
<?php
$dates = array(
    array('mon' => 12, 'mday' => 25, 'year' => 2011),
    array('mon' => 1, 'mday' => 23, 'year' => 2012),
    array('mon' => 10, 'mday' => 29, 'year' => 2011));

$format = include("local_format.php");
foreach ($dates as $date) {
    printf("$format", $date['mon'], $date['mday'], $date['year']);
}
?>
```

```php
// local_format.php
<?php
return "%02d/%02d/%d<br/>";
?>
```

输出结果

```html
12/25/2011<br/>01/23/2012<br/>10/29/2011<br/>
```

可以改变参数在格式控制代码中的顺序（百分号后面插入参数的序号，后面跟着一个转义的美元符号）

```php
// local_format.php
<?php
return "%2\$02d/%1\$02d/%3\$d<br/>";
?>
```

输出结果

```html
25/12/2011<br/>23/01/2012<br/>29/10/2011<br/>
```

存储一个格式化字符串

```php
<?php
$cash = sprintf("%.2f", 21.334454);
echo "You have \$$cash to spend.";
?>
```

输出结果

```html
You have $21.33 to spend.
```