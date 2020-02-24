# [只订阅](http://dubbo.apache.org/#/docs/user/demos/subscribe-only.md)

以下的设置是保留服务注册中心的信息，但不向其注册。

```xml
<dubbo:registry address="10.20.153.10:9090" register="false" />
<!-- 或 -->
<dubbo:registry address="10.20.153.10:9090?register=false" />
```

示例

服务提供者

```xml
<dubbo:application name="demo-provider"/>
<!-- 保留服务注册中心的信息，但不向其注册。-->
<dubbo:registry address="multicast://224.5.6.7:1234" register="false"/>
<dubbo:protocol name="dubbo" port="20880"/>
<bean id="demoService" class="DemoServiceImpl"/>
<dubbo:service interface="DemoService" ref="demoService"/>
```

服务消费者

```xml
<dubbo:application name="demo-consumer"/>
<!-- 设置属性 url="dubbo://localhost:20880" 直连提供者。 -->
<dubbo:reference id="demoService" check="false" interface="DemoService" url="dubbo://localhost:20880"/>
```

[完整代码](https://gitee.com/mrhuangyuhui/dubbo/tree/master/dubbo-demos/dubbo-demo-3)