# `<property-placeholder/>`

示例 1

`src/main/resources/jdbc.properties`

```properties
jdbc.driverClassName=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/sampledb
jdbc.username=root
jdbc.password=123456
```

`src/main/resources/applicationContext.xml`

```xml
<context:property-placeholder location="classpath:jdbc.properties"/>
<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource"
      destroy-method="close"
      p:driverClassName="${jdbc.driverClassName}"
      p:url="${jdbc.url}"
      p:username="${jdbc.username}"
      p:password="${jdbc.password}"/>
```

示例 2

健康通

`jkt/base/src/main/resources/commonBASE.properties`

```properties
# soa url
soa_url=${soa.url}
member_soa_url=${member.soa.url}
marketing_soa_url=${marketing.soa.url}
health_soa_url=${health.soa.url}
# Transmission and static and dynamic
transmission_static=${transmission.static}
DIRECTLY_LOGO=DIRECTLY_
```

`jkt/member/src/main/resources/applicationContext.xml`

```xml
<context:property-placeholder location="classpath:/commonBASE.properties" ignore-resource-not-found="true"
                                  ignore-unresolvable="true"/>
```