# Tomcat Manual

<https://tomcat.apache.org/>

<https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/>

## Installation

[Apache Tomcat Versions](http://tomcat.apache.org/whichversion.html)

[Apache Taglibs Downloads](http://tomcat.apache.org/download-taglibs.cgi)

Tomcat 7

<https://tomcat.apache.org/download-70.cgi>

<https://archive.apache.org/dist/tomcat/tomcat-7/>

Tomcat 8

<http://tomcat.apache.org/download-80.cgi>

<https://archive.apache.org/dist/tomcat/tomcat-8/>

**[RUNNING.txt](http://tomcat.apache.org/tomcat-8.5-doc/RUNNING.txt) （安装和配置的详细说明）**

### Linux

#### Installing JDK
Refers to `Java Practice`

#### Installing Tomcat
```
# Creating the installation directory
$ export INSTALL_ROOT=/usr/local/tomcat; mkdir $INSTALL_ROOT; cd $INSTALL_ROOT

# Downloading archive file and unpack it
$ wget http://apache.website-solution.net/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz; tar zxvf apache-tomcat-8.5.20.tar.gz

# Creating Symlink
$ ln -s apache-tomcat-8.5.20 default

# Verifying
$ $INSTALL_ROOT/default/bin/catalina.sh start
```

Start Up Tomcat
```bash
$CATALINA_HOME/bin/startup.sh
or
$CATALINA_HOME/bin/catalina.sh start
```

Shut Down Tomcat
```bash
$CATALINA_HOME/bin/shutdown.sh
or
$CATALINA_HOME/bin/catalina.sh stop
```

### Mac OS X

### Windows

设置环境变量 `CATALINA_HOME`

```bash
CATALINA_HOME=D:\tomcat\apache-tomcat-7.0.88
```

> 提示：快捷键 `Win + Pause` -> 高级系统设置 -> 环境变量 -> 新建

设置环境变量 `JAVA_HOME`

```bash
JAVA_HOME=C:\Program Files\Java\jdk1.8.0_161
```

启动服务

```dos
D:
cd D:\tomcat\apache-tomcat-7.0.88\bin
startup.bat
```

停止服务

```dos
D:
cd D:\tomcat\apache-tomcat-7.0.88\bin
shutdown.bat
```

打开 <http://localhost:8080/>

## Docker
https://hub.docker.com/_/tomcat/

## Configurations

[Configuration Reference](http://tomcat.apache.org/tomcat-8.5-doc/config/index.html)

## Documentation
Documentation Index
http://tomcat.apache.org/tomcat-8.5-doc/index.html

Introduction
http://tomcat.apache.org/tomcat-8.5-doc/introduction.html

通过容器的8080端口访问
docker run -it --rm tomcat:8.0

通过宿主机的8888端口访问
docker run -it --rm -p 8888:8080 tomcat:8.0
docker run -it --rm -p 8888:8080 -v /data/tomcat/webapps:/usr/local/tomcat/webapps tomcat:7.0

## Tutorials

[Apache Tomcat User Guide](http://tomcat.apache.org/tomcat-8.5-doc/index.html)

## Tools

监控

<https://github.com/psi-probe/psi-probe>
