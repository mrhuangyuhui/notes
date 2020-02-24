# [XSD Indicators](https://www.w3schools.com/xml/schema_complex_indicators.asp)

## Order Indicators

### All Indicator

指定所有子元素必须都出现且只能出现一次，但可任意排序。

关键点：`<xs:all>`

```xml
<xs:element name="person">
  <xs:complexType>
    <xs:all>
      <xs:element name="firstname" type="xs:string"/>
      <xs:element name="lastname" type="xs:string"/>
    </xs:all>
  </xs:complexType>
</xs:element>
```

### Choice Indicator

指定只能出现其中一个子元素

关键点：`<xs:choice>`

```xml
<xs:element name="person">
  <xs:complexType>
    <xs:choice>
      <xs:element name="employee" type="employee"/>
      <xs:element name="member" type="member"/>
    </xs:choice>
  </xs:complexType>
</xs:element>
```

### Sequence Indicator

指定子元素的出现顺序

关键点：`<xs:sequence>`

```xml
<xs:element name="person">
   <xs:complexType>
    <xs:sequence>
      <xs:element name="firstname" type="xs:string"/>
      <xs:element name="lastname" type="xs:string"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>
```

## Occurrence Indicators

### `maxOccurs` Indicator

指定元素出现的最大次数

关键点：`maxOccurs`

```xml
<xs:element name="person">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="full_name" type="xs:string"/>
      <xs:element name="child_name" type="xs:string" maxOccurs="10"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>
```

`maxOccurs="unbounded"` 表示不限次数

### `minOccurs` Indicator

指定元素出现的最小次数

关键点：`minOccurs`

```xml
<xs:element name="person">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="full_name" type="xs:string"/>
      <xs:element name="child_name" type="xs:string"
      maxOccurs="10" minOccurs="0"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>
```

## Group Indicators

### Element Groups

元素分组

关键点：`<xs:group>`

```xml
<!-- 定义元素组 -->
<xs:group name="persongroup">
  <xs:sequence>
    <xs:element name="firstname" type="xs:string"/>
    <xs:element name="lastname" type="xs:string"/>
    <xs:element name="birthday" type="xs:date"/>
  </xs:sequence>
</xs:group>

<xs:element name="person" type="personinfo"/>

<xs:complexType name="personinfo">
  <xs:sequence>
    <!-- 引用元素组 -->
    <xs:group ref="persongroup"/>
    <xs:element name="country" type="xs:string"/>
  </xs:sequence>
</xs:complexType>
```

### Attribute Groups

属性分组

关键点：`<xs:attributeGroup>`

```xml
<!-- 定义属性组 -->
<xs:attributeGroup name="personattrgroup">
  <xs:attribute name="firstname" type="xs:string"/>
  <xs:attribute name="lastname" type="xs:string"/>
  <xs:attribute name="birthday" type="xs:date"/>
</xs:attributeGroup>

<xs:element name="person">
  <xs:complexType>
    <!-- 引用属性组 -->
    <xs:attributeGroup ref="personattrgroup"/>
  </xs:complexType>
</xs:element>
```