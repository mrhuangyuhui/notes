# Spring Boot Manual

https://projects.spring.io/spring-boot/

https://github.com/spring-projects/spring-boot

https://stackoverflow.com/tags/spring-boot

https://start.spring.io/

https://github.com/spring-io/initializr

https://mvnrepository.com/artifact/org.springframework.boot

## References

### [Common application properties](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/reference/htmlsingle/#common-application-properties)

### [Spring Boot Docs 1.5.10.RELEASE API](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/api/)

**[Package org.springframework.boot.autoconfigure](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/api/org/springframework/boot/autoconfigure/package-summary.html)**

- [Annotation Type SpringBootApplication](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/api/org/springframework/boot/autoconfigure/SpringBootApplication.html)

**[Package org.springframework.boot.context.properties](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/api/org/springframework/boot/context/properties/package-summary.html)**

- [Annotation Type ConfigurationProperties](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/api/org/springframework/boot/context/properties/ConfigurationProperties.html)

[Starters](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/reference/htmlsingle/#using-boot-starter)

[spring-boot-starter-parent](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-parent)

[spring-boot-starter-web](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-web)

[spring-boot-maven-plugin](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-maven-plugin)

## [Maven installation](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/reference/htmlsingle/#getting-started-maven-installation)
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>myproject</artifactId>
    <version>0.0.1-SNAPSHOT</version>

    <!-- Inherit defaults from Spring Boot -->
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>1.5.10.RELEASE</version>
    </parent>

    <!-- Add typical dependencies for a web application -->
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
    </dependencies>

    <!-- Package as an executable jar -->
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>

</project>
```

## [Installing the Spring Boot CLI](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/reference/htmlsingle/#getting-started-installing-the-cli)

### [Installation with SDKMAN!](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/reference/htmlsingle/#getting-started-sdkman-cli-installation)

```bash
$ sdk install springboot
$ spring --version
Spring Boot v1.5.10.RELEASE
$ sdk ls springboot

================================================================================
Available Springboot Versions
================================================================================
> + dev
* 1.5.10.RELEASE

================================================================================
+ - local version
* - installed
> - currently in use
================================================================================
```

### [Command-line completion](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/reference/htmlsingle/#getting-started-cli-command-line-completion)

```bash
$ . ~/.sdkman/candidates/springboot/current/shell-completion/bash/spring
$ spring <HIT TAB HERE>
  grab  help  jar  run  test  version
```

### [Manual installation](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/reference/htmlsingle/#getting-started-manual-cli-installation)

## Documentation

[Quick Start](https://projects.spring.io/spring-boot/#quick-start)

[Spring Boot Reference Guide](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/reference/htmlsingle/)

## Samples

https://github.com/spring-projects/spring-boot/tree/v1.5.10.RELEASE/spring-boot-samples


