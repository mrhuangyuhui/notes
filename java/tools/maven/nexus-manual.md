# Nexus Manual

<https://www.sonatype.com/nexus-repository-oss>

<https://help.sonatype.com/repomanager3>

## [Installation](https://help.sonatype.com/repomanager3/installation)

下载地址 <https://help.sonatype.com/repomanager3/download>

安装环境

```bash
$  java -version
java version "1.8.0_60"
Java(TM) SE Runtime Environment (build 1.8.0_60-b27)
Java HotSpot(TM) 64-Bit Server VM (build 25.60-b23, mixed mode)
```

> OpenJDK or other Java distributions or older Java versions are not supported.

[Installation Methods](https://help.sonatype.com/repomanager3/installation/installation-methods)

```bash
wget http://download.sonatype.com/nexus/3/nexus-3.14.0-04-unix.tar.gz

tar zxvf nexus-3.14.0-04-unix.tar.gz

cd nexus-3.14.0-04

bin/nexus run
```

在浏览器打开 <http://206.81.7.26:8081/>

默认管理员用户名和密码为 `admin/admin123`