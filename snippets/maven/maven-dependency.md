# Maven Depencency

直接引用其他模块

`dubbo-demo/dubbo-demo-consumer/pom.xml`

```xml
<groupId>me.hyh</groupId>
<artifactId>dubbo-demo-consumer</artifactId>
<version>1.0-SNAPSHOT</version>

<dependencies>
    <dependency>
        <groupId>me.hyh</groupId>
        <artifactId>dubbo-demo-api</artifactId>
        <version>1.0-SNAPSHOT</version>
        <scope>compile</scope>
    </dependency>
</dependencies>
```