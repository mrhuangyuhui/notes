[toc]

# 3 通过范例学习构建 Gradle 项目

## 3.1 介绍学习案例

n/a

## 3.2 构建 Java 项目

### 3.2.1 使用 Java 插件

[`build.gradle`](https://github.com/bmuschko/gradle-in-action-source/blob/master/chapter03/todo-app/build.gradle)
```gradle
apply plugin: 'java'
```

**构建项目**

```bash
gradle build
```

**运行项目**

```
>java -cp build\classes\java\main com.manning.gia.todo.ToDoApp

--- To Do Application ---
Please make a choice:
(a)ll items
(f)ind a specific item
(i)nsert a new item
(u)pdate an existing item
(d)elete an existing item
(e)xit
>
```

### 3.2.2 定制你的项目

**修改项目和插件属性**

清单 3.4 修改属性变量并添加 JAR 文件头 \
[`build.gradle`](https://github.com/bmuschko/gradle-in-action-source/blob/master/chapter03/listing_03_04-todo-app-changing-properties/build.gradle)
```gradle
apply plugin: 'java'

version = 0.1
sourceCompatibility = 1.6

jar {
    manifest {
        attributes 'Main-Class': 'com.manning.gia.todo.ToDoApp'
    }
}
```

**改造遗留项目**

清单 3.5 改变项目默认结构 \
[`build.gradle`](https://github.com/bmuschko/gradle-in-action-source/blob/master/chapter03/listing_03_05-todo-app-changing-project-layout/build.gradle)
```gradle
apply plugin: 'java'

version = 0.1
sourceCompatibility = 1.6

jar {
    manifest {
        attributes 'Main-Class': 'com.manning.gia.todo.ToDoApp'
    }
}

sourceSets {
    main {
        java {
            srcDirs = ['src']
        }
    }
}

buildDir = 'out'
```

### 3.2.3 配置和使用外部依赖

[`build.gradle`](https://github.com/bmuschko/gradle-in-action-source/blob/master/chapter03/todo-app-external-dependency/build.gradle)
```gradle
apply plugin: 'java'

repositories {
    mavenCentral()
}

dependencies {
    compile group: 'org.apache.commons', name: 'commons-lang3', version: '3.1'
}

// Run application with "application" plugin
apply plugin: 'application'
mainClassName = 'com.manning.gia.todo.ToDoApp'

run {
    standardInput = System.in
}

// Run application with JavaExec task
task runWithJavaExec(type: JavaExec) {
    dependsOn classes
    classpath configurations.runtime, sourceSets.main.output.classesDir
    main = 'com.manning.gia.todo.ToDoApp'
    standardInput = System.in
}
```

## 3.3 用 Gradle 做 Web 开发

### 3.3.1 添加 Web 组件

n/a

### 3.3.2 使用 War 和 Jetty 插件

**War 插件**

[`build.gradle`](https://github.com/bmuschko/gradle-in-action-source/blob/master/chapter03/todo-webapp/build.gradle)
```gradle
apply plugin: 'java'
apply plugin: 'war'
apply plugin: 'jetty'

repositories {
    mavenCentral()
}

dependencies {
    providedCompile 'javax.servlet:servlet-api:2.5',
            'javax.servlet.jsp:jsp-api:2.1'
    runtime 'javax.servlet:jstl:1.1.2',
            'taglibs:standard:1.1.2'
}
```

**构建项目**

```bash
gradle build
```

**定制 War 插件**

[`build.gradle`](https://github.com/bmuschko/gradle-in-action-source/blob/master/chapter03/todo-webapp-customized/build.gradle)
```gradle
apply plugin: 'java'
apply plugin: 'war'
apply plugin: 'jetty'

repositories {
    mavenCentral()
}

dependencies {
    providedCompile 'javax.servlet:servlet-api:2.5'
    runtime 'javax.servlet:jstl:1.1.2'
}

webAppDirName = 'webfiles'

war {
    from 'static'
}
```


**在嵌入式 Web 容器中运行**

[`build.gradle`](https://github.com/bmuschko/gradle-in-action-source/blob/master/chapter03/todo-webapp-jetty/build.gradle)
```gradle
apply plugin: 'java'
apply plugin: 'war'
apply plugin: 'jetty'

repositories {
    mavenCentral()
}

dependencies {
    providedCompile 'javax.servlet:servlet-api:2.5'
    runtime 'javax.servlet:jstl:1.1.2'
}
```

运行
```bash
gradle jettyRun
```

**定制 Jetty 插件**

[`build.gradle`](https://github.com/bmuschko/gradle-in-action-source/blob/master/chapter03/todo-webapp-jetty-customized/build.gradle)
```gradle
apply plugin: 'java'
apply plugin: 'war'
apply plugin: 'jetty'

repositories {
    mavenCentral()
}

dependencies {
    providedCompile 'javax.servlet:servlet-api:2.5'
    runtime 'javax.servlet:jstl:1.1.2'
}

jettyRun {
    httpPort = 9090
    contextPath = 'todo'
}
```

运行
```bash
gradle jettyRun
```

## 3.4 Gradle 包装器

### 3.4.1 配置包装器

[`build.gradle`](https://github.com/bmuschko/gradle-in-action-source/blob/master/chapter03/todo-webapp-wrapper/build.gradle)
```gradle
apply plugin: 'java'
apply plugin: 'war'
apply plugin: 'jetty'

repositories {
    mavenCentral()
}

dependencies {
    providedCompile 'javax.servlet:servlet-api:2.5'
    runtime 'javax.servlet:jstl:1.1.2'
}

task wrapper(type: Wrapper) {
    gradleVersion = '1.2'
}
```

生成包装器文件
```bash
gradle wrapper
```

### 3.4.2 使用包装器

```bash
# Windows
gradlew.bat jettyRun

# *nix
gradlew jettyRun
```

### 3.4.3 定制包装器

跳过