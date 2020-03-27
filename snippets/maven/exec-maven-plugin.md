# Exec Maven Plugin

@(Maven)[maven,snippet]

```java
package com.example;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, world!");
        for (String arg :
                args) {
            System.out.println(arg);
        }
    }
}
```

示例一：在 `</execution>` 下面配置

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.codehaus.mojo</groupId>
            <artifactId>exec-maven-plugin</artifactId>
            <version>1.6.0</version>
            <executions>
                <execution>
                    <id>example1</id>
                    <goals>
                        <goal>exec</goal>
                    </goals>
                    <!--在 </execution> 下面配置-->
                    <configuration>
                        <executable>java</executable>
                        <arguments>
                            <argument>-classpath</argument>
                            <classpath/>
                            <argument>com.example.Main</argument>
                            <argument>dog</argument>
                            <argument>pig</argument>
                            <argument>cat</argument>
                        </arguments>
                    </configuration>
                </execution>
                <execution>
                    <id>example2</id>
                    <goals>
                        <goal>java</goal>
                    </goals>
                    <configuration>
                        <mainClass>com.example.Main</mainClass>
                        <arguments>
                            <argument>dog</argument>
                            <argument>pig</argument>
                            <argument>cat</argument>
                        </arguments>
                    </configuration>
                </execution>
            </executions>
        </plugin>
    </plugins>
</build>
```

```bash
# 编译
mvn compile

## 注意：在 </execution> 下面配置时，必须指定 </id>，不然会报错。

# 使用 exec:exec 执行
mvn exec:exec@example1

# 使用 exec:java 执行
mvn exec:java@example2
```

示例二：在 `</plugin>` 下面配置

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.codehaus.mojo</groupId>
            <artifactId>exec-maven-plugin</artifactId>
            <version>1.6.0</version>
            <executions>
                <execution>
                    <id>example1</id>
                    <goals>
                        <goal>exec</goal>
                    </goals>
                </execution>
            </executions>
            <!--在 </plugin> 下面配置-->
            <configuration>
                <executable>java</executable>
                <arguments>
                    <argument>-classpath</argument>
                    <classpath/>
                    <argument>com.example.Main</argument>
                    <argument>dog</argument>
                    <argument>pig</argument>
                    <argument>cat</argument>
                </arguments>
            </configuration>
        </plugin>
    </plugins>
```

```bash
# 编译
mvn compile

# 可以不指定 </id>
mvn exec:exec

mvn exec:exec@example1
```

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.codehaus.mojo</groupId>
            <artifactId>exec-maven-plugin</artifactId>
            <version>1.6.0</version>
            <executions>
                <execution>
                    <id>example2</id>
                    <goals>
                        <goal>java</goal>
                    </goals>
                </execution>
            </executions>
            <configuration>
                <mainClass>com.example.Main</mainClass>
                <arguments>
                    <argument>dog</argument>
                    <argument>pig</argument>
                    <argument>cat</argument>
                </arguments>
            </configuration>
        </plugin>
    </plugins>
</build>
```

```bash
# 编译
mvn compile

# 可以不指定 </id>
mvn exec:java

mvn exec:exec@example2
```