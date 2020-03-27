# 第 14 章 动态加载及 Servlet 容器加载器

## 14.1 动态加载

[<T extends Servlet> T createServlet(Class<T> clazz)](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletContext.html#createServlet-java.lang.Class-)

[ServletRegistration.Dynamic addServlet(String servletName, Servlet servlet)](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletContext.html#addServlet-java.lang.String-javax.servlet.Servlet-)

[Interface ServletRegistration.Dynamic](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletRegistration.Dynamic.html)

[Set<String> addMapping(String... urlPatterns)](https://docs.oracle.com/javaee/7/api/javax/servlet/ServletRegistration.html#addMapping-java.lang.String...-)

`app14a/pom.xml`
```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.example.app</groupId>
  <artifactId>app14a</artifactId>
  <packaging>war</packaging>
  <version>1.0-SNAPSHOT</version>
  <name>app14a Maven Webapp</name>
  <url>http://maven.apache.org</url>
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
      <version>3.1.0</version>
      <scope>provided</scope>
    </dependency>
    <dependency>
      <groupId>javax.servlet.jsp</groupId>
      <artifactId>javax.servlet.jsp-api</artifactId>
      <version>2.3.1</version>
      <scope>provided</scope>
    </dependency>
  </dependencies>
  <build>
    <finalName>app14a</finalName>
  </build>
</project>
```

`app14a/src/main/java/servlet/FirstServlet.java`
```java
package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class FirstServlet extends HttpServlet {

    private static final long serialVersionUID = -6045338L;
    private String name;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        writer.println("<html><head><title>First servlet" +
                "</title></head><body>" + name);
        writer.println("</body></head>");
    }

    public void setName(String name) {
        this.name = name;
    }
}
```

`app14a/src/main/java/listener/DynRegListener.java`
```java
package listener;

import servlet.FirstServlet;

import javax.servlet.*;
import javax.servlet.annotation.WebListener;

@WebListener
public class DynRegListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent servletContextEvent) {

        ServletContext servletContext = servletContextEvent.getServletContext();

        Servlet firstServlet = null;
        try {
            firstServlet = servletContext.createServlet(FirstServlet.class);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (firstServlet != null && firstServlet instanceof FirstServlet) {
            ((FirstServlet) firstServlet).setName("Dynamically registered servlet");
        }

        ServletRegistration.Dynamic dynamic = servletContext.addServlet("firstServlet", firstServlet);
        dynamic.addMapping("/dynamic");
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
```

## 14.2 Servlet 容器加载器

跳过