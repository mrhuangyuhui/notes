# [XSD - The `<schema>` Element](https://www.w3schools.com/xml/schema_schema.asp)

XSD 文档的结构

```xml
<?xml version="1.0"?>

<!-- <schema> 是根元素 -->
<!-- <schema> 元素可以包含属性 -->
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
targetNamespace="https://www.w3schools.com"
xmlns="https://www.w3schools.com"
elementFormDefault="qualified">

</xs:schema>
```

```xml
<!-- xmlns 定义了一个命名空间 -->
<!-- xs 是命名空间的别名 -->
<!-- "http://www.w3.org/2001/XMLSchema" 是命名空间的全限定名 -->
<!-- 该命名空间定义了某些元素及其数据类型，使用这些元素要加前缀 xs -->
xmlns:xs="http://www.w3.org/2001/XMLSchema"
```

```xml
<!-- 默认命名空间，不带别名 -->
<!-- 使用默认命名空间定义的元素不用加前缀 -->
xmlns="https://www.w3schools.com"
```

引用 XSD 文档

`note.xml`

```xml
<?xml version="1.0"?>

<note
xmlns="https://www.w3schools.com"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="https://www.w3schools.com/xml/note.xsd">
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>
```

```xml
<!-- 定义命名空间 xsi 后 -->
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
<!-- 方可使用属性 schemaLocation 引用外部 XSD 文档 -->
xsi:schemaLocation="https://www.w3schools.com/xml/note.xsd"
```