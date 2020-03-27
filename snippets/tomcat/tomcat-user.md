# Tomcat - User

配置文件 `conf/tomcat-users.xml`

```xml
<role rolename="manager"/>
<role rolename="member"/>
<user username="tom" password="secret"  roles="manager,member"/>
<user username="jerry" password="secret" roles="member"/>
```

[Configuring Manager Application Access](http://tomcat.apache.org/tomcat-8.5-doc/manager-howto.html#Configuring_Manager_Application_Access)

```xml
<!-- 监控权限的角色 -->
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<user username="admin" password="admin" roles="
manager-gui,manager-script,manager-jmx,manager-status"/>
```