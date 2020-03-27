# [Maven in 5 Minutes](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)

```bash
# 创建 Maven 项目
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

cd my-app

# 打包
mvn package

# 运行
java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
```