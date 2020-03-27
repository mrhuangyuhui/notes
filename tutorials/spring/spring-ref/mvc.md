# [22. Web MVC framework](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/mvc.html)

---

[TOC]

## [22.13. Convention over configuration support](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/mvc.html#mvc-coc)

### [22.13.1 The Controller ControllerClassNameHandlerMapping](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/mvc.html#mvc-coc-ccnhm)

Controller 类和请求地址之间的映射

`<servlet-name>-servlet.xml`

```xml
<bean class="org.springframework.web.servlet.mvc.support."/>
```

示例

- `WelcomeController` maps to the `/welcome*` request URL
- `HomeController` maps to the `/home*` request URL
- `IndexController` maps to the `/index*` request URL
- `RegisterController` maps to the `/register*` request URL

### 22.13.2 The Model ModelMap (ModelAndView)

https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/mvc.html#mvc-coc-modelmap

```java
public class DisplayShoppingCartController implements Controller {

    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {

        List cartItems = // get a List of CartItem objects
        User user = // get the User doing the shopping

        ModelAndView mav = new ModelAndView("displayShoppingCart"); <-- the logical view name

        mav.addObject(cartItems); <-- look ma, no name, just the object
        mav.addObject(user); <-- and again ma!

        return mav;
    }
}
```

[Class ModelMap](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/ui/ModelMap.html)

### 22.13.3 Default view name

https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/mvc.html#mvc-coc-r2vnt

```java
public class RegistrationController implements Controller {

    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
        // process the request...
        ModelAndView mav = new ModelAndView();
        // add data as necessary to the model...
        return mav;
        // notice that no View or logical view name has been set
    }

}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="
        http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd">

    <!-- this bean with the well known name generates view names for us -->
    <bean id="viewNameTranslator"
            class="org.springframework.web.servlet.view.DefaultRequestToViewNameTranslator"/>

    <bean class="x.y.RegistrationController">
        <!-- inject dependencies as necessary -->
    </bean>

    <!-- maps request URLs to Controller names -->
    <bean class="org.springframework.web.servlet.mvc.support.ControllerClassNameHandlerMapping"/>

    <bean id="viewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/jsp/"/>
        <property name="suffix" value=".jsp"/>
    </bean>

</beans>
```

[Interface RequestToViewNameTranslator](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/web/servlet/RequestToViewNameTranslator.html)

[Class DefaultRequestToViewNameTranslator](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/web/servlet/view/DefaultRequestToViewNameTranslator.html)
