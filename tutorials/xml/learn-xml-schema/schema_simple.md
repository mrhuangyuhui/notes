# [XSD Simple Elements](https://www.w3schools.com/xml/schema_simple.asp)

简单元素只包含文本，不包含子元素和属性。

```xml
<!-- 定义一个简单元素 xxx，数据类型是 yyy -->
<xs:element name="xxx" type="yyy"/>

<!-- 常用数据类型
xs:string
xs:decimal
xs:integer
xs:boolean
xs:date
xs:time -->
```

元素的定义

```xml
<!-- lastname age dateborn 都是简单元素 -->
<xs:element name="lastname" type="xs:string"/>
<xs:element name="age" type="xs:integer"/>
<xs:element name="dateborn" type="xs:date"/>
```

元素的使用

```xml
<!-- 简单元素只包含文本 -->
<lastname>Refsnes</lastname>
<age>36</age>
<dateborn>1970-03-27</dateborn>
```

简单元素可以指定默认值或固定值

```xml
<!-- 如果使用元素时没有指定值，将使用默认值 -->
<xs:element name="color" type="xs:string" default="red"/>
<!-- 使用元素时只能使用固定值，不能指定其他值 -->
<xs:element name="color" type="xs:string" fixed="red"/>
```