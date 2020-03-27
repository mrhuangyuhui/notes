# [XSD Complex Elements](https://www.w3schools.com/xml/schema_complex.asp)

What is a Complex Element?
A complex element is an XML element that contains other elements and/or attributes.

There are four kinds of complex elements:

- empty elements
- elements that contain only other elements
- elements that contain only text
- elements that contain both other elements and text

Note: Each of these elements may contain attributes as well!

复合元素必须包含子元素或属性，否则是简单元素。

复合元素的几种类型

> 注意：判断一个元素是否为复合元素，关键看是否包含子元素或属性。

```xml
<!-- 只包含属性 -->
<product pid="1345"/>

<!-- 只包含子元素 -->
<employee>
  <firstname>John</firstname>
  <lastname>Smith</lastname>
</employee>

<!-- 包含属性和文本 -->
<food type="dessert">Ice cream</food>

<!-- 包含子元素和文本 -->
<description>
It happened on <date lang="norwegian">03.03.99</date> ....
</description>
```

复合元素的定义

```xml
<!-- 方式一：在元素内用 <complexType> 指定元素为复合类型 -->
<xs:element name="employee">
  <xs:complexType>
    <xs:sequence>
      <!-- 定义子元素并指定顺序 -->
      <xs:element name="firstname" type="xs:string"/>
      <xs:element name="lastname" type="xs:string"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<!-- 方式二：在元素外定义一个复合类型并在元素内的 type 属性中引用 -->
<xs:element name="employee" type="personinfo"/>
<!-- 复合类型可以在其他地方被重用 -->
<xs:complexType name="personinfo">
  <xs:sequence>
    <xs:element name="firstname" type="xs:string"/>
    <xs:element name="lastname" type="xs:string"/>
  </xs:sequence>
</xs:complexType>
```

复合元素的使用

```xml
<employee>
  <firstname>John</firstname>
  <lastname>Smith</lastname>
</employee>
```

复合类型的扩展

```xml
<xs:element name="employee" type="fullpersoninfo"/>

<xs:complexType name="personinfo">
  <xs:sequence>
    <xs:element name="firstname" type="xs:string"/>
    <xs:element name="lastname" type="xs:string"/>
  </xs:sequence>
</xs:complexType>

<xs:complexType name="fullpersoninfo">
  <xs:complexContent>
    <!-- 扩展复合类型 personinfo -->
    <xs:extension base="personinfo">
      <xs:sequence>
        <xs:element name="address" type="xs:string"/>
        <xs:element name="city" type="xs:string"/>
        <xs:element name="country" type="xs:string"/>
      </xs:sequence>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>
```