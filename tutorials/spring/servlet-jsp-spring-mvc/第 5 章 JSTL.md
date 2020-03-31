# 第 5 章 JSTL

https://docs.oracle.com/javaee/5/tutorial/doc/bnakc.html

https://docs.oracle.com/javaee/5/tutorial/doc/bnakh.html

## `if` 标签

第一种形式：没有 body content，在这种情况下，`var` 定义的有界对象一般是通过其他标签在同一个 JSP 的后续阶段再进行测试。
```
<c:if test="testCondition"
      var="varName" 
      [scope="{page|request|session|application}"]/>
```

第二种形式：有 body content，body content 是 JSP，当测试条件的结果为 `true` 时，就会得到处理。
```
<c:if test="testCondition
      [var="varName"]
      [scope="{page|request|session|application}"]>
body content
</c:if>
```

## `forEach` 标签

第一种形式：固定次数地重复 body content。
```
<c:forEach [var="varName"] 
           begin="begin" 
           end="end" 
           step="step">
body content
</c:forEach>
```

第二种形式：遍历对象集合，body content 是 JSP。
```
<c:forEach items="collection" 
           [var="varName"]
           [varStatus="varStatusName"] 
           [begin="begin"] 
           [end="end"]
           [step="step"]>
body content
</c:forEach>
```

## 范例一：

`app05a\pom.xml`
```xml
<dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>
    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>javax.servlet-api</artifactId>
      <version>3.0.1</version>
      <scope>provided</scope>
    </dependency>
    <dependency>
      <groupId>javax.servlet.jsp</groupId>
      <artifactId>javax.servlet.jsp-api</artifactId>
      <version>2.3.1</version>
      <scope>provided</scope>
    </dependency>
    <dependency>
      <groupId>jstl</groupId>
      <artifactId>jstl</artifactId>
      <version>1.2</version>
    </dependency>
    <dependency>
      <groupId>taglibs</groupId>
      <artifactId>standard</artifactId>
      <version>1.1.2</version>
    </dependency>
</dependencies>
```

`app05a/src/main/java/app05a/model/Book.java`
```java
package app05a.model;

public class Book {

    private String isbn;
    private String title;
    private double price;

    public Book(String isbn, String title, double price) {
        this.isbn = isbn;
        this.title = title;
        this.price = price;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
```

`app05a/src/main/java/app05a/servlet/BooksServlet.java`
```java
package app05a.servlet;

import app05a.model.Book;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/books"})
public class BooksServlet extends HttpServlet {

    private static final int serialVersionUID = -234237;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Book> books = new ArrayList<Book>();
        Book book1 = new Book("978-0980839616",
                "Java 7: A Beginner's Tutorial", 45.00);
        Book book2 = new Book("978-0980331608",
                "Struts 2 Design and Programming: A Tutorial",
                49.95);
        Book book3 = new Book("978-0975212820",
                "Dimensional Data Warehousing with MySQL: A "
                        + "Tutorial", 39.95);
        books.add(book1);
        books.add(book2);
        books.add(book3);

        req.setAttribute("books", books);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/books.jsp");
        requestDispatcher.forward(req, resp);
    }
}
```

`app05a/src/main/webapp/books.jsp`
```
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Book List</title>
    <style>
        table, tr, td {
            border: 1px solid brown;
        }
    </style>
</head>
<body>
    Books in Simple Table
    <table>
        <tr>
            <td>ISBN</td>
            <td>Title</td>
        </tr>
        <c:forEach items="${requestScope.books}" var="book">
            <tr>
                <td>${book.isbn}</td>
                <td>${book.title}</td>
            </tr>
        </c:forEach>
    </table>
    <br/>

    Books in Styled Table
    <table>
        <tr style="background:#ababff">
            <td>ISBN</td>
            <td>Title</td>
        </tr>
        <c:forEach items="${requestScope.books}" var="book" varStatus="status">
            <c:if test="${status.count % 2 == 0}">
                <tr style="background:#eeeeff">
            </c:if>
            <c:if test="${status.count % 2 != 0}">
                <tr style="background:#dedeff">
            </c:if>
             <td>${book.isbn}</td>
             <td>${book.title}</td>
        </tr>
        </c:forEach>
    </table>
    <br/>

    ISBNs only:
    <c:forEach items="${requestScope.books}" var="book" varStatus="status">
        ${book.isbn}<c:if test="${!status.last}">,</c:if>
    </c:forEach>
</body>
</html>
```

## 范例二：

`app05a/src/main/java/app05a/servlet/BigCitiesServlet.java`
```
package app05a.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = {"/bigCities"})
public class BigCitiesServlet extends HttpServlet {

    private static final int serialVersionUID = 112233;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Map<String, String> capitals = new HashMap<String, String>();
        capitals.put("Indonesia", "Jakarta");
        capitals.put("Malaysia", "Kuala Lumpur");
        capitals.put("Thailand", "Bangkok");
        req.setAttribute("capitals", capitals);

        Map<String, String[]> bigCities = new HashMap<String, String[]>();
        bigCities.put("Australia", new String[] {"Sydney",
                "Melbourne", "Perth"});
        bigCities.put("New Zealand", new String[] {"Auckland",
                "Christchurch", "Wellington"});
        bigCities.put("Indonesia", new String[] {"Jakarta",
                "Surabaya", "Medan"});
        req.setAttribute("bigCities", bigCities);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/bigCities.jsp");
        requestDispatcher.forward(req, resp);
    }
}
```

`app05a/src/main/webapp/bigCities.jsp`
```
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Big Cities</title>
    <style>
        table, tr, td {
            border: 1px solid #aaee77;
            padding: 3px;
        }
    </style>
</head>
<body>
    Capitals
    <table>
        <tr style="background:#448755;color:white;font-weight:bold">
            <td>Country</td>
            <td>Capital</td>
        </tr>
        <c:forEach items="${requestScope.capitals}" var="mapItem">
            <tr>
                <td>${mapItem.key}</td>
                <td>${mapItem.value}</td>
            </tr>
        </c:forEach>
    </table>
    <br/>

    Big Cities
    <table>
        <tr style="background:#448755;color:white;font-weight:bold">
            <td>Country</td>
            <td>Cities</td>
        </tr>
        <c:forEach items="${requestScope.bigCities}" var="mapItem">
            <tr>
                <td>${mapItem.key}</td>
                <td>
                    <c:forEach items="${mapItem.value}" var="city" varStatus="status">
                        ${city}<c:if test="${!status.last}">,</c:if>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
```