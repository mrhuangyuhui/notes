# [Apache Maven Shade Plugin](http://maven.apache.org/plugins/maven-shade-plugin/)

@(Maven)[maven,manual]

把代码及其依赖打进一个 `jar` 包的插件

---

[TOC]

## [Usage](http://maven.apache.org/plugins/maven-shade-plugin/usage.html)

配置

```xml
<project>
  ...
  <build>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-shade-plugin</artifactId>
        <version>3.1.1</version>
        <configuration>
          <!-- put your configurations here -->
        </configuration>
        <executions>
          <execution>
            <phase>package</phase>
            <goals>
              <goal>shade</goal>
            </goals>
          </execution>
        </executions>
      </plugin>
    </plugins>
  </build>
  ...
</project>
```

打包

```bash
mvn package
```

## [Goals](http://maven.apache.org/plugins/maven-shade-plugin/plugin-info.html)

### [`shade:shade`](http://maven.apache.org/plugins/maven-shade-plugin/shade-mojo.html)

配置参数 | 说明
--- | ---
[`outputFile`](http://maven.apache.org/plugins/maven-shade-plugin/shade-mojo.html#outputFile) | 包的保存路径
[`transformers`](http://maven.apache.org/plugins/maven-shade-plugin/shade-mojo.html#transformers) | 资源转换器

## Examples

### [Executable JAR](http://maven.apache.org/plugins/maven-shade-plugin/examples/executable-jar.html)

```xml
<project>
  ...
  <build>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-shade-plugin</artifactId>
        <version>3.1.1</version>
        <executions>
          <execution>
            <phase>package</phase>
            <goals>
              <goal>shade</goal>
            </goals>
            <configuration>
              <transformers>
                <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                  <mainClass>org.sonatype.haven.HavenCli</mainClass>
                </transformer>
              </transformers>
            </configuration>
          </execution>
        </executions>
      </plugin>
    </plugins>
  </build>
  ...
</project>
```

### [Resource Transformers](http://maven.apache.org/plugins/maven-shade-plugin/examples/resource-transformers.html)

#### [AppendingTransformer](http://maven.apache.org/plugins/maven-shade-plugin/examples/resource-transformers.html#AppendingTransformer)

```xml
<project>
  ...
  <build>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-shade-plugin</artifactId>
        <version>3.1.1</version>
        <executions>
          <execution>
            <goals>
              <goal>shade</goal>
            </goals>
            <configuration>
              <transformers>
                <transformer implementation="org.apache.maven.plugins.shade.resource.AppendingTransformer">
                  <resource>META-INF/spring.handlers</resource>
                </transformer>
                <transformer implementation="org.apache.maven.plugins.shade.resource.AppendingTransformer">
                  <resource>META-INF/spring.schemas</resource>
                </transformer>
              </transformers>
            </configuration>
          </execution>
        </executions>
      </plugin>
    </plugins>
  </build>
  ...
</project>
```

#### [ManifestResourceTransformer](http://maven.apache.org/plugins/maven-shade-plugin/examples/resource-transformers.html#ManifestResourceTransformer)

```xml
<project>
  ...
  <build>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-shade-plugin</artifactId>
        <version>3.1.1</version>
        <executions>
          <execution>
            <goals>
              <goal>shade</goal>
            </goals>
            <configuration>
              <transformers>
                <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                  <manifestEntries>
                    <Main-Class>${app.main.class}</Main-Class>
                    <X-Compile-Source-JDK>${maven.compile.source}</X-Compile-Source-JDK>
                    <X-Compile-Target-JDK>${maven.compile.target}</X-Compile-Target-JDK>
                  </manifestEntries>
                </transformer>
              </transformers>
            </configuration>
          </execution>
        </executions>
      </plugin>
    </plugins>
  </build>
  ...
</project>
```