# `<parent/>`

```xml
<groupId>me.hyh</groupId>
<artifactId>dubbo-demo-parent</artifactId>
<version>1.0-SNAPSHOT</version>
<!-- 这里很关键 -->
<packaging>pom</packaging>
<name>${project.artifactId}</name>
<modules>
    <module>dubbo-demo-api</module>
    <module>dubbo-demo-provider</module>
    <module>dubbo-demo-consumer</module>
</modules>
```

```xml
<artifactId>dubbo-demo-provider</artifactId>
<version>1.0-SNAPSHOT</version>
<name>${project.artifactId}</name>
<parent>
    <groupId>me.hyh</groupId>
    <artifactId>dubbo-demo-parent</artifactId>
    <version>1.0-SNAPSHOT</version>
</parent>
```

```xml
<artifactId>dubbo-demo-consumer</artifactId>
<version>1.0-SNAPSHOT</version>
<name>${project.artifactId}</name>
<parent>
    <groupId>me.hyh</groupId>
    <artifactId>dubbo-demo-parent</artifactId>
    <version>1.0-SNAPSHOT</version>
</parent>
```

```xml
<artifactId>dubbo-demo-api</artifactId>
<version>1.0-SNAPSHOT</version>
<name>${project.artifactId}</name>
<parent>
    <groupId>me.hyh</groupId>
    <artifactId>dubbo-demo-parent</artifactId>
    <version>1.0-SNAPSHOT</version>
</parent>
```