# Tomcat - 在 CentOS 7 上绑定 IPv4 地址

Tomcat 在 CentOS 7 上默认只绑定 IPv6 地址，要绑定 IPv4 地址，有如下两种方法：

```bash
$ netstat -tulnp | grep 8080
tcp6       0      0 :::8080                 :::*                    LISTEN      2891/java
```

- 方法一：在 `$CATALINA_HOME/bin/catalina.sh` 上修改 Java 运行时选项

```bash
$ vim /usr/local/tomcat/current/bin/catalina.sh
# 在顶部添加以下代码
JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses=true"

# 重启 Tomcat
$ ./shutdown.sh
$ ./startup.sh
```

- 方法二：修改 Linux 系统配置

参考文章：

<https://jingyan.baidu.com/article/5552ef478e1ea6518ffbc928.html>
