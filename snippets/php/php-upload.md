# PHP 文件上传

上传文件的信息存储在 `$_FILES` 预定义变量中，这些信息通过表单中一个或多个上传字段的名字来索引。这些键中的每一个相应值就是一个关联数组。

元素 | 包含 | 示例
---|---|---
`$_FILES['fileupload']['name']` | 上传文件的最初名字 | `test.gif`
`$_FILES['fileupload']['tmp_name']` | 临时文件的路径 | `tmp/phprDfZvN`
`$_FILES['fileupload']['size']` | 上传文件的大小（字节）| 6835 
`$_FILES['fileupload']['type']` | 上传文件的 `MIME` 类型（由客户端给定）| `image/gif`

```php
<?php
// 根据不同操作系统设定一个存在的目录，用来存放上传文件。
$file_dir = "/Applications/MAMP/htdocs";

// 处理多个文件上传，上传字段存储到 $field（一个字段对应一个文件），文件信息存储到 $file_array。
foreach ($_FILES as $field => $file_array) {
   echo "field: ".$field."<br>\n";
   echo "path: ".$file_array['tmp_name']."<br>\n";
   echo "name: ".$file_array['name']."<br>\n";
   echo "type: ".$file_array['type']."<br>\n";
   echo "size: ".$file_array['size']."<br>\n";

   // 检查文件是否存在
    if (is_uploaded_file($file_array['tmp_name'])) {
        // 移动文件到指定目录，如果移动失败，则退出程序。
        move_uploaded_file($file_array['tmp_name'], "$file_dir/".$file_array['name'])
        or die("Couldn't move file");
    } else {
        echo "No file found.";
    }
}
?>
```