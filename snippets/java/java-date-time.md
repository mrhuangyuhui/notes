# Java Date & Time

- [Class Calendar](https://docs.oracle.com/javase/8/docs/api/java/util/Calendar.html)
- [Class Date](https://docs.oracle.com/javase/8/docs/api/java/util/Date.html)
- [Class DateTimeFormatter](https://docs.oracle.com/javase/8/docs/api/java/time/format/DateTimeFormatter.html)
- [Class SimpleDateFormat](https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html)

疯狂 Java 讲义（第三版）[7.4 Java 8 的日期、时间类](https://gitee.com/mrhuangyuhui/notes/blob/master/books/java/crazy-java-3/ch07.md#74-java-8-%E7%9A%84%E6%97%A5%E6%9C%9F%E6%97%B6%E9%97%B4%E7%B1%BB)

Java 经典实例（第三版）[第 6 章 日期和时间——新的 API](https://gitee.com/mrhuangyuhui/notes/blob/master/books/java/java-cookbook-3e/ch06.md)

```java
String dateString1 = "2018-05-24";
String dateString2 = "2018-05-21";

SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

// 解析日期字符串
Date date1 = simpleDateFormat.parse(dateString1);
Date date2 = simpleDateFormat.parse(dateString2);
// 比较先后顺序
System.out.println(date1.before(date2));
System.out.println(date1.after(date2));
```