# PHP 循环语句

```php
<?php
$counter = 1;
while ($counter <= 12) {
    echo $counter." times 2 is ".($counter * 2)."<br/>";
    $counter++;
}
?>
```

```php
<?php
$num = 395;
do {
    echo "The number is: ".$num."<br/>";
    $num++;
} while ( ($num > 200) && ($num < 400) );
?>
```

```php
<?php
for ($counter = 1; $counter <= 12; $counter++) { 
    echo $counter." times 2 is ".($counter * 2)."<br/>";
}
?>
```

使用 `break` 终止整个循环

```php
<?php
for ($counter = -4; $counter <= 10; $counter++) {
    if ($counter == 0) {
        break;
    }
    $temp = 4000/$counter;
    echo "4000 divided by ".$counter." is $temp<br/>";
}
?>
```

使用 `continue` 终止当前循环

```php
<?php
for ($counter = -4; $counter <= 10; $counter++) {
    if ($counter == 0) {
        continue;
    }
    $temp = 4000/$counter;
    echo "4000 divided by ".$counter." is $temp<br/>";
}
?>
```