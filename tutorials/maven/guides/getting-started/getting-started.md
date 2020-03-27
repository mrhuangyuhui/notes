# [Maven Getting Started Guide](https://maven.apache.org/guides/getting-started/index.html)

---

[TOC]

## [How do I setup Maven?](https://maven.apache.org/guides/getting-started/index.html#How_do_I_setup_Maven)

[Guide to Configuring Maven](https://maven.apache.org/guides/mini/guide-configuring-maven.html)

## [How do I make my first Maven project?](https://maven.apache.org/guides/getting-started/index.html#How_do_I_make_my_first_Maven_project)

```bash
mvn -B archetype:generate \
  -DarchetypeGroupId=org.apache.maven.archetypes \
  -DgroupId=com.mycompany.app \
  -DartifactId=my-app
```

[Introduction to Archetypes](https://maven.apache.org/guides/introduction/introduction-to-archetypes.html) \
[Introduction to the POM](https://maven.apache.org/guides/introduction/introduction-to-the-pom.html) \
[POM Reference](https://maven.apache.org/ref/current/maven-model/maven.html) \
[Introduction to the Standard Directory Layout](https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html)

## [How do I compile my application sources?](https://maven.apache.org/guides/getting-started/index.html#How_do_I_compile_my_application_sources)

```bash
mvn compile
```

## [How do I compile my test sources and run my unit tests?](https://maven.apache.org/guides/getting-started/index.html#How_do_I_compile_my_test_sources_and_run_my_unit_tests)

```bash
mvn test
```

If you simply want to compile your test sources (but not execute the tests), you can execute the following:
```bash
mvn test-compile
```

## [How do I create a JAR and install it in my local repository?](https://maven.apache.org/guides/getting-started/index.html#How_do_I_create_a_JAR_and_install_it_in_my_local_repository)

```bash
mvn package
```

```bash
mvn install
```

[Introduction to Repositories](https://maven.apache.org/guides/introduction/introduction-to-repositories.html)

## [How do I use plugins?](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_plugins)

For this example, we will configure the Java compiler to allow JDK 5.0 sources. This is as simple as adding this to your POM:
```xml
...
<build>
  <plugins>
    <plugin>
      <groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-compiler-plugin</artifactId>
      <version>3.3</version>
      <configuration>
        <source>1.5</source>
        <target>1.5</target>
      </configuration>
    </plugin>
  </plugins>
</build>
...
```

[Introduction to the Build Lifecycle](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html) \
[Plugins List](https://maven.apache.org/plugins/) \
[Guide to Configuring Plugins](https://maven.apache.org/guides/mini/guide-configuring-plugins.html)

## [How do I add resources to my JAR?](https://maven.apache.org/guides/getting-started/index.html#How_do_I_add_resources_to_my_JAR)

```bash
my-app
|-- pom.xml
`-- src
    |-- main
    |   |-- java
    |   |   `-- com
    |   |       `-- mycompany
    |   |           `-- app
    |   |               `-- App.java
    |   `-- resources # 新建该文件夹到项目工程的相应位置，并把所有资源文件都放到那里。
    |       `-- META-INF
    |           |-- application.properties
    `-- test
        |-- java
        |   `-- com
        |       `-- mycompany
        |           `-- app
        |               `-- AppTest.java
        `-- resources
            `-- test.properties
```

## [How do I filter resource files?](https://maven.apache.org/guides/getting-started/index.html#How_do_I_filter_resource_files)

在资源文件内引用 Maven 内部属性、外部文件属性、系统属性、命令行属性的值

设置资源目录的 `</filtering>` 为 `true`，默认是 `false`。

```xml
<build>
  <resources>
    <resource>
      <directory>src/main/resources</directory>
      <filtering>true</filtering>
    </resource>
  </resources>
</build>
```

- **引用 Maven 内部的属性值**

```bash
# application.properties
application.name=${project.name}
application.version=${project.version}
```

执行命令 `mvn process-resources` 检查效果

查看文件 `target/classes/application.properties` 可知属性已替换为具体的值

```bash
# application.properties
application.name=Maven Quick Start Archetype
application.version=1.0-SNAPSHOT
```

- **引用外部文件定义的属性值**

外部文件 `src/main/filters/filter.properties`

```bash
# filter.properties
my.filter.value=hello!
```

在 `</filters>` 中加入外部文件

```xml
<build>
  <filters>
    <filter>src/main/filters/filter.properties</filter>
  </filters>
  <resources>
    <resource>
      <directory>src/main/resources</directory>
      <filtering>true</filtering>
    </resource>
  </resources>
</build>
```

```bash
# application.properties
application.name=${project.name}
application.version=${project.version}
message=${my.filter.value} # 引用外部文件的属性值
```

执行命令 `mvn process-resources`

- **引用系统属性和命令行属性的值**

```bash
# application.properties
java.version=${java.version} # 引用系统属性的值
command.line.prop=${command.line.prop} # 引用命令行属性的值
```

执行命令 `mvn process-resources "-Dcommand.line.prop=hello again"`

## [How do I use external dependencies?](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies)

[Introduction to Dependency Mechanism](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html) \
[Project Descriptor Reference](https://maven.apache.org/ref/current/maven-model/maven.html) \
[Introduction to Repositories](https://maven.apache.org/guides/introduction/introduction-to-repositories.html) \
http://repo.maven.apache.org/maven2/

## [How do I build other types of projects?](https://maven.apache.org/guides/getting-started/index.html#How_do_I_build_other_types_of_projects)

```bash
mvn archetype:generate \
    -DarchetypeGroupId=org.apache.maven.archetypes \
    -DarchetypeArtifactId=maven-archetype-webapp \
    -DgroupId=com.mycompany.app \
    -DartifactId=my-webapp
```

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                      http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
 
  <groupId>com.mycompany.app</groupId>
  <artifactId>my-webapp</artifactId>
  <version>1.0-SNAPSHOT</version>
  <!--在这里设置包的类型-->
  <packaging>war</packaging>
 
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.11</version>
      <scope>test</scope>
    </dependency>
  </dependencies>
 
  <build>
    <finalName>my-webapp</finalName>
  </build>
</project>
```

```bash
mvn package
```