Gradle Manual
===

<https://gradle.org/>

https://gradle.org/docs/

https://github.com/gradle/gradle-completion

https://github.com/gradle/gradle

## Installation [>>](https://gradle.org/install/)

<https://gradle.org/releases/>

**注意：要求 JDK 7+**
```
$ java -version
java version "1.8.0_121"
```

### SDKMAN [>>](https://gradle.org/install/#with-a-package-manager)

```bash
$ sdk install java 8u144-oracle
$ sdk install gradle 4.6
```

## Commands

```bash
gradle -v
```

## References

[User Manual](https://docs.gradle.org/4.6/userguide/userguide.html)

[API Javadoc](https://docs.gradle.org/current/javadoc/)

[DSL Reference](https://docs.gradle.org/current/dsl/)

## Plugins

[Standard Gradle plugins](https://docs.gradle.org/current/userguide/standard_plugins.html)

[Third party plugins](https://plugins.gradle.org/)

## Tutorials

[Gradle Tutorials and Guides](https://gradle.org/guides/)

## Examples

https://github.com/gradle/gradle/tree/master/subprojects/docs/src/samples

## [Gradle User Guide](https://docs.gradle.org/current/userguide/userguide.html)

### [Chapter 4. Using the Gradle Command-Line](https://docs.gradle.org/current/userguide/tutorial_gradle_command_line.html)

#### [4.1. Executing multiple tasks](https://docs.gradle.org/current/userguide/tutorial_gradle_command_line.html#sec:executing_multiple_tasks)

```
$ gradle dist test
```

#### [4.2. Excluding tasks](https://docs.gradle.org/current/userguide/tutorial_gradle_command_line.html#sec:excluding_tasks_from_the_command_line)

```
$ gradle dist -x test
```

#### [4.5. Selecting which build to execute](https://docs.gradle.org/current/userguide/tutorial_gradle_command_line.html#sec:selecting_build)

Selecting the project using a build file
```
$ gradle -q -b subdir/myproject.gradle hello
using build file 'myproject.gradle' in 'subdir'.
```

Selecting the project using project directory
```
$ gradle -q -p subdir hello
using build file 'build.gradle' in 'subdir'.
```

#### [4.7. Obtaining information about your build](https://docs.gradle.org/current/userguide/tutorial_gradle_command_line.html#sec:obtaining_information_about_your_build)

##### [4.7.2. Listing tasks](https://docs.gradle.org/current/userguide/tutorial_gradle_command_line.html#sec:listing_tasks)

Obtaining information about tasks
```
$ gradle -q tasks
```

Obtaining more information about tasks
```
$ gradle -q tasks --all
```





