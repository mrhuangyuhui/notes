# JSP 禁用或启用表达式语言

方法一：在 JSP 页面中设置
```
<%@ page isELIgnored="true" %>
```

方法二：在部署描述符中设置

`web.xml`
```xml
<jsp-config>
    <jsp-property-group>
        <url-pattern>/noEl.jsp</url-pattern>
        <!--禁用所有 JSP 页面的 EL-->
        <!--<url-pattern>*.jsp</url-pattern>-->
        <el-ignored>true</el-ignored>
    </jsp-property-group>
</jsp-config>
```