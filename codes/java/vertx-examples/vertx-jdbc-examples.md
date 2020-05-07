# [Vert.x JDBC Client Examples](https://github.com/vert-x3/vertx-examples/tree/master/jdbc-examples)

@(Vert.x)[vertx,jdbc,example]

**TODO** 补充 API

---

[TOC]

## [Simple](https://github.com/vert-x3/vertx-examples/tree/master/jdbc-examples#simple)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/jdbc-examples/src/main/java/io/vertx/example/jdbc/simple)

```java
// 配置客户端
final JDBCClient client = JDBCClient.createShared(vertx, new JsonObject()
    .put("url", "jdbc:hsqldb:mem:test?shutdown=true")
    .put("driver_class", "org.hsqldb.jdbcDriver")
    .put("max_pool_size", 30)
    .put("user", "SA")
    .put("password", ""));

// 连接数据库
client.getConnection(conn -> {
  if (conn.failed()) {
    System.err.println(conn.cause().getMessage());
    return;
  }

  final SQLConnection connection = conn.result();
  // 执行语句
  connection.execute("create table test(id int primary key, name varchar(255))", res -> {
    if (res.failed()) {
      throw new RuntimeException(res.cause());
    }
    // insert some test data
    connection.execute("insert into test values(1, 'Hello')", insert -> {
      // query some data
      connection.query("select * from test", rs -> {
        for (JsonArray line : rs.result().getResults()) {
          System.out.println(line.encode());
        }

        // and close the connection
        connection.close(done -> {
          if (done.failed()) {
            throw new RuntimeException(done.cause());
          }
        });
      });
    });
  });
});
```

## [Query Params](https://github.com/vert-x3/vertx-examples/tree/master/jdbc-examples#query-params)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/jdbc-examples/src/main/java/io/vertx/example/jdbc/query_params)

```java
connection.queryWithParams("select * from test where id = ?", new JsonArray().add(2), rs -> {
  // 回调代码
});
```

## [Transaction](https://github.com/vert-x3/vertx-examples/tree/master/jdbc-examples#transaction)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/jdbc-examples/src/main/java/io/vertx/example/jdbc/transaction)

```java
// 开始事务
startTx(conn.result(), beginTrans -> {
  // 执行语句
  execute(conn.result(), "insert into test values(1, 'Hello')", insert -> {
    // 提交事务
    endTx(conn.result(), commitTrans -> {
      // 回调代码
    });
  });
});

private void startTx(SQLConnection conn, Handler<ResultSet> done) {
  conn.setAutoCommit(false, res -> {
    if (res.failed()) {
      throw new RuntimeException(res.cause());
    }

    done.handle(null);
  });
}

private void endTx(SQLConnection conn, Handler<ResultSet> done) {
  conn.commit(res -> {
    if (res.failed()) {
      throw new RuntimeException(res.cause());
    }

    done.handle(null);
  });
}
```

## [Transaction Rollback](https://github.com/vert-x3/vertx-examples/tree/master/jdbc-examples#transaction-rollback)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/jdbc-examples/src/main/java/io/vertx/example/jdbc/transaction_rollback)

```java
startTx(conn.result(), beginTrans -> {
  execute(conn.result(), "insert into test values(1, 'Hello')", insert -> {
    // 回滚事务
    rollbackTx(conn.result(), rollbackTrans -> {
      // 回调代码
    });
  });
});

private void rollbackTx(SQLConnection conn, Handler<ResultSet> done) {
  conn.rollback(res -> {
    if (res.failed()) {
      throw new RuntimeException(res.cause());
    }

    done.handle(null);
  });
}
```