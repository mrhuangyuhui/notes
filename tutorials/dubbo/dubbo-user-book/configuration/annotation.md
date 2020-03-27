# [注解配置](http://dubbo.apache.org/#/docs/user/configuration/annotation.md?lang=zh-cn)

[官方文档](<http://dubbo.apache.org/#/docs/user/configuration/annotation.md?lang=zh-cn>)

[官方示例](https://github.com/apache/incubator-dubbo/tree/2.6.x/dubbo-test/dubbo-test-examples/src/main/java/com/alibaba/dubbo/examples/annotation)

## 服务提供方

```java
// 暴露服务
@Service(timeout = 5000)
public class AnnotateServiceImpl implements AnnotateService {
    // ...
}
```

```java
@Configuration
public class DubboConfiguration {

    @Bean // 配置应用程序
    public ApplicationConfig applicationConfig() {
        ApplicationConfig applicationConfig = new ApplicationConfig();
        applicationConfig.setName("provider-test");
        return applicationConfig;
    }

    @Bean // 配置注册中心
    public RegistryConfig registryConfig() {
        RegistryConfig registryConfig = new RegistryConfig();
        registryConfig.setAddress("zookeeper://127.0.0.1:2181");
        registryConfig.setClient("curator");
        return registryConfig;
    }
}
```

```java
@SpringBootApplication
// 扫描 Dubbo 注解类
@DubboComponentScan(basePackages = "com.alibaba.dubbo.test.service.impl")
public class ProviderTestApp {
    // ...
}
```

## 服务消费方

```java
public class AnnotationConsumeService {

    @Reference // 引用服务
    public AnnotateService annotateService;

    // ...
}
```

```java
// 配置类
@Configuration
public class DubboConfiguration {

    @Bean // 配置应用程序
    public ApplicationConfig applicationConfig() {
        ApplicationConfig applicationConfig = new ApplicationConfig();
        applicationConfig.setName("consumer-test");
        return applicationConfig;
    }

    @Bean // 配置服务消费者
    public ConsumerConfig consumerConfig() {
        ConsumerConfig consumerConfig = new ConsumerConfig();
        consumerConfig.setTimeout(3000);
        return consumerConfig;
    }

    @Bean // 配置注册中心
    public RegistryConfig registryConfig() {
        RegistryConfig registryConfig = new RegistryConfig();
        registryConfig.setAddress("zookeeper://127.0.0.1:2181");
        registryConfig.setClient("curator");
        return registryConfig;
    }
}
```

```java
@SpringBootApplication
// 扫描 Dubbo 注解类
@DubboComponentScan(basePackages = "com.alibaba.dubbo.test.service")
public class ConsumerTestApp {
    // ...
}
```