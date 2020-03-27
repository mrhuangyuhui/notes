# [jMeter - Regular Expressions](https://www.tutorialspoint.com/jmeter/jmeter_regular_expressions.htm)

测试数据

```html
<html>

<head>
</head>

<body>

    <table style="border: 1px solid #000000;">

        <th style="border: 1px solid #000000;">ID</th>
        <th style="border: 1px solid #000000;">name</th>
        <th style="border: 1px solid #000000;">Email</th>

        <tr>
            <td id="ID" style="border: 1px solid #000000;">3</td>
            <td id="Name" style="border: 1px solid #000000;">Manisha</td>
            <td id="Email" style="border: 1px solid #000000;">manisha@domain.com</td>
        </tr>

        <tr>
            <!-- 提取第二个人的信息 -->
            <td id="ID" style="border: 1px solid #000000;">4</td>
            <td id="Name" style="border: 1px solid #000000;">Joe</td>
            <td id="Email" style="border: 1px solid #000000;">joe@domain.com</td>
        </tr>

    </table>

</body>

</html>
```

引用名称：`Person`，提取结果存储到该变量。

正则表达式：`<td id="ID".*>(.+?)</td>\s*<td id="Name".*>(.+?)</td>\s*<td id="Email".*>(.+?)</td>`，三个括号表示三个子串。

模板：`$1$,$2$,$3$`，提取结果的格式，`$1$` 表示第一个子串。

输出结果

```bash
# 变量的值
Person=4,Joe,joe@domain.com
# 子串总数
Person_g=3
# 整个匹配的字符串
Person_g0=<td id="ID" style="border: 1px solid #000000;">4</td>
            <td id="Name" style="border: 1px solid #000000;">Joe</td>
            <td id="Email" style="border: 1px solid #000000;">joe@domain.com</td>
# 匹配的子串 1
Person_g1=4
# 匹配的子串 2
Person_g2=Joe
# 匹配的子串 3
Person_g3=joe@domain.com
```