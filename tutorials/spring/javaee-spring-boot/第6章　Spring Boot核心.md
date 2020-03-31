# 第6章　Spring Boot核心

## 6.2　外部配置

### 6.2.2　常规属性配置

[Common application properties](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/reference/htmlsingle/#common-application-properties)

使用 5.2.2 节的代码

`ch5_2_2/src/main/resources/application.properties`
```
server.port=9090
server.CONTEXT_PATH=/helloboot

book.author=wangyunfei
book.name=spring boot
```

`ch5_2_2/src/main/java/com/wisely/ch5_2_2/Ch522Application.java`
```java
package com.wisely.ch5_2_2;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class Ch522Application {

	@Value("${book.author}")
	private String bookAuthor;

	@Value("${book.name}")
	private String bookName;

	@RequestMapping("/")
	String index() {
		return "book name is:"+bookName+" and book author is:" + bookAuthor;
	}

	public static void main(String[] args) {
		SpringApplication.run(Ch522Application.class, args);
	}
}
```

### 6.2.3　类型安全的配置（基于properties）

[Annotation Type ConfigurationProperties](https://docs.spring.io/spring-boot/docs/1.5.10.RELEASE/api/org/springframework/boot/context/properties/ConfigurationProperties.html)

`ch6_2_3/src/main/resources/application.properties`
```
author.name=wyf
author.age=32
```

`ch6_2_3/src/main/java/com/wisely/ch6_2_3/Ch623Application.java`
```java
package com.wisely.ch6_2_3;

import com.wisely.ch6_2_3.config.AuthorSettings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class Ch623Application {

	@Autowired
	private AuthorSettings authorSettings;

	@RequestMapping("/")
	public String index(){
		return "author name is "+ authorSettings.getName()+" and author age is "+authorSettings.getAge();
	}

	public static void main(String[] args) {
		SpringApplication.run(Ch623Application.class, args);
	}
}
```

`ch6_2_3/src/main/java/com/wisely/ch6_2_3/config/AuthorSettings.java`
```java
package com.wisely.ch6_2_3.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "author")
public class AuthorSettings {

    private String name;
    private Long age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getAge() {
        return age;
    }

    public void setAge(Long age) {
        this.age = age;
    }
}
```

## 6.3　日志配置

使用 5.2.2 节的代码

`ch5_2_2/src/main/resources/application.properties`
```
server.port=9090
server.CONTEXT_PATH=/helloboot

book.author=wangyunfei
book.name=spring boot

logging.file=/Users/yuhuihuang/mylog/log.log
logging.level.org.springframework.web=DEBUG
```


## 6.4　Profile配置

`ch6_4/src/main/resources/application-dev.properties`
```
server.port=8888
```

`ch6_4/src/main/resources/application-prod.properties`
```
server.port=8080
debug=true
```

`ch6_4/src/main/resources/application.properties`
```
spring.profiles.active=prod
```

`ch6_4/src/main/java/com/wisely/ch6_4/Ch64Application.java`
```java
package com.wisely.ch6_4;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class Ch64Application {

	@RequestMapping("/")
	public String index() {
		return "Hello World";
	}

	public static void main(String[] args) {
		SpringApplication.run(Ch64Application.class, args);
	}
}
```

## 6.5　Spring Boot运行原理

跳过

---

结束