# [jMeter - Monitor Test Plan](https://www.tutorialspoint.com/jmeter/jmeter_monitor_test_plan.htm)

配置 Tomcat 的管理账号

`tomcat-users.xml`

```xml
<tomcat-users>
   <role rolename="manager-gui"/>
   <role rolename="manager-script"/>
   <role rolename="manager-jmx"/>
   <role rolename="manager-status"/>
   <user username="admin" password="admin" roles="manager-gui,manager-script,manager-jmx,manager-status"/>
</tomcat-users>
```

启动 Tomcat 并查看运行状态

<http://localhost:8080/manager/status?XML=true>