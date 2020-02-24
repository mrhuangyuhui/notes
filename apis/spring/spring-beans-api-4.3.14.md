# Spring Beans API 4.3.14

## [Package `org.springframework.beans`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/package-summary.html)

- [Interface PropertyValues](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/PropertyValues.html)
- [Class MutablePropertyValues](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/MutablePropertyValues.html)
  - addPropertyValue
- [Class PropertyValue](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/PropertyValue.html)

## [Package `org.springframework.beans.factory`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/package-summary.html)

- [Interface BeanFactory](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/BeanFactory.html)
  - getBean
- [Interface BeanFactoryAware](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/BeanFactoryAware.html)
  - setBeanFactory
- [Interface BeanNameAware](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/BeanNameAware.html)
  - setBeanName
- [Interface DisposableBean](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/DisposableBean.html)
  - destroy
- [Interface InitializingBean](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/InitializingBean.html)
  - afterPropertiesSet

## [Package `org.springframework.beans.factory.annotation`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/annotation/package-summary.html)

- [Annotation Type Autowired](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/annotation/Autowired.html)
- [Annotation Type Value](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/annotation/Value.html)

## [Package `org.springframework.beans.factory.config`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/config/package-summary.html)

- [Interface BeanDefinition](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/config/BeanDefinition.html)
  - getPropertyValues
- [Interface BeanFactoryPostProcessor](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/config/BeanFactoryPostProcessor.html)
  - postProcessBeanFactory
- [Interface BeanPostProcessor](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/config/BeanPostProcessor.html)
  - postProcessAfterInitialization
  - postProcessBeforeInitialization
- [Interface InstantiationAwareBeanPostProcessor](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/config/InstantiationAwareBeanPostProcessor.html)
- [Class InstantiationAwareBeanPostProcessorAdapter](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/config/InstantiationAwareBeanPostProcessorAdapter.html)
  - postProcessAfterInstantiation
  - postProcessBeforeInstantiation
  - postProcessPropertyValues
- [Class PropertyPlaceholderConfigurer](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/config/PropertyPlaceholderConfigurer.html)

## [Package `org.springframework.beans.factory.support`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/support/package-summary.html)

- [Interface BeanDefinitionRegistry](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/support/BeanDefinitionRegistry.html)
- [Interface MethodReplacer](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/support/MethodReplacer.html)
- [Class DefaultListableBeanFactory](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/support/DefaultListableBeanFactory.html)
  - getBean

## [Package `org.springframework.beans.factory.xml`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/xml/package-summary.html)

- [Class XmlBeanDefinitionReader](https://docs.spring.io/spring/docs/4.3.14.RELEASE/javadoc-api/org/springframework/beans/factory/xml/XmlBeanDefinitionReader.html)
  - loadBeanDefinitions