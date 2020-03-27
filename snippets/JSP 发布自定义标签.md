# JSP 发布自定义标签

可以把自定义的标签处理器以及标签描述器打包到 `jar` 包里，这样就可以把它发布出来给别人使用了，就像 JSTL 一样。这种情况下，需要包含其所有的标签处理器及描述它们的 `tld` 文件。此外，还需要在描述器中的 `uri` 节点中指定绝对的 URI。

用 Maven 打包的代码片段如下：
```xml
<build>
    <resources>
      <resource>
        <directory>src/main/webapp/WEB-INF</directory>
        <includes>
          <include>*.tld</include>
        </includes>
        <targetPath>META-INF/</targetPath>
      </resource>
    </resources>
</build>
```

更详细示例参考学习笔记《Servlet、JSP 和 Spring MVC 初学指南》第 6 章