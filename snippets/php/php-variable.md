# PHP 变量

使用 `global` 语句访问全局变量

```php
<?php
$life = 42;
function meaningOfLife() {
    global $life;
    echo "The meaning of life is ".$life;
}
meaningOfLife();
?>
```

在一个函数中使用 `static` 语句声明了一个变量，这个变量对于该函数仍保持为局部的，并且函数在从一次执行到另一次执行的过程中会“记住”该变量的值。

```php
<?php
function numberedHeading($txt) {
    static $num_of_calls;
    $num_of_calls++;
    echo "<h1>".$num_of_calls." ".$txt."</h1>";
}
numberedHeading("Widgets");
echo "<p>We build a fine range of widgets.</p>";
numberedHeading("Doodads");
echo "<p>Finest in the world.</p>";
?>
```