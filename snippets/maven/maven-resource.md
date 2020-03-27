# Maven 配置资源打包

[Apache Maven Resources Plugin](https://maven.apache.org/plugins/maven-resources-plugin/)

[Packaging Web Archives](https://javaee.github.io/tutorial/packaging003.html#BCGHAHGD)

## 在 `build/resources` 上配置

[Specifying resource directories](https://maven.apache.org/plugins/maven-resources-plugin/examples/resource-directory.html)

[Including and excluding files and directories](https://maven.apache.org/plugins/maven-resources-plugin/examples/include-exclude.html)

[resource](https://maven.apache.org/ref/3.5.2/maven-model/maven.html#class_resource)

示例：
```xml
<build>
    <finalName>app06b</finalName>
    <resources>
      <resource>
        <directory>src/main/webapp/WEB-INF</directory>
        <targetPath>META-INF/</targetPath>
        <includes>
          <include>*.tld</include>
        </includes>
      </resource>
    </resources>
</build>
```

参考以下笔记：

http://note.youdao.com/noteshare?id=9530f04d5ee583c371bc2f5ed4151c1a

## 使用 `maven-resources-plugin` 进行配置

[resources:copy-resources](https://maven.apache.org/plugins/maven-resources-plugin/copy-resources-mojo.html)

[Copy Resources](https://maven.apache.org/plugins/maven-resources-plugin/examples/copy-resources.html)

示例：
```xml
<project>
  ...
  <build>
    <plugins>
      <plugin>
        <artifactId>maven-resources-plugin</artifactId>
        <version>3.0.2</version>
        <executions>
          <execution>
            <id>copy-resources</id>
            <!-- here the phase you need -->
            <phase>validate</phase>
            <goals>
              <goal>copy-resources</goal>
            </goals>
            <configuration>
              <outputDirectory>${basedir}/target/extra-resources</outputDirectory>
              <resources>          
                <resource>
                  <directory>src/non-packaged-resources</directory>
                  <filtering>true</filtering>
                </resource>
              </resources>              
            </configuration>            
          </execution>
        </executions>
      </plugin>
    </plugins>
    ...
  </build>
  ...
</project>
```
