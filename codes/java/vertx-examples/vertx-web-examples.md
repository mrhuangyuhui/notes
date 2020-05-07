# [Vert.x Web Examples](https://github.com/vert-x3/vertx-examples/tree/master/web-examples)

@(Vert.x)[vertx,example]

---

[TOC]

## [Logging](https://github.com/vert-x3/vertx-examples/tree/master/web-examples#logging)

配置文件 `src/main/resources/vertx-default-jul-logging.properties`

## [Dependencies required](https://github.com/vert-x3/vertx-examples/tree/master/web-examples#dependencies-required)

Maven 依赖 [`pom.xml`](https://github.com/vert-x3/vertx-examples/blob/master/web-examples/pom.xml)

```xml
<dependency>
  <groupId>io.vertx</groupId>
  <artifactId>vertx-web</artifactId>
  <version>3.5.1</version>
</dependency>
```

## [Hello World](https://github.com/vert-x3/vertx-examples/tree/master/web-examples#hello-world)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/web-examples/src/main/java/io/vertx/example/web/helloworld)

```java
// 创建路由器
Router router = Router.router(vertx);

// 添加路由
router.route().handler(routingContext -> {
  routingContext.response().putHeader("content-type", "text/html").end("Hello World!");
});

// 指定某个路由器来处理网络请求
vertx.createHttpServer().requestHandler(router::accept).listen(8080);
```

Java API

- [Interface Route](https://vertx.io/docs/apidocs/io/vertx/ext/web/Route.html)
- [Interface Router](https://vertx.io/docs/apidocs/io/vertx/ext/web/Router.html)
- [Interface RoutingContext](https://vertx.io/docs/apidocs/io/vertx/ext/web/RoutingContext.html)

## Simple REST Micro-service [>>](https://github.com/vert-x3/vertx-examples/tree/master/web-examples#simple-rest-micro-service)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/web-examples/src/main/java/io/vertx/example/web/rest)

```java
router.route().handler(BodyHandler.create());

// 添加多个路由
router.get("/products/:productID").handler(this::handleGetProduct);
router.put("/products/:productID").handler(this::handleAddProduct);
router.get("/products").handler(this::handleListProducts);

// 读取路径变量的值
String productID = routingContext.request().getParam("productID");

// 读取请求数据
JsonObject product = routingContext.getBodyAsJson();
```

Java API

- [Interface BodyHandler](https://vertx.io/docs/apidocs/io/vertx/ext/web/handler/BodyHandler.html)
- [Class JsonArray](https://vertx.io/docs/apidocs/io/vertx/core/json/JsonArray.html)
- [encodePrettily](https://vertx.io/docs/apidocs/io/vertx/core/json/JsonObject.html#encodePrettily--)
- [getBodyAsJson](https://vertx.io/docs/apidocs/io/vertx/ext/web/RoutingContext.html#getBodyAsJson--)

## [Sessions example](https://github.com/vert-x3/vertx-examples/tree/master/web-examples#sessions-example)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/web-examples/src/main/java/io/vertx/example/web/sessions)

```java
router.route().handler(CookieHandler.create());
router.route().handler(SessionHandler.create(LocalSessionStore.create(vertx)));

router.route().handler(routingContext -> {

  Session session = routingContext.session();
  // 读取
  Integer cnt = session.get("hitcount");
  // 更新
  session.put("hitcount", cnt);
});
```

Java API

- [Interface Session](https://vertx.io/docs/apidocs/io/vertx/ext/web/Session.html)
- [Interface CookieHandler](https://vertx.io/docs/apidocs/io/vertx/ext/web/handler/CookieHandler.html)
- [Interface SessionHandler](https://vertx.io/docs/apidocs/io/vertx/ext/web/handler/SessionHandler.html)
- [Interface LocalSessionStore](https://vertx.io/docs/apidocs/io/vertx/ext/web/sstore/LocalSessionStore.html)
- [Interface SessionStore](https://vertx.io/docs/apidocs/io/vertx/ext/web/sstore/SessionStore.html)

## [Cookie example](https://github.com/vert-x3/vertx-examples/tree/master/web-examples#cookie-example)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/web-examples/src/main/java/io/vertx/example/web/cookie)

```java
router.route().handler(CookieHandler.create());

router.route().handler(ctx -> {
  // 获取客户端的 Cookie
  Cookie someCookie = ctx.getCookie("visits");

  long visits = 0;
  if (someCookie != null) {
    // 读取 Cookie 的值
    String cookieValue = someCookie.getValue();
    try {
      visits = Long.parseLong(cookieValue);
    } catch (NumberFormatException e) {
      visits = 0l;
    }
  }

  // 更新 Cookie 的值
  visits++;

  // 返回 Cookie 给客户端
  ctx.addCookie(Cookie.cookie("visits", "" + visits));
});
```

Java API

- [Interface CookieHandler](https://vertx.io/docs/apidocs/io/vertx/ext/web/handler/CookieHandler.html)
- [Interface StaticHandler](https://vertx.io/docs/apidocs/io/vertx/ext/web/handler/StaticHandler.html)

## [Upload example](https://github.com/vert-x3/vertx-examples/tree/master/web-examples#upload-example)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/web-examples/src/main/java/io/vertx/example/web/upload)

```java
router.route().handler(BodyHandler.create().setUploadsDirectory("uploads"));

router.post("/form").handler(ctx -> {

  ctx.response().putHeader("Content-Type", "text/plain");
  ctx.response().setChunked(true);

  // 读取文件信息
  for (FileUpload f : ctx.fileUploads()) {
    System.out.println("f");
    ctx.response().write("Filename: " + f.fileName());
    ctx.response().write("\n");
    ctx.response().write("Size: " + f.size());
  }

  ctx.response().end();
});
```

Java API

- [Interface FileUpload](https://vertx.io/docs/apidocs/io/vertx/ext/web/FileUpload.html)
- [setUploadsDirectory](https://vertx.io/docs/apidocs/io/vertx/ext/web/handler/BodyHandler.html#setUploadsDirectory-java.lang.String-)

## [HTML Form example](https://github.com/vert-x3/vertx-examples/tree/master/web-examples#html-form-example)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/web-examples/src/main/java/io/vertx/example/web/form)

```java
router.route().handler(BodyHandler.create());

router.post("/form").handler(ctx -> {
  ctx.response().putHeader(HttpHeaders.CONTENT_TYPE, "text/plain");
  ctx.response().end("Hello " + ctx.request().getParam("name") + "!");
});
```

Java API

- [Class HttpHeaders](http://vertx.io/docs/apidocs/io/vertx/core/http/HttpHeaders.html)

## [Blocking handler example](https://github.com/vert-x3/vertx-examples/tree/master/web-examples#blocking-handler-example)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/web-examples/src/main/java/io/vertx/example/web/blockinghandler)

```java
router.route().blockingHandler(routingContext -> {
  try {
    Thread.sleep(5000);
  } catch (Exception ignore) {
  }

  routingContext.next();
}, false);

router.route().handler(routingContext -> {
  routingContext.response().putHeader("content-type", "text/html").end("Hello World!");
});
```

Java API

- [blockingHandler](https://vertx.io/docs/apidocs/io/vertx/ext/web/Route.html#blockingHandler-io.vertx.core.Handler-boolean-)

## [Static web server example](https://github.com/vert-x3/vertx-examples/tree/master/web-examples#static-web-server-example)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/web-examples/src/main/java/io/vertx/example/web/staticsite)

```java
router.route().handler(StaticHandler.create());
```

## [JDBC example](https://github.com/vert-x3/vertx-examples/tree/master/web-examples#jdbc-example)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/web-examples/src/main/java/io/vertx/example/web/jdbc)

```java
router.route("/products*").handler(routingContext -> client.getConnection(res -> {
  if (res.failed()) {
    routingContext.fail(res.cause());
  } else {
    SQLConnection conn = res.result();

    // 保存数据库连接
    routingContext.put("conn", conn);

    // 关闭数据库连接
    routingContext.addHeadersEndHandler(done -> conn.close(v -> { }));

    routingContext.next();
  }
})).failureHandler(routingContext -> {
  SQLConnection conn = routingContext.get("conn");
  if (conn != null) {
    conn.close(v -> {
    });
  }
});
```

Java API

- [addHeadersEndHandler](https://vertx.io/docs/apidocs/io/vertx/ext/web/RoutingContext.html#addHeadersEndHandler-io.vertx.core.Handler-)
- [next](https://vertx.io/docs/apidocs/io/vertx/ext/web/RoutingContext.html#next--)