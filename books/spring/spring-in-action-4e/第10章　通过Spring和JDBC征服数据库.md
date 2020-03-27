[TOC]

# 第10章　通过Spring和JDBC征服数据库

## 10.1　Spring的数据访问哲学

> 为了避免持久化的逻辑分散到应用的各个组件中，最好将数据访问的功能放到一个或多个专注于此项任务的组件中。这样的组件通常称为数据访问对象（data access object，DAO）或Repository。

### 10.1.1　了解Spring的数据访问异常体系

> 尽管Spring的异常体系比JDBC简单的SQLException丰富得多，但它并没有与特定的持久化方式相关联。这意味着我们可以使用Spring抛出一致的异常，而不用关心所选择的持久化方案。这有助于我们将所选择持久化机制与数据访问层隔离开来。

> Spring使用了非检查型异常，而不是强制开发人员编写catch代码块（里面经常是空的）。这把是否要捕获异常的权力留给了开发人员。

### 10.1.2　数据访问模板化

> Spring将数据访问过程中固定的和可变的部分明确划分为两个不同的类：模板（template）和回调（callback）。模板管理过程中固定的部分，而回调处理自定义的数据访问代码。

> 针对不同的持久化平台，Spring提供了多个可选的模板。如果直接使用JDBC，那你可以选择JdbcTemplate。如果你希望使用对象关系映射框架，那HibernateTemplate或JpaTemplate可能会更适合你。

## 10.2　配置数据源

> Spring提供了在Spring上下文中配置数据源bean的多种方式，包括：
> - 通过JDBC驱动程序定义的数据源；
> - 通过JNDI查找的数据源；
> - 连接池的数据源。

### 10.2.1　使用JNDI数据源

XML 配置
```xml
<jee:jndi-lookup id="dataSource"
     jndi-name="/jdbc/SpitterDS"
 resource-ref="true" />
```
> 其中jndi-name属性用于指定JNDI中资源的名称。如果只设置了jndi-name属性，那么就会根据指定的名称查找数据源。但是，如果应用程序运行在Java应用服务器中，你需要将resource-ref属性设置为true，这样给定的jndi-name将会自动添加“java:comp/env/”前缀。

Java 配置
```java
@Bean
public JndiObjectFactoryBean dataSource() {
  JndiObjectFactoryBean jndiObjectFB = new JndiObjectFactoryBean();
  jndiObjectFB.setJndiName("jdbc/SpittrDS");
  jndiObjectFB.setResourceRef(true);
  jndiObjectFB.setProxyInterface(javax.sql.DataSource.class);
  return jndiObjectFB;
}
```

### 10.2.2　使用数据源连接池

跳过

### 10.2.3　基于JDBC驱动的数据源

跳过

### 10.2.4　使用嵌入式的数据源

跳过

### 10.2.5　使用profile选择数据源

跳过

## 10.3　在Spring中使用JDBC

### 10.3.1　应对失控的JDBC代码

跳过

### 10.3.2　使用JDBC模板

> Spring为JDBC提供了三个模板类供选择：
> 
> - JdbcTemplate：最基本的Spring JDBC模板，这个模板支持简单的JDBC数据库访问功能以及基于索引参数的查询；
> - NamedParameterJdbcTemplate：使用该模板类执行查询时可以将值以命名参数的形式绑定到SQL中，而不是使用简单的索引参数；
> - SimpleJdbcTemplate：该模板类利用Java 5的一些特性如自动装箱、泛型以及可变参数列表来简化JDBC模板的使用。
> 
> 以前，在选择哪一个JDBC模板的时候，我们需要仔细权衡。但是从Spring 3.1开始，做这个决定变得容易多了。SimpleJdbcTemplate已经被废弃了，其Java 5的特性被转移到了JdbcTemplate中，并且只有在你需要使用命名参数的时候，才需要使用NamedParameterJdbcTemplate。这样的话，对于大多数的JDBC任务来说，JdbcTemplate就是最好的可选方案。