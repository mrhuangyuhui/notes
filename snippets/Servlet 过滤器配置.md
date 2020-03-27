# Servlet 过滤器配置

有两种方法可以配置 Filter：一种是通过 `WebFilter` 的 Annotation 来配置 Filter，另一种是通过部署描述来注册。

[Annotation Type WebFilter](https://docs.oracle.com/javaee/7/api/javax/servlet/annotation/WebFilter.html)

**示例 1：**
```java
@WebFilter(filterName = "DataCompressionFilter", urlPatterns = { "/*" })
```

```xml
<filter>
     <filter-name>DataCompressionFilter</filter-name>
     <filter-class>
          the fully-qualified name of the filter class
     </filter-class>
</filter>
<filter-mapping>
     <filter-name>DataCompresionFilter</filter-name>
     <url-pattern>/*</url-pattern>
</filter-mapping>
```

**示例 2：**
```java
@WebFilter(filterName = "Security Filter", urlPatterns = { "/ *" },
          initParams = {
               @WebInitParam(name = "frequency", value = "1909"),
               @WebInitParam(name = "resolution", value = "1024")
          }
)
```

```xml
<filter>
     <filter-name>Security Filter</filter-name>
     <filter-class>filterClass</filter-class>
     <init-param>
          <param-name>frequency</param-name>
          <param-value>1909</param-value>
     </init-param>
     <init-param>
          <param-name>resolution</param-name>
          <param-value>1024</param-value>
     </init-param>
</filter>
<filter-mapping>
     <filter-name>DataCompresionFilter</filter-name>
     <url-pattern>/ *</url-pattern>
</filter-mapping>
```