# Spring Context API 4.3.14

## [Package `org.springframework.context`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/package-summary.html)

- [Interface ApplicationContext](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/ApplicationContext.html)
  - getBean
  - publishEvent
- [Interface ApplicationListener<E extends ApplicationEvent>](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/ApplicationListener.html)
- [Interface ResourceLoaderAware](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/ResourceLoaderAware.html)
- [Class ApplicationEvent](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/ApplicationEvent.html)

## [Package `org.springframework.context.annotation`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/annotation/package-summary.html)

- [Interface Condition](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/annotation/Condition.html)
- [Interface ConditionContext](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/annotation/ConditionContext.html)
- [Class AnnotationConfigApplicationContext](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/annotation/AnnotationConfigApplicationContext.html)
  - close
  - getBean
- [Annotation Type Bean](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/annotation/Bean.html)
  - destroyMethod
  - initMethod
- [Annotation Type ComponentScan](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/annotation/ComponentScan.html)
- [Annotation Type Conditional](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/annotation/Conditional.html)
- [Annotation Type Configuration](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/annotation/Configuration.html)
- [Annotation Type Import](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/annotation/Import.html)
- [Annotation Type Profile](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/annotation/Profile.html)
- [Annotation Type PropertySource](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/annotation/PropertySource.html)
- [Annotation Type Scope](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/annotation/Scope.html)

## [Package `org.springframework.context.support`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/support/package-summary.html)

- [Class ClassPathXmlApplicationContext](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/support/ClassPathXmlApplicationContext.html)
  - getBean
- [Class PropertySourcesPlaceholderConfigurer](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/context/support/PropertySourcesPlaceholderConfigurer.html)

## [Package `org.springframework.stereotype`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/stereotype/package-summary.html)

- [Annotation Type Component](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/stereotype/Component.html)
- [Annotation Type Controller](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/stereotype/Controller.html)
- [Annotation Type Repository](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/stereotype/Repository.html)
  - value
- [Annotation Type Service](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/stereotype/Service.html)
  - value