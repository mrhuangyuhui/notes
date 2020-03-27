# [XSD Attributes](https://www.w3schools.com/xml/schema_simple_attributes.asp)

所有属性都是简单类型

```xml
<!-- 定义一个属性 name，数据类型是 yyy -->
<xs:attribute name="xxx" type="yyy"/>

<!-- 常用数据类型
xs:string
xs:decimal
xs:integer
xs:boolean
xs:date
xs:time -->
```

属性的定义

```xml
<xs:attribute name="lang" type="xs:string"/>
```

属性的使用

```xml
<lastname lang="EN">Smith</lastname>
```

属性可以指定默认值或固定值

```xml
<xs:attribute name="lang" type="xs:string" default="EN"/>
<xs:attribute name="lang" type="xs:string" fixed="EN"/>
```

属性默认是可选的，可以用 `use="required"` 指定为必选。

```xml
<xs:attribute name="lang" type="xs:string" use="required"/>
```