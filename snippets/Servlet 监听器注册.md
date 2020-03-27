# Servlet 监听器注册

在 Servlet 3.0 和 Servlet 3.1 中提供了两种注册监听器的方法。

第一种是使用 `WebListener` 注解。
```java
@WebListener
public class ListenerClass implements ListenerInterface {

}
```

第二种方法是在部署描述文档中增加一个 `listener` 元素。
```xml
</listener>
    <listener-class>fully-qualified listener class</listener-class>
</listener>
```
