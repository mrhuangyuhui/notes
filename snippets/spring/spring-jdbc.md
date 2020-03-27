# Spring JDBC

Spring Framework Reference Documentation [19. Data access with JDBC](https://gitee.com/mrhuangyuhui/notes/blob/master/tutorials/spring/spring-ref/jdbc.md)

从本地加载数据库信息

`src/main/resources/jdbc.properties`

```properties
jdbc.driverClassName=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/sampledb
jdbc.username=root
jdbc.password=123456
```

`src/main/resources/applicationContext.xml`

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:p="http://www.springframework.org/schema/p" xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.0.xsd
    http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.0.xsd">

    <context:property-placeholder location="classpath:jdbc.properties"/>
    <!--配置数据源-->
    <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource"
          destroy-method="close"
          p:driverClassName="${jdbc.driverClassName}"
          p:url="${jdbc.url}"
          p:username="${jdbc.username}"
          p:password="${jdbc.password}"/>

    <!--配置 JdbcTemplate 实例-->
    <bean id="jdbcTemplate"
          class="org.springframework.jdbc.core.JdbcTemplate"
          p:dataSource-ref="dataSource"/>

    <!--配置 NamedParameterJdbcTemplate 实例-->
    <bean id="namedParamJdbcTemplate"
          class="org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate">
        <constructor-arg ref="dataSource"/>
    </bean>

</beans>
```

用 JNDI 加载数据库信息

`tomcat/conf/context.xml`

```xml
<!-- Tomcat 上的数据源信息 -->
<Resource name="jdbc/storeApp"
auth="Container"
type="javax.sql.DataSource"
driverClassName="com.mysql.jdbc.Driver"
url="jdbc:mysql://192.168.103.107:3306/storeApp?characterEncoding=UTF-8&amp;autoReconnect=true&amp;failOverReadOnly=false
&amp;zeroDateTimeBehavior=convertToNull&amp;rewriteBatchedStatements=true"
username="root"
password="tcbj"
maxActive="100"
maxIdle="30"
maxWait="10000"/>
```

```xml
<!-- 配置数据源 Bean -->
<bean id="dataSource" class="org.springframework.jndi.JndiObjectFactoryBean">
    <property name="jndiName">
        <value>java:comp/env/jdbc/storeApp</value>
    </property>
</bean>

<!-- 绑定数据源 Bean -->
<bean id="jdbcTemplate" class="org.springframework.jdbc.core.JdbcTemplate">
    <constructor-arg ref="dataSource"/>
</bean>
```

在代码中注入 `JdbcTemplate` Bean

```java
@Repository("redPacketActDAO")
public class RedPacketActDAO extends BaseDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;
}
```