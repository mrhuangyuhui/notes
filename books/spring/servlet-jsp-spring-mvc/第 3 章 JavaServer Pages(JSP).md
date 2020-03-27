# 第 3 章 JavaServer Pages(JSP)

## 3.1 JSP 概述

[Package javax.servlet.jsp](https://docs.oracle.com/javaee/7/api/javax/servlet/jsp/package-summary.html)

[Package javax.servlet.jsp.tagext](https://docs.oracle.com/javaee/7/api/javax/servlet/jsp/tagext/package-summary.html)

[Package javax.servlet.jsp.el](https://docs.oracle.com/javaee/7/api/javax/servlet/jsp/el/package-summary.html)

[Package javax.el](https://docs.oracle.com/javaee/7/api/javax/el/package-summary.html)

`app03a/src/main/webapp/welcome.jsp`
```
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    Welcome
</body>
</html>
```

`app03a/src/main/webapp/todaysDate.jsp`
```
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.LONG);
    String s = dateFormat.format(new Date());
    out.println("Today is " + s);
%>
</body>
</html>
```

## 3.2 注释

略

## 3.3 隐式对象

对象 | 类型
---|---
request | javax.servlet.http.HttpServletRequest
response | javax.servlet.http.HttpServletResponse
out | [javax.servlet.jsp.JspWriter](https://docs.oracle.com/javaee/7/api/javax/servlet/jsp/JspWriter.html)
session | javax.servlet.http.HttpSession
application | javax.servlet.ServletContext
config | javax.servlet.ServletConfig
pageContext | [javax.servlet.jsp.PageContext](https://docs.oracle.com/javaee/7/api/javax/servlet/jsp/PageContext.html)
page | javax.servlet.jsp.HttpJspPage
exception | java.lang.Throwable

https://www.tutorialspoint.com/jsp/jsp_implicit_objects.htm

`./src/main/webapp/implicitObjects.jsp`
```
<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP Implicit Objects</title>
</head>
<body>
<b>Http headers:</b><br/>
<%
    for (Enumeration<String> e = request.getHeaderNames();
         e.hasMoreElements(); ) {
        String header = e.nextElement();
        out.println(header + ": " + request.getHeader(header) + "<br/>");
    }
%>
<hr/>
<%
    out.println("Buffer size: " + response.getBufferSize() + "<br/>");
    out.println("Session id: " + session.getId() + "<br/>");
    out.println("Servlet name: " + config.getServletName() + "<br/>");
    out.println("Server info: " + application.getServerInfo());
%>
</body>
</html>
```

[Class PageContext](https://docs.oracle.com/javaee/7/api/javax/servlet/jsp/PageContext.html)

[Class JspWriter](https://docs.oracle.com/javaee/7/api/javax/servlet/jsp/JspWriter.html)

## 3.4 指令

### 3.4.1 `page` 指令

> 可以使用`page`指令来控制JSP转换器转换当前JSP页面的某些方面。例如，可以告诉JSP用于转换隐式对象`out`的缓冲器的大小、内容类型，以及需要导入的Java类型，等等。

> 大部分`page`指令可以出现在页面的任何位置，但当`page`指令包含`contentType`或`pageEncoding`属性时，其必须出现在Java代码发送任何内容之前。这是因为内容类型和字符编码必须在发送任何内容前设定。

### 3.4.2 `include` 指令

> 可以使用`include`指令将其他文件中的内容包含到当前JSP页面。一个页面中可以有多个`include`指令。若存在一个内容会在多个不同页面中使用或一个页面不同位置使用的场景，则将该内容模块化到一个`include`文件非常有用。

`app03a/src/main/webapp/copyright.jspf`
```
<hr/>
&copy;2012 BrainySoftware
<hr/>
```

`app03a/src/main/webapp/main.jsp`
```
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Including a file</title>
</head>
<body>
This is the included content: <hr/>
<%@ include file="copyright.jspf"%>
</body>
</html>
```

## 3.5 脚本元素

> 一个脚本程序是一个Java代码块，以`<%`符号开始，以`%>`符号结束。

`app03a/src/main/webapp/scriptletTest.jsp`
```
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Enumeration" %>
<html>
<head>
    <title>Scriptlet example</title>
</head>
<body>
<b>Http headers:</b><br/>
<%
    for (Enumeration<String> e = request.getHeaderNames();
         e.hasMoreElements(); ) {
        String header = e.nextElement();
        out.println(header + ": " + request.getHeader(header) +
                "<br/>");
    }
    String message = "Thank you.";
%>
<hr/>
<%
    out.println(message);
%>
</body>
</html>
```

### 3.5.1 表达式

> 每个表达式都会被JSP容器执行，并使用隐式对象`out`的打印方法输出结果。表达式以“`<%=`”开始，并以“`%>`”结束。

```
Today is <%=java.util.Calendar.getInstance().getTime()%>
```

### 3.5.2 声明

> 可以声明能在JSP页面中使用的变量和方法。声明以“`<%!`”开始，并以“`%>`”结束。

`app03a/src/main/webapp/declarationTest.jsp`
```java
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public String getTodaysDate() {
        return new java.util.Date().toString();
    }
%>
<html>
<head>
    <title>Declarations</title>
</head>
<body>
Today is <%=getTodaysDate()%>
</body>
</html>
```

> 可以使用声明来重写JSP页面，实现类的`init`和`destroy`方法。通过声明`jspInit`方法，来重写`init`方法。通过声明`jspDestroy`方法，来重写`destory`方法。

`app03a/src/main/webapp/lifeCycle.jsp`
```
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public void jspInit() {
        System.out.println("jspInit ...");
    }

    public void jspDestroy() {
        System.out.println("jspDestroy ...");
    }
%>
<html>
<head>
    <title>jspInit and jspDestroy</title>
</head>
<body>
Overriding jspInit and jspDestroy
</body>
</html>
```

### 3.5.3 禁用脚本元素

`web.xml`
```xml
<jsp-property-group>
    <url-pattern>*.jsp</url-pattern>
    <scripting-invalid>true</scripting-invalid>
</jsp-property-group>
```

## 3.6 动作

### 3.6.1 `useBean`

> `useBean`将创建一个关联Java对象的脚本变量。

`./src/main/webapp/useBeanTest.jsp`
```
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>useBean</title>
</head>
<body>
<jsp:useBean id="today" class="java.util.Date"/>
<%=today%>
</body>
</html>
```

### 3.6.2 `setProperty` 和 `getProperty`

> `setProperty`动作可对一个Java对象设置属性，而`getProperty`则会输出Java对象的一个属性。

`app03a/src/main/java/app03a/Employee.java`
```java
package app03a;

public class Employee {

    private String id;
    private String firstName;
    private String lastName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}
```

`app03a/src/main/webapp/getSetPropertyTest.jsp`
```
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>getProperty and setProperty</title>
</head>
<body>
<jsp:useBean id="employee" class="app03a.Employee"/>
<jsp:setProperty name="employee" property="firstName" value="Abigail"/>
First Name:
<jsp:getProperty name="employee" property="firstName"/>
</body>
</html>
```

### 3.6.3 `include`

> `include`动作用来动态地引入另一个资源。可以引入另一个JSP页面，也可以引入一个Servlet或一个静态的HTML页面。

> 理解`include`指令和`include`动作非常重要。对于`include`指令，资源引入发生在页面转换时，即当JSP容器将页面转换为生成的Servlet时。而对于`include`动作，资源引入发生在请求页面时。因此，使用`include`动作是可以传递参数的，而`include`指令不支持。
> 
> 第二个不同是，`include`指令对引入的文件扩展名不做特殊要求。但对于`include`动作，若引入的文件需以JSP页面处理，则其文件扩展名必须是JSP。若使用`.jspf`为扩展名，则该页面被当作静态文件。

`app03a/src/main/webapp/jspf/menu.jsp`
```
menu.jsp
```

`./src/main/webapp/jspIncludeTest.jsp`
```
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Include action</title>
</head>
<body>
<jsp:include page="jspf/menu.jsp">
    <jsp:param name="text" value="How are you?"/>
</jsp:include>
</body>
</html>
```

### 3.6.4 `forward`

> `forward`将当前页面转向到其他资源。

```
<jsp:forward page="jspf/login.jsp">
    <jsp:param name="text" value="Please login"/>
</jsp:forward>
```

## 3.7 错误处理

> 请使用`page`指令的`isErrorPage`属性（属性值必须为True）来标识一个JSP页面是错误页面。

> 其他需要防止未捕获的异常的页面使用`page`指令的`errorPage`属性来指向错误处理页面。

`app03a/src/main/webapp/errorHandler.jsp`
```
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
An error has occurred. <br/>
Error message:
<%
    out.println(exception.toString());
%>
</body>
</html>
```

`app03a/src/main/webapp/buggy.jsp`
```
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorHandler.jsp" %>
Deliberately throw an exception
<%
    Integer.parseInt("Throw me");
%>
```