# [41. XML Schema-based configuration](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/xsd-configuration.html)

## [41.2. XML Schema-based configuration](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/xsd-configuration.html#xsd-config-body)

### [41.2.1. Referencing the schemas](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/xsd-configuration.html#xsd-config-body-referencing)

Spring 配置文件的结构

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="
        http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

    <!-- bean definitions here -->

</beans>
```

### [41.2.2 the util schema](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/xsd-configuration.html#xsd-config-body-schemas-util)

<http://www.springframework.org/schema/util/spring-util.xsd>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:util="http://www.springframework.org/schema/util"
    xsi:schemaLocation="
        http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/util http://www.springframework.org/schema/util/spring-util.xsd">

    <!-- bean definitions here -->

</beans>
```

### [41.2.7. the aop schema](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/xsd-configuration.html#xsd-config-body-schemas-aop)

<http://www.springframework.org/schema/aop/spring-aop.xsd>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:aop="http://www.springframework.org/schema/aop" xsi:schemaLocation="
        http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd">

    <!-- bean definitions here -->

</beans>
```

### [41.2.8 the context schema](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/xsd-configuration.html#xsd-config-body-schemas-context)

<http://www.springframework.org/schema/context/spring-context.xsd>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:context="http://www.springframework.org/schema/context"
    xsi:schemaLocation="
        http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd">

    <!-- bean definitions here -->

</beans>
```

### [41.2.12 the beans schema](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/xsd-configuration.html#xsd-config-body-schemas-beans)

<http://www.springframework.org/schema/beans/spring-beans.xsd>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="
        http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="foo" class="x.y.Foo">
        <meta key="cacheName" value="foo"/>
        <property name="name" value="Rick"/>
    </bean>

</beans>
```