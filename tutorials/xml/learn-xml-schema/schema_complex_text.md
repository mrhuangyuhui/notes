# [XSD Text-Only Elements](https://www.w3schools.com/xml/schema_complex_text.asp)

定义只包含文本和属性的复合元素

```xml
<shoesize country="france">35</shoesize>
```

关键点：`<xs:simpleContent>`

```xml
<xs:element name="shoesize">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:integer">
        <xs:attribute name="country" type="xs:string" />
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
</xs:element>

<!-- 或 -->

<xs:element name="shoesize" type="shoetype"/>

<xs:complexType name="shoetype">
  <xs:simpleContent>
    <xs:extension base="xs:integer">
      <xs:attribute name="country" type="xs:string" />
    </xs:extension>
  </xs:simpleContent>
</xs:complexType>
```