# Hessian Demos

## Demo01

完整代码

<https://gitee.com/mrhuangyuhui/hessian/tree/master/hessian-demos/demo01>

`pom.xml`

```xml
<dependency>
    <groupId>com.caucho</groupId>
    <artifactId>hessian</artifactId>
    <version>4.0.51</version>
</dependency>
```

`web.xml`

```xml
<servlet>
    <servlet-name>HessianServlet</servlet-name>
    <servlet-class>com.caucho.hessian.server.HessianServlet</servlet-class>
    <init-param>
        <param-name>service-class</param-name>
        <param-value>BasicImpl</param-value>
    </init-param>
</servlet>
<servlet-mapping>
    <servlet-name>HessianServlet</servlet-name>
    <url-pattern>/hessian</url-pattern>
</servlet-mapping>
```

```java
import com.caucho.hessian.client.HessianProxyFactory;

public class BasicClient {
    public static void main(String[] args) {
        try {
            String url = "http://localhost:8080/hessian";
            HessianProxyFactory factory = new HessianProxyFactory();
            factory.setOverloadEnabled(true);
            Basic basic = (Basic) factory.create(Basic.class, url);
            System.out.println(basic.sayHello("SW"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```