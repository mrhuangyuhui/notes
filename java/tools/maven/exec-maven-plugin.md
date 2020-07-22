# [Exec Maven Plugin](https://www.mojohaus.org/exec-maven-plugin/)

@(Maven)[maven,manual]

简化执行系统程序和 Java 程序的一个 Maven 插件

> 特别注意：
> - 在 `</plugin>` 下面写配置（相当于插件的全局配置），运行插件时可以不指定 `</id>`，如 `mvn exec:exec` 或 `mvn exec:exec@my_id` 都可以。
> - 在 `</execution>` 下面写配置（相当于插件的局部配置），运行插件时必须指定 `</id>`，如 `mvn exec:exec@my_id`。

---

[TOC]

## [Usage](https://www.mojohaus.org/exec-maven-plugin/usage.html)

### [Exec goal](https://www.mojohaus.org/exec-maven-plugin/exec-mojo.html)

```xml
<project>
  ...
  <build>
    <plugins>
      <plugin>
        <groupId>org.codehaus.mojo</groupId>
        <artifactId>exec-maven-plugin</artifactId>
        <version>1.6.0</version>
        <executions>
          <execution>
            ...
            <goals>
              <goal>exec</goal>
            </goals>
          </execution>
        </executions>
        <configuration>
          <executable>maven</executable>
          <!-- optional -->
          <workingDirectory>/tmp</workingDirectory>
          <arguments>
            <argument>-X</argument>
            <argument>myproject:dist</argument>
            ...
          </arguments>
        </configuration>
      </plugin>
    </plugins>
  </build>
   ...
</project>
```

执行命令 `mvn exec:exec` 后，相当于在指定工作目录 `/tmp` 执行命令 `maven -X myproject:dist`。

### [Java goal](https://www.mojohaus.org/exec-maven-plugin/java-mojo.html)

```xml
<project>
  ...
  <build>
    <plugins>
      <plugin>
        <groupId>org.codehaus.mojo</groupId>
        <artifactId>exec-maven-plugin</artifactId>
        <version>1.6.0</version>
        <executions>
          <execution>
            ...
            <goals>
              <goal>java</goal>
            </goals>
          </execution>
        </executions>
        <configuration>
          <mainClass>com.example.Main</mainClass>
          <arguments>
            <argument>argument1</argument>
            ...
          </arguments>
          <systemProperties>
            <systemProperty>
              <key>myproperty</key>
              <value>myvalue</value>
            </systemProperty>
            ...
          </systemProperties>
        </configuration>
      </plugin>
    </plugins>
  </build>
   ...
</project>
```

执行命令 `mvn exec:java` 后，相当于在当前工作目录执行命令 `java -Dmyproperty=myvalue com.example.Main argument1`。

## [Goals](https://www.mojohaus.org/exec-maven-plugin/plugin-info.html)

### [`exec:exec`](https://www.mojohaus.org/exec-maven-plugin/exec-mojo.html)

执行系统程序

配置参数 | 说明
--- | ---
[`arguments`](https://www.mojohaus.org/exec-maven-plugin/exec-mojo.html#arguments) | 对应命令行中的参数列表
[`executable`](https://www.mojohaus.org/exec-maven-plugin/exec-mojo.html#executable) | 对应命令行中的可执行程序

### [`exec:java`](https://www.mojohaus.org/exec-maven-plugin/java-mojo.html)

执行 Java 程序

配置参数 | 说明
--- | ---
[`mainClass`](https://www.mojohaus.org/exec-maven-plugin/java-mojo.html#mainClass) | 对应 Java 程序的主类
[`arguments`](https://www.mojohaus.org/exec-maven-plugin/java-mojo.html#arguments) | 对应 Java 程序主类的参数

## Examples

### [Running Java programs with the exec goal](https://www.mojohaus.org/exec-maven-plugin/examples/example-exec-for-java-programs.html)

```xml
<configuration>
  <executable>java</executable>
  <arguments>
    <argument>-classpath</argument>
    <!-- automatically creates the classpath using all project dependencies,
         also adding the project build directory -->
    <classpath/>
    <argument>com.example.Main</argument>
    ...
  </arguments>
</configuration>
```

`<classpath/>` 表示项目的所有依赖

执行命令 `mvn exec:exec` 后，相当于在当前工作目录执行命令 `java -classpath ... com.example.Main`。

以下配置指定了特定的依赖

```xml
<configuration>
  <executable>java</executable>
  <arguments>
    <argument>-classpath</argument>
    <classpath>
      <dependency>commons-io:commons-io</dependency>
      <dependency>commons-lang:commons-lang</dependency>
    </classpath>
    <argument>com.example.Main</argument>
    ...
  </arguments>
</configuration>
```