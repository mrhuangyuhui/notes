# PHP - Array

PHP、MySQL 和 Apache 入门经典（第 5 版）

- [第 8 章 使用数组](https://gitee.com/mrhuangyuhui/notes/blob/master/books/php/php-24h-5e/ch08.md)

PHP 经典实例（第 3 版）

- [第 4 章 数组](https://gitee.com/mrhuangyuhui/notes/blob/master/books/php/php-cookbook-3e/ch04.md)

API

- [Arrays](http://php.net/array)
- [foreach](http://php.net/foreach)
- [list](http://php.net/list)
- [each](http://php.net/each)

## [`array_unique`](http://php.net/array_unique)

```php
<?php

$input = array("a" => "green", "red", "b" => "green", "blue", "red");
$result = array_unique($input);
print_r($result);
```

输出结果

```bash
Array
(
    [a] => green
    [0] => red
    [1] => blue
)
```

```php
<?php

$input = array(4, "4", "3", 4, 3, "3");
$result = array_unique($input);
var_dump($result);
```

输出结果

```bash
array(2) {
  [0]=>
  int(4)
  [2]=>
  string(1) "3"
}
```

## [`in_array`](http://php.net/in_array)

```php
<?php

$os = array("Mac", "NT", "Irix", "Linux");

if (in_array("Irix", $os)) {
    echo "Got Irix";
}

// 区分大小写
if (in_array("mac", $os)) {
    echo "Got mac";
}
```

输出结果

```bash
Got Irix
```