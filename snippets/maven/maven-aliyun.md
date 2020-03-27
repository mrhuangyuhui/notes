# Maven 阿里云仓库

`apache-maven-3.5.2/conf/settings.xml`

```xml
<mirrors>
  <mirror>
    <id>alimaven</id>
  <mirrorOf>central</mirrorOf>
    <name>aliyun maven</name>
    <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
  </mirror>
</mirrors>
```