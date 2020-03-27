# [XSD Elements Only](https://www.w3schools.com/xml/schema_complex_elements.asp)

定义只包含子元素的复合元素

```xml
<person>
  <firstname>John</firstname>
  <lastname>Smith</lastname>
</person>
```

```xml
<xs:element name="person">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="firstname" type="xs:string"/>
      <xs:element name="lastname" type="xs:string"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<!-- 或 -->

<xs:element name="person" type="persontype"/>

<xs:complexType name="persontype">
  <xs:sequence>
    <xs:element name="firstname" type="xs:string"/>
    <xs:element name="lastname" type="xs:string"/>
  </xs:sequence>
</xs:complexType>
```