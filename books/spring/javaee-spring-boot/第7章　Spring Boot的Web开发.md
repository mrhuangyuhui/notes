# 第7章　Spring Boot的Web开发

## 7.1　Spring Boot的Web开发支持

n/a

## 7.2　Thymeleaf模板引擎

`/Users/yuhuihuang/Git/spring/javaee-spring-boot-demos/ch7_2/pom.xml`
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>

	<groupId>com.wisely</groupId>
	<artifactId>ch7_2</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<packaging>jar</packaging>

	<name>ch7_2</name>
	<description>Demo project for Spring Boot</description>

	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>1.5.10.RELEASE</version>
		<relativePath/> <!-- lookup parent from repository -->
	</parent>

	<properties>
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
		<java.version>1.8</java.version>
	</properties>

	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-thymeleaf</artifactId>
		</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
	</dependencies>

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

`/Users/yuhuihuang/Git/spring/javaee-spring-boot-demos/ch7_2/src/main/java/com/wisely/Person.java`
```java
package com.wisely;

public class Person {

    private String name;
    private Integer age;

    public Person() {
    }

    public Person(String name, Integer age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
```

`/Users/yuhuihuang/Git/spring/javaee-spring-boot-demos/ch7_2/src/main/java/com/wisely/Ch72Application.java`
```java
package com.wisely;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@SpringBootApplication
public class Ch72Application {

	@RequestMapping("/")
	public String index(Model model) {

		Person single = new Person("aa", 11);
		model.addAttribute("singlePerson", single);

		List<Person> people = new ArrayList<Person>();
		Person p1 = new Person("xx", 11);
		Person p2 = new Person("yy", 22);
		Person p3 = new Person("zz", 33);
		people.add(p1);
		people.add(p2);
		people.add(p3);
		model.addAttribute("people", people);

		return "index";
	}

	public static void main(String[] args) {
		SpringApplication.run(Ch72Application.class, args);
	}
}
```

`/Users/yuhuihuang/Git/spring/javaee-spring-boot-demos/ch7_2/src/main/resources/templates/index.html`
```html
<html xmlns:th="http://www.thymeleaf.org">
  <head>
  	 <meta content="text/html;charset=UTF-8"/>
  	 <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
     <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link th:href="@{bootstrap/css/bootstrap.min.css}" rel="stylesheet"/> 
    <link th:href="@{bootstrap/css/bootstrap-theme.min.css}" rel="stylesheet"/>
  </head>
  <body>
  
  <div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">访问model</h3>
    </div>
    <div class="panel-body">
        	<span th:text="${singlePerson.name}"></span> 
    </div>
  </div>
  
  <div th:if="${not #lists.isEmpty(people)}">
	  <div class="panel panel-primary">
	    <div class="panel-heading">
	        <h3 class="panel-title">列表</h3>
	    </div>
	    <div class="panel-body">
	        <ul class="list-group">
				<li class="list-group-item" th:each="person:${people}">
				    <span th:text="${person.name}"></span>
				   	<span th:text="${person.age}"></span>
				   	<button class="btn" th:onclick="'getName(\'' + ${person.name} + '\');'">获得名字</button>
				</li>
	        </ul>
	    </div>
	 </div>
 </div>
  
  <script th:src="@{jquery-1.10.2.min.js}" type="text/javascript"></script><!-- 2 -->
  <script th:src="@{bootstrap/js/bootstrap.min.js}"></script><!-- 2 -->
  
  <script th:inline="javascript">
  	var single = [[${singlePerson}]];
  	console.log(single.name+"/"+single.age)
  	
  	function getName(name){
  		console.log(name);
  	}
  </script>
  
  </body>
 </html>
```

## 7.3　Web相关配置

跳过

## 7.4　Tomcat配置

### 7.4.1　配置Tomcat

n/a

### 7.4.2　代码配置Tomcat

`/Users/yuhuihuang/Git/spring/javaee-spring-boot-demos/ch7_4/src/main/java/com/wisely/ch7_4/CustomServletContainer.java`
```java
package com.wisely.ch7_4;

import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

// 服务器配置的第一种方法：新建一个外部配置类
//@Component
public class CustomServletContainer implements EmbeddedServletContainerCustomizer {
    @Override
    public void customize(ConfigurableEmbeddedServletContainer configurableEmbeddedServletContainer) {
        configurableEmbeddedServletContainer.setPort(8888);
        configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/404.html"));
        configurableEmbeddedServletContainer.setSessionTimeout(10, TimeUnit.MINUTES);
    }
}
```

`/Users/yuhuihuang/Git/spring/javaee-spring-boot-demos/ch7_4/src/main/java/com/wisely/ch7_4/Ch74Application.java`
```java
package com.wisely.ch7_4;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerFactory;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

@SpringBootApplication
public class Ch74Application {

	public static void main(String[] args) {
		SpringApplication.run(Ch74Application.class, args);
	}

	// 服务器配置的第二种方法：新建一个静态内部类
//	@Component
//	public static class CustomServletContainer implements EmbeddedServletContainerCustomizer {
//		@Override
//		public void customize(ConfigurableEmbeddedServletContainer configurableEmbeddedServletContainer) {
//			configurableEmbeddedServletContainer.setPort(9090);
//			configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/404.html"));
//			configurableEmbeddedServletContainer.setSessionTimeout(10, TimeUnit.MINUTES);
//		}
//	}

	// 服务器配置的第三种方法：针对特定的服务器配置，返回一个 bean。
	@Bean
	public EmbeddedServletContainerFactory servletContainer() {
		TomcatEmbeddedServletContainerFactory factory = new TomcatEmbeddedServletContainerFactory();
		factory.setPort(7070);
		factory.setSessionTimeout(10, TimeUnit.MINUTES);
		factory.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/404.html"));
		return factory;
	}

}
```

### 7.4.3　替换Tomcat

跳过