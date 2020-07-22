# Java Number Format

- [Class String](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html)
  - format
- [Class DecimalFormat](https://docs.oracle.com/javase/8/docs/api/java/text/DecimalFormat.html)
- [Class NumberFormat](https://docs.oracle.com/javase/8/docs/api/java/text/NumberFormat.html)

<https://gitee.com/mrhuangyuhui/notes/blob/master/books/java/java-cookbook-3e/ch05.md#58-%E6%A0%BC%E5%BC%8F%E5%8C%96%E6%95%B0%E5%AD%97>

```java
int num = 1;
// C 语言风格的格式化
// 0 代表前面补 0
// 4 代表长度为 4
// d 代表参数为整型
String str = String.format("%04d", num);
System.out.println(str); // 0001
```