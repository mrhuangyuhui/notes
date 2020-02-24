[toc]

# 2 下一代构建工具：Gradle

## 2.4 安装 Gradle

参考笔记：
http://note.youdao.com/noteshare?id=2588221f50138b08204af1d17e0177fd

## 2.5 开始使用 Gradle

每个 Gradle 构建都是以一个脚本开始的。Gradle 构建脚本默认的名字是 `build.gradle`。

```gradle
task helloWorld {
    doLast {
        println "Hello World"
    }
}
```

使用左移符号 `<<` 代表 `doLast`
```gradle
task helloWorld << {
    println "Hello World"
}
```

输出结果：
```
$ gradle -q helloworld
Hello World
```

命令行选项`-q`
```
-q, --quiet               Log errors only.
```

**清单 2.1 动态任务定义和任务链**
```gradle
task startSession << {
    chant()
}

def chant() {
    ant.echo 'Repeat after me...'
}

3.times { counter ->
    task "yayGradle$counter" << {
        println 'Gradle rocks'
    }
}

yayGradle0.dependsOn startSession
yayGradle2.dependsOn yayGradle1, yayGradle0
task groupTherapy(dependsOn: yayGradle2)
```

结果：
```
$ gradle groupTherapy
:startSession
[ant:echo] Repeat after me...
:yayGradle0
Gradle rocks
:yayGradle1
Gradle rocks
:yayGradle2
Gradle rocks
:groupTherapy
```

## 2.6 使用 Gradle 的命令行

### 2.6.1 列出项目中所有可用的 task

Gradle 提供了任务组的概念，你可以把它看作是多个 `task` 的集群。如果某个 `task` 不属于一个任务组，那么它就会显示在 Other tasks 中。

```
$ gradle -q tasks

------------------------------------------------------------
All tasks runnable from root project
------------------------------------------------------------

Build Setup tasks
-----------------
setupBuild - Initializes a new Gradle build. [incubating]
wrapper - Generates Gradle wrapper files. [incubating]

Help tasks
----------
dependencies - Displays all dependencies declared in root project 'listing_02_01-dynamic-task-and-task-dependencies'.
dependencyInsight - Displays the insight into a specific dependency in root project 'listing_02_01-dynamic-task-and-task-dependencies'.
help - Displays a help message
projects - Displays the sub-projects of root project 'listing_02_01-dynamic-task-and-task-dependencies'.
properties - Displays the properties of root project 'listing_02_01-dynamic-task-and-task-dependencies'.
tasks - Displays the tasks runnable from root project 'listing_02_01-dynamic-task-and-task-dependencies'.

Other tasks
-----------
groupTherapy
```

使用 `--all` 选项获得关于 `task` 的更多信息
```
$ gradle -q tasks --all

------------------------------------------------------------
All tasks runnable from root project
------------------------------------------------------------

Build Setup tasks
-----------------
setupBuild - Initializes a new Gradle build. [incubating]
wrapper - Generates Gradle wrapper files. [incubating]

Help tasks
----------
dependencies - Displays all dependencies declared in root project 'listing_02_01-dynamic-task-and-task-dependencies'.
dependencyInsight - Displays the insight into a specific dependency in root project 'listing_02_01-dynamic-task-and-task-dependencies'.
help - Displays a help message
projects - Displays the sub-projects of root project 'listing_02_01-dynamic-task-and-task-dependencies'.
properties - Displays the properties of root project 'listing_02_01-dynamic-task-and-task-dependencies'.
tasks - Displays the tasks runnable from root project 'listing_02_01-dynamic-task-and-task-dependencies'.

Other tasks
-----------
groupTherapy # 依赖关系图
    startSession
    yayGradle0
    yayGradle1
    yayGradle2
```

### 2.6.2 任务执行

一次执行多个任务。任务通常只会执行一次，无论它们是在命令行中指定的还是作为另一个任务的依赖。
```
$ gradle yayGradle0 groupTherapy
:startSession
[ant:echo] Repeat after me...
:yayGradle0
Gradle rocks
:yayGradle1
Gradle rocks
:yayGradle2
Gradle rocks
:groupTherapy
```

#### 在执行时排除一个任务

排除了任务 `yayGradle0` 和它的依赖任务 `startSession`
```
$ gradle groupTherapy -x yayGradle0
:yayGradle1
Gradle rocks
:yayGradle2
Gradle rocks
:groupTherapy
```

命令行选项`-x`
```
-x, --exclude-task        Specify a task to be excluded from execution.
```


### 2.6.3 命令行选项

```
$ gradle -h

USAGE: gradle [option...] [task...]

-?, -h, --help          Shows this help message.
-b, --build-file        Specifies the build file.
-D, --system-prop       Set system property of the JVM (e.g. -Dmyprop=myvalue).
-i, --info              Set log level to info.
--offline               The build should operate without accessing network resources.
-P, --project-prop      Set project property for the build script (e.g. -Pmyprop=myvalue).
-q, --quiet             Log errors only.
-s, --stacktrace        Print out the stacktrace for all exceptions.
-v, --version           Print version info.
-x, --exclude-task      Specify a task to be excluded from execution.
```

### 2.6.4 Gradle 守护进程

每次初始化一个构建时，JVM 都要启动一次，Gradle 的依赖要载入到类加载器中，还要建立项目对象模型。这个过程需要花上好几秒钟。Gradle 守护进程是这个问题的救星！

守护进程以后台进程方式运行 Gradle。一旦启动，`gradle` 命令就会在后续的构建中重用之前创建的守护进程，以避免启动时造成的开销。

守护进程会在 3 小时空闲时间之后自动过期。

```bash
$ gradle groupTherapy --daemon

# 第一次运行的时间
Total time: 4.219 secs
```

```bash
$ gradle groupTherapy --daemon

# 第二次运行的时间
Total time: 1.061 secs
```

命令行选项
```
--daemon                Uses the Gradle daemon to run the build. Starts the daemon if not running.
--no-daemon             Do not use the Gradle daemon to run the build.
--stop                  Stops the Gradle daemon if it is running.
```