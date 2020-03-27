# Vert.x Package

@(Vert.x)[vertx,snippet]

## Maven

打包

```xml
<properties>
    <main.verticle>com.example.MainVerticle</main.verticle>
</properties>

<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-shade-plugin</artifactId>
            <version>2.3</version>
            <executions>
                <execution>
                    <phase>package</phase>
                    <goals>
                        <goal>shade</goal>
                    </goals>
                    <configuration>
                        <transformers>
                            <transformer
                                    implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                                <manifestEntries>
                                    <Main-Class>io.vertx.core.Launcher</Main-Class>
                                    <Main-Verticle>${main.verticle}</Main-Verticle>
                                </manifestEntries>
                            </transformer>
                            <transformer
                                    implementation="org.apache.maven.plugins.shade.resource.AppendingTransformer">
                                <resource>META-INF/services/io.vertx.core.spi.VerticleFactory</resource>
                            </transformer>
                        </transformers>
                        <outputFile>${project.build.directory}/${project.artifactId}-${project.version}-fat.jar
                        </outputFile>
                    </configuration>
                </execution>
            </executions>
        </plugin>
    </plugins>
</build>
```

运行

```xml
<plugin>
    <groupId>org.codehaus.mojo</groupId>
    <artifactId>exec-maven-plugin</artifactId>
    <version>1.4.0</version>
    <executions>
        <execution>
            <id>main</id>
            <goals>
                <goal>java</goal>
            </goals>
            <configuration>
                <mainClass>io.vertx.core.Launcher</mainClass>
                <arguments>
                    <argument>run</argument>
                    <argument>${main.verticle}</argument>
                </arguments>
            </configuration>
        </execution>
        <execution>
            <id>jar</id>
            <goals>
                <goal>exec</goal>
            </goals>
            <configuration>
                <executable>java</executable>
                <arguments>
                    <argument>-jar</argument>
                    <argument>target/${project.artifactId}-${project.version}-fat.jar</argument>
                </arguments>
            </configuration>
        </execution>
    </executions>
```

```bash
# 运行 main 方法
mvn exec:java@main

# 打包
mvn clean package
# 运行 jar 包
mvn exec:exec@jar
```