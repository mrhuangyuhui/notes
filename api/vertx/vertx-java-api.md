# [Vert.x Java API](http://vertx.io/docs/apidocs/)

---

[TOC]

## [All Classes](https://vertx.io/docs/apidocs/allclasses-frame.html)

## `io.vertx.core.*`

### [`io.vertx.core`](http://vertx.io/docs/apidocs/io/vertx/core/package-summary.html)

- [Interface AsyncResult<T>](http://vertx.io/docs/apidocs/io/vertx/core/AsyncResult.html)
- [Interface Future<T>](https://vertx.io/docs/apidocs/io/vertx/core/Future.html)
- [Interface Handler<E>](http://vertx.io/docs/apidocs/io/vertx/core/Handler.html)
- [Interface MultiMap](http://vertx.io/docs/apidocs/io/vertx/core/MultiMap.html)
- [Interface Verticle](https://vertx.io/docs/apidocs/io/vertx/core/Verticle.html)
- [Interface Vertx](http://vertx.io/docs/apidocs/io/vertx/core/Vertx.html)
- [Class AbstractVerticle](https://vertx.io/docs/apidocs/io/vertx/core/AbstractVerticle.html)
- [Class DeploymentOptions](https://vertx.io/docs/apidocs/io/vertx/core/DeploymentOptions.html)
- [Class Launcher](https://vertx.io/docs/apidocs/io/vertx/core/Launcher.html)
- [Class VertxOptions](http://vertx.io/docs/apidocs/io/vertx/core/VertxOptions.html)

### [`io.vertx.core.buffer`](https://vertx.io/docs/apidocs/io/vertx/core/buffer/package-summary.html)

- [Interface Buffer](https://vertx.io/docs/apidocs/io/vertx/core/buffer/Buffer.html)

### [`io.vertx.core.eventbus`](https://vertx.io/docs/apidocs/io/vertx/core/eventbus/package-summary.html)**

- [Interface EventBus](https://vertx.io/docs/apidocs/io/vertx/core/eventbus/EventBus.html)
- [Interface Message<T>](https://vertx.io/docs/apidocs/io/vertx/core/eventbus/Message.html)
- [Interface MessageCodec<S,R>](https://vertx.io/docs/apidocs/io/vertx/core/eventbus/MessageCodec.html)
- [Interface MessageConsumer<T>](https://vertx.io/docs/apidocs/io/vertx/core/eventbus/MessageConsumer.html)

### [`io.vertx.core.file`](http://vertx.io/docs/apidocs/io/vertx/core/file/package-summary.html)

- [Interface AsyncFile](http://vertx.io/docs/apidocs/io/vertx/core/file/AsyncFile.html)
- [Interface FileSystem](http://vertx.io/docs/apidocs/io/vertx/core/file/FileSystem.html)

### [`io.vertx.core.http`](http://vertx.io/docs/apidocs/io/vertx/core/http/package-summary.html)

- [Interface HttpConnection](http://vertx.io/docs/apidocs/io/vertx/core/http/HttpConnection.html)
- [Interface HttpServer](http://vertx.io/docs/apidocs/io/vertx/core/http/HttpServer.html)
- [Interface HttpServerFileUpload](http://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerFileUpload.html)
- [Interface HttpServerRequest](http://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerRequest.html)
- [Interface HttpServerResponse](http://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerResponse.html)
- [Class HttpHeaders](http://vertx.io/docs/apidocs/io/vertx/core/http/HttpHeaders.html)
- [Enum HttpMethod](https://vertx.io/docs/apidocs/io/vertx/core/http/HttpMethod.html)

### [`io.vertx.core.json`](https://vertx.io/docs/apidocs/io/vertx/core/json/package-summary.html)

- [Class Json](https://vertx.io/docs/apidocs/io/vertx/core/json/Json.html)
- [Class JsonArray](https://vertx.io/docs/apidocs/io/vertx/core/json/JsonArray.html)
- [Class JsonObject](https://vertx.io/docs/apidocs/io/vertx/core/json/JsonObject.html)

### [`io.vertx.core.net`](http://vertx.io/docs/apidocs/io/vertx/core/net/package-summary.html)

- [Interface NetClient](http://vertx.io/docs/apidocs/io/vertx/core/net/NetClient.html)
- [Interface NetSocket](http://vertx.io/docs/apidocs/io/vertx/core/net/NetSocket.html)

### [`io.vertx.core.streams`](http://vertx.io/docs/apidocs/io/vertx/core/streams/package-summary.html)

- [Interface Pump](http://vertx.io/docs/apidocs/io/vertx/core/streams/Pump.html)
- [Interface ReadStream<T>](http://vertx.io/docs/apidocs/io/vertx/core/streams/ReadStream.html)
- [Interface WriteStream<T>](http://vertx.io/docs/apidocs/io/vertx/core/streams/WriteStream.html)

## [`io.vertx.ext.jdbc`](https://vertx.io/docs/apidocs/io/vertx/ext/jdbc/package-summary.html)

- [Interface JDBCClient](https://vertx.io/docs/apidocs/io/vertx/ext/jdbc/JDBCClient.html)

## `io.vertx.ext.sql.*`

### [`io.vertx.ext.sql`](https://vertx.io/docs/apidocs/io/vertx/ext/sql/package-summary.html)

- [Interface SQLConnection](https://vertx.io/docs/apidocs/io/vertx/ext/sql/SQLConnection.html)
- [Class ResultSet](https://vertx.io/docs/apidocs/io/vertx/ext/sql/ResultSet.html)

## `io.vertx.ext.web.*`

### [`io.vertx.ext.web`](https://vertx.io/docs/apidocs/io/vertx/ext/web/package-summary.html)

- [Interface Cookie](https://vertx.io/docs/apidocs/io/vertx/ext/web/Cookie.html)
- [Interface FileUpload](https://vertx.io/docs/apidocs/io/vertx/ext/web/FileUpload.html)
- [Interface Route](https://vertx.io/docs/apidocs/io/vertx/ext/web/Route.html)
- [Interface Router](https://vertx.io/docs/apidocs/io/vertx/ext/web/Router.html)
- [Interface RoutingContext](https://vertx.io/docs/apidocs/io/vertx/ext/web/RoutingContext.html)
- [Interface Session](https://vertx.io/docs/apidocs/io/vertx/ext/web/Session.html)

### [`io.vertx.ext.web.handler`](https://vertx.io/docs/apidocs/io/vertx/ext/web/handler/package-summary.html)

- [Interface BodyHandler](https://vertx.io/docs/apidocs/io/vertx/ext/web/handler/BodyHandler.html)
- [Interface CookieHandler](https://vertx.io/docs/apidocs/io/vertx/ext/web/handler/CookieHandler.html)
- [Interface SessionHandler](https://vertx.io/docs/apidocs/io/vertx/ext/web/handler/SessionHandler.html)
- [Interface StaticHandler](https://vertx.io/docs/apidocs/io/vertx/ext/web/handler/StaticHandler.html)

### [`io.vertx.ext.web.sstore`](https://vertx.io/docs/apidocs/io/vertx/ext/web/sstore/package-summary.html)

- [Interface LocalSessionStore](https://vertx.io/docs/apidocs/io/vertx/ext/web/sstore/LocalSessionStore.html)
- [Interface SessionStore](https://vertx.io/docs/apidocs/io/vertx/ext/web/sstore/SessionStore.html)