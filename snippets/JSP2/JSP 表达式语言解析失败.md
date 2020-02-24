# JSP 表达式语言解析失败

添加 `<%@ page isELIgnored="false" %>`
```
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
accept-language: ${header['accept-language']}
<br/>
session id: ${pageContext.session.id}
<br/>
employee: ${requestScope.employee.name}, ${employee.address.city}
<br/>
capital: ${capitals["Canada"]}
</body>
</html>
```
