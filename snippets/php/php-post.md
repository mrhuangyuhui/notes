# PHP 预定义变量 `$_POST`

```html
<!DOCTYPE html>
<html>
<head>
    <title>A simple response</title>
</head>
<body>
    <!-- 用预定义变量 _POST 读取请求字段值 -->
    <p>Welcome, <strong><?php echo $_POST['user']; ?></strong>!</p>
    <p>Your message is: <strong><?php echo $_POST['message']; ?></strong></p>
</body>
</html>
```