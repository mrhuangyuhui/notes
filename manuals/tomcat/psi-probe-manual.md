# PSI Probe Manual

<https://github.com/psi-probe/psi-probe>

一、下载 <https://github.com/psi-probe/psi-probe/releases/download/3.1.0/probe.war>

二、移动 `probe.war` 到 tomcat 主目录下的 `webapps` 子目录

三、添加账号密码

```xml
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<user username="admin" password="admin" roles="
manager-gui,manager-script,manager-jmx,manager-status"/>
```

四、启动

启动 tomcat 并在浏览器打开 <http://localhost:8080/probe/>
