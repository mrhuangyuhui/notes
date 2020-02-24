# Maven WebApp

创建 WebApp 项目

> 注意：包名不能用中划线 `-`，否则会出现编译错误，可以用下划线 `_`。

```bash
mvn archetype:generate -B \
-DarchetypeGroupId=org.apache.maven.archetypes \
-DarchetypeArtifactId=maven-archetype-webapp \
-DgroupId=com.mycompany.app \
-DartifactId=mywebapp \
-Dversion=1.0-SNAPSHOT \
-Dpackage=com.mycompany.app.mywebapp
```

Servlet 和 JSP 的 API

```xml
<dependencies>
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
</dependencies>
```