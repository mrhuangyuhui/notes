# PHP 条件语句

```php
<?php
$mood = "sad";
if ($mood == "happy") {
    echo "Hooray! I'm in a good mood!";
} elseif ($mood == "sad") {
    echo "Awww. Don't be down!";
} else {
    echo "I'm neither happy nor sad, but $mood.";
}
?>
```

```php
<?php
$mood = "sad";
switch ($mood) {
    case "happy":
        echo "Hooray! I'm in a good mood!";
        break;
    case "sad":
        echo "Awww. Don't be down!";
        break;
    default:
        echo "I'm neither happy nor sad, but $mood.";
        break;
}
?>
```

```php
<?php
$mood = "sad";
$text = ($mood == "happy") ? "I am in a good mood!" : "I am in a $mood mood.";
echo "$text";
?>
```