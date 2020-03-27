# PHP 数据类型

判断变量的数据类型

```php
<?php
$testing = 5;
echo "is null? ".is_null($testing);
echo "is an integer? ".is_int($testing);
echo "is a string? ".is_string($testing);
echo "is a double? ".is_double($testing);
echo "is boolean? ".is_bool($testing);
echo "is an array? ".is_array($testing);
?>
```

改变变量的数据类型

```php
<?php
$undecided = 3.14;
settype($undecided, 'string');
settype($undecided, 'integer');
settype($undecided, 'double');
settype($undecided, 'bool');
?>
```

获取变量的数据类型

```php
<?php
$undecided = 3.14;
echo gettype($undecided);
?>
```

隐式类型转换

```php
<?php
$undecided = 3.14;
$holder = (double)$undecided;
$holder = (string)$undecided;
$holder = (integer)$undecided;
$holder = (double)$undecided;
$holder = (boolean)$undecided;
$holder = (integer)$undecided;
?>
```

使用 `settype()` 来改变一个已有变量的类型和使用类型转换改变变量类型的主要区别在于：类型转换会生成一个拷贝，而保持原来的变量不动。