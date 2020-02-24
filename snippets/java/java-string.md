# Java String

字符串去重

```java
String str = "100,100,200,200,300,300";
HashSet<String> set = new HashSet<String>(Arrays.asList(str.split(",")));
System.out.println(StringUtils.join(set, ","));
```