# [19. Data access with JDBC](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/jdbc.html)

## 19.1 Introduction to Spring Framework JDBC

n/a

## 19.2 Using the JDBC core classes to control basic JDBC processing and error handling

### [19.2.1 JdbcTemplate](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/jdbc.html#jdbc-JdbcTemplate)

Querying (SELECT)

```java
// 查询并返回一个整数
int rowCount = this.jdbcTemplate.queryForObject("select count(*) from t_actor", Integer.class);
```

```java
// 查询条件传入参数
int countOfActorsNamedJoe = this.jdbcTemplate.queryForObject(
        "select count(*) from t_actor where first_name = ?", Integer.class, "Joe");
```

```java
// 查询并返回一个字符串
String lastName = this.jdbcTemplate.queryForObject(
        "select last_name from t_actor where id = ?",
        new Object[]{1212L}, String.class);
```

```java
// 查询并返回一个对象
Actor actor = this.jdbcTemplate.queryForObject(
        "select first_name, last_name from t_actor where id = ?",
        new Object[]{1212L},
        new RowMapper<Actor>() {
            public Actor mapRow(ResultSet rs, int rowNum) throws SQLException {
                Actor actor = new Actor();
                actor.setFirstName(rs.getString("first_name"));
                actor.setLastName(rs.getString("last_name"));
                return actor;
            }
        });
```

```java
// 查询并返回一个对象列表
List<Actor> actors = this.jdbcTemplate.query(
        "select first_name, last_name from t_actor",
        new RowMapper<Actor>() {
            public Actor mapRow(ResultSet rs, int rowNum) throws SQLException {
                Actor actor = new Actor();
                actor.setFirstName(rs.getString("first_name"));
                actor.setLastName(rs.getString("last_name"));
                return actor;
            }
        });
```

Updating (INSERT/UPDATE/DELETE) with JdbcTemplate

```java
// 插入记录
this.jdbcTemplate.update(
        "insert into t_actor (first_name, last_name) values (?, ?)",
        "Leonor", "Watling");
// 修改记录
this.jdbcTemplate.update(
        "update t_actor set last_name = ? where id = ?",
        "Banjo", 5276L);
// 删除记录
this.jdbcTemplate.update(
        "delete from actor where id = ?",
        Long.valueOf(actorId));
```

`JdbcTemplate` 实例的注入

```java
public class JdbcCorporateEventDao implements CorporateEventDao {
    private JdbcTemplate jdbcTemplate;
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
}
```

```xml
<bean id="corporateEventDao" class="com.example.JdbcCorporateEventDao">
    <property name="dataSource" ref="dataSource"/>
</bean>

<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close">
    <property name="driverClassName" value="${jdbc.driverClassName}"/>
    <property name="url" value="${jdbc.url}"/>
    <property name="username" value="${jdbc.username}"/>
    <property name="password" value="${jdbc.password}"/>
</bean>

<context:property-placeholder location="jdbc.properties"/>
```

`JdbcTemplate` 实例的注入（注解）

```java
@Repository // 关键代码
public class JdbcCorporateEventDao implements CorporateEventDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired // 关键代码
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
}
```

```xml
<!-- 扫面注解类 -->
<context:component-scan base-package="org.springframework.docs.test" />
<!-- 配置数据源 -->
<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close">
    <!-- 数据源的属性值从外部属性文件读取 -->
    <property name="driverClassName" value="${jdbc.driverClassName}"/>
    <property name="url" value="${jdbc.url}"/>
    <property name="username" value="${jdbc.username}"/>
    <property name="password" value="${jdbc.password}"/>
</bean>
<!-- 引用的属性文件 -->
<context:property-placeholder location="jdbc.properties"/>
```

### [19.2.2 `NamedParameterJdbcTemplate`](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/jdbc.html#jdbc-NamedParameterJdbcTemplate)

使用 `MapSqlParameterSource` 映射参数

```java
public int countOfActorsByFirstName(String firstName) {
    String sql = "select count(*) from T_ACTOR where first_name = :first_name";
    // 可以调用 addValue 方法继续添加参数
    SqlParameterSource namedParameters = new MapSqlParameterSource("first_name", firstName);
    return this.namedParameterJdbcTemplate.queryForObject(sql, namedParameters, Integer.class);
}
```

使用 `Map` 映射参数

```java
public int countOfActorsByFirstName(String firstName) {
    String sql = "select count(*) from T_ACTOR where first_name = :first_name";
    // 关键代码
    Map<String, String> namedParameters = Collections.singletonMap("first_name", firstName);
    return this.namedParameterJdbcTemplate.queryForObject(sql, namedParameters,  Integer.class);
}
```

使用 `BeanPropertySqlParameterSource` 映射参数

```java
public class Actor {
    private Long id;
    private String firstName;
    private String lastName;
    // ...
}

public int countOfActors(Actor exampleActor) {
    // notice how the named parameters match the properties of the above 'Actor' class
    String sql = "select count(*) from T_ACTOR where first_name = :firstName and last_name = :lastName";
    // 关键代码
    SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(exampleActor);
    return this.namedParameterJdbcTemplate.queryForObject(sql, namedParameters, Integer.class);
}
```

### [19.2.5 Running queries](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/jdbc.html#jdbc-statements-querying)

```java
// 查询并返回一个整数
public int getCount() {
    return this.jdbcTemplate.queryForObject("select count(*) from mytable", Integer.class);
}
// 查询并返回一个字符串
public String getName() {
    return this.jdbcTemplate.queryForObject("select name from mytable", String.class);
}
// 查询并返回一个列表
public List<Map<String, Object>> getList() {
    return this.jdbcTemplate.queryForList("select * from mytable");
}
```

### [19.2.6 Updating the database](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/jdbc.html#jdbc-updates)

```java
public void setName(int id, String name) {
    this.jdbcTemplate.update("update mytable set name = ? where id = ?", name, id);
}
```

### [19.2.7 Retrieving auto-generated keys](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/jdbc.html#jdbc-auto-genereted-keys)

```java
final String INSERT_SQL = "insert into my_test (name) values(?)";
final String name = "Rob";

KeyHolder keyHolder = new GeneratedKeyHolder();
jdbcTemplate.update(
    new PreparedStatementCreator() {
        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
            PreparedStatement ps = connection.prepareStatement(INSERT_SQL, new String[] {"id"});
            ps.setString(1, name);
            return ps;
        }
    },
    keyHolder);

// keyHolder.getKey() now contains the generated key
```

## 19.3 Controlling database connections

### [19.3.1 DataSource](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/jdbc.html#jdbc-datasource)

DBCP configuration:

```xml
<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close">
    <property name="driverClassName" value="${jdbc.driverClassName}"/>
    <property name="url" value="${jdbc.url}"/>
    <property name="username" value="${jdbc.username}"/>
    <property name="password" value="${jdbc.password}"/>
</bean>

<context:property-placeholder location="jdbc.properties"/>
```

C3P0 configuration:

```xml
<bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource" destroy-method="close">
    <property name="driverClass" value="${jdbc.driverClassName}"/>
    <property name="jdbcUrl" value="${jdbc.url}"/>
    <property name="user" value="${jdbc.username}"/>
    <property name="password" value="${jdbc.password}"/>
</bean>

<context:property-placeholder location="jdbc.properties"/>
```

## 19.4 JDBC batch operations

### [19.4.1 Basic batch operations with the JdbcTemplate](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/jdbc.html#jdbc-batch-classic)

`JdbcTemplate` 的批量操作

```java
public int[] batchUpdate(final List<Actor> actors) {
    return this.jdbcTemplate.batchUpdate(
            "update t_actor set first_name = ?, last_name = ? where id = ?",
            new BatchPreparedStatementSetter() {
                public void setValues(PreparedStatement ps, int i) throws SQLException {
                    ps.setString(1, actors.get(i).getFirstName());
                    ps.setString(2, actors.get(i).getLastName());
                    ps.setLong(3, actors.get(i).getId().longValue());
                }
                public int getBatchSize() {
                    return actors.size();
                }
            });
}
```

### [19.4.2 Batch operations with a List of objects](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/jdbc.html#jdbc-batch-list)

`NamedParameterJdbcTemplate` 的批量操作

```java
public int[] batchUpdate(List<Actor> actors) {
    return this.namedParameterJdbcTemplate.batchUpdate(
            "update t_actor set first_name = :firstName, last_name = :lastName where id = :id",
            SqlParameterSourceUtils.createBatch(actors.toArray()));
}
```

### [19.4.3 Batch operations with multiple batches](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/html/jdbc.html#jdbc-batch-multi)

分批次批量操作

```java
public int[][] batchUpdate(final Collection<Actor> actors) {
    // 返回值是一个二维数组，一维的元素表示批次序号，二维的元素表示每次批量操作各语句影响的记录数量。
    int[][] updateCounts = jdbcTemplate.batchUpdate(
            "update t_actor set first_name = ?, last_name = ? where id = ?",
            actors,
            100,// 每次批量操作的语句数量
            new ParameterizedPreparedStatementSetter<Actor>() {
                public void setValues(PreparedStatement ps, Actor argument) throws SQLException {
                    ps.setString(1, argument.getFirstName());
                    ps.setString(2, argument.getLastName());
                    ps.setLong(3, argument.getId().longValue());
                }
            });
    return updateCounts;
}
```