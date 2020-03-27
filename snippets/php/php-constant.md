# PHP 常量

常量必须使用 PHP 内建的 `define()` 函数来创建，随后这个常量是不能改变的，除非再次明确地 `define()` 它。

按照惯例，常量的名字应该是大写的，常量只能使用常量名访问，不需要美元符号。

```php
<?php
define("THE_YEAR", "2012");
echo "It is the year ".THE_YEAR.".";
?>
```