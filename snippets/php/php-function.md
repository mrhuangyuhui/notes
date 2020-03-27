# PHP 函数

> 注意：函数名是不区分大小写的。

函数没有参数

```php
<?php
function bighello()
{
    echo "<h1>HELLO!</h1>";
}
bighello();
?>
```

函数有一个参数

```php
<?php
function printBR($txt) {
    echo $txt."<br/>";
}
printBR("This is a line.");
printbr("This is a new line.");
printbR("This is yet another line.");
?>
```

函数返回一个值

```php
<?php
function addNums($firstNum, $secondNum) {
    $result = $firstNum + $secondNum;
    return $result;
}
echo addNums(3, 5);
?>
```

为参数设定一个默认值

```php
<?php
function fontwrap($txt, $fontsize="12pt") {
    echo "<span style=\"font-size:$fontsize\">".$txt."</span>";
}
fontwrap("A Heading<br/>", "24pt");
fontwrap("some body text<br/>");
fontwrap("smaller body text<br/>");
fontwrap("even smaller body text<br/>");
?>
```

> 注意：当我们给一个可选参数一个默认值时，所有后续的参数也都应该给定默认值。

把参数通过引用传递给函数

```php
<?php
function addFive(&$num) {
    $num += 5;
}
$orignum = 10;
echo $orignum."<br/>";
addFive($orignum);
echo $orignum."<br/>";
?>
```

判断一个函数是否存在

```php
<?php
function tagWrap($tag, $txt, $func="") {
    if ( !empty($txt) && function_exists($func) ) {
        $txt = $func($txt);
        return "<$tag>$txt</$tag><br/>";
    }
    return "<strong>$txt</strong><br/>";
}

function underline($txt) {
    return "<span style=\"text-decoration: underline;\">$txt</span>";
}

echo tagWrap('strong', 'make me bold');
echo tagWrap('em', 'underline and italicize me', 'underline');
echo tagWrap('em', 'make me italic and quote me', create_function('$txt', 'return "&quot;$txt&quot;";'));
?>
```