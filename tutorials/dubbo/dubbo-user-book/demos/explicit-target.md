# [直连提供者](http://dubbo.apache.org/#/docs/user/demos/explicit-target.md?lang=zh-cn)

服务提供者

```xml
<dubbo:application name="demo-provider"/>
<!-- 不需要注册中心 -->
<!--<dubbo:registry address="multicast://224.5.6.7:1234"/>-->
<dubbo:protocol name="dubbo" port="20880"/>
<bean id="demoService" class="DemoServiceImpl"/>
<!-- 设置属性 registry="N/A"，不向任何注册中心注册服务。 -->
<dubbo:service interface="DemoService" ref="demoService" registry="N/A"/>
```

服务消费者

```xml
<!-- 设置属性 url="dubbo://localhost:20880" 直连提供者。 -->
<dubbo:reference id="demoService" check="false" interface="DemoService" url="dubbo://localhost:20880"/>
```

[完整代码]([完整代码](https://gitee.com/mrhuangyuhui/dubbo/tree/master/dubbo-demos/dubbo-demo-2))