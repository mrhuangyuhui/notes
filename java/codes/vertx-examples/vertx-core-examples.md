# [Vert.x Core Examples](https://github.com/vert-x3/vertx-examples/tree/master/core-examples)

@(Vert.x)[vertx,example]

运行示例代码的两种方式

- 在 IDE 上执行 `main` 方法
- 在终端上执行以下命令

```bash
mvn clean compile
vertx run fully-qualified-name-of-the-example -cp target/classes
```

---

[TOC]

## [Dependencies required](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#dependencies-required)

Maven 依赖 [`pom.xml`](https://github.com/vert-x3/vertx-examples/blob/master/core-examples/pom.xml)

```xml
<dependency>
  <groupId>io.vertx</groupId>
  <artifactId>vertx-core</artifactId>
  <version>3.5.1</version>
</dependency>
```

## [Embedding](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#embedding)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/embed)

```java
public static void main(String[] args) {
  Vertx.vertx().createHttpServer().requestHandler(req -> req.response().end("Hello World!")).listen(8080);
}
```

Java API

- [Interface Vertx](http://vertx.io/docs/apidocs/io/vertx/core/Vertx.html)
- [Interface HttpServer](http://vertx.io/docs/apidocs/io/vertx/core/http/HttpServer.html)
- [Interface Handler<E>](http://vertx.io/docs/apidocs/io/vertx/core/Handler.html)
- [Interface HttpServerRequest](http://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerRequest.html)
- [Interface HttpServerResponse](http://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerResponse.html)
- [Interface ReadStream<T>](http://vertx.io/docs/apidocs/io/vertx/core/streams/ReadStream.html)
- [Interface WriteStream<T>](http://vertx.io/docs/apidocs/io/vertx/core/streams/WriteStream.html)

## Net examples

跳过

## [HTTP examples](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#http-examples)

### [Simple](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#simple)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/http/simple)

```java
package io.vertx.example.core.http.simple;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Vertx;

public class Server extends AbstractVerticle {

    public static void main(String[] args) {
        Vertx.vertx().deployVerticle(new Server());
    }

    @Override
    public void start() throws Exception {
        vertx.createHttpServer().requestHandler(req -> {
            req.response().putHeader("content-type", "text/html").end("<html><body><h1>Hello from vert.x!</h1></body></html>");
        }).listen(8080);
    }
}
```

[Kotlin Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/kotlin/io/vertx/example/core/http/simple)

Java API

- [Class AbstractVerticle](https://vertx.io/docs/apidocs/io/vertx/core/AbstractVerticle.html)
- [Interface Verticle](https://vertx.io/docs/apidocs/io/vertx/core/Verticle.html)
- [Interface Future<T>](https://vertx.io/docs/apidocs/io/vertx/core/Future.html)
- [Interface AsyncResult<T>](http://vertx.io/docs/apidocs/io/vertx/core/AsyncResult.html)

### HTTPS

跳过

### Proxy connect

跳过

### Proxy

跳过

### [Sendfile](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#sendfile)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/http/sendfile)

```java
vertx.createHttpServer().requestHandler(req -> {
  String filename = null;
  if (req.path().equals("/")) {
    filename = "index.html";
  } else if (req.path().equals("/page1.html")) {
    filename = "page1.html";
  } else if (req.path().equals("/page2.html")) {
    filename = "page2.html";
  } else {
    req.response().setStatusCode(404).end();
  }
  if (filename != null) {
    req.response().sendFile(filename);
  }
}).listen(8080);
```

[Kotlin Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/kotlin/io/vertx/example/core/http/sendfile)

### [Simple form](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#simple-form)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/http/simpleform)

```java
vertx.createHttpServer().requestHandler(req -> {
  if (req.uri().equals("/")) {
    req.response().sendFile("index.html");
  } else if (req.uri().startsWith("/form")) {
    req.response().setChunked(true);
    req.setExpectMultipart(true);
    req.endHandler((v) -> {
      //读取表单数据
      for (String attr : req.formAttributes().names()) {
        req.response().write("Got attr " + attr + " : " + req.formAttributes().get(attr) + "\n");
      }
      req.response().end();
    });
  } else {
    req.response().setStatusCode(404).end();
  }
}).listen(8080);
```

[Kotlin Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/kotlin/io/vertx/example/core/http/simpleform)

Java API

- [Interface MultiMap](http://vertx.io/docs/apidocs/io/vertx/core/MultiMap.html)
- [setChunked](https://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerResponse.html#setChunked-boolean-)
- [setExpectMultipart](https://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerRequest.html#setExpectMultipart-boolean-)
- [endHandler](https://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerRequest.html#endHandler-io.vertx.core.Handler-)
- [formAttributes](https://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerRequest.html#formAttributes--)

### [Simple form file upload](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#simple-form-file-upload)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/http/simpleformupload)

```java
vertx.createHttpServer().requestHandler(req -> {
  if (req.uri().equals("/")) {
    req.response().sendFile("index.html");
  } else if (req.uri().startsWith("/form")) {
    req.setExpectMultipart(true);
    req.uploadHandler(upload -> {
      upload.exceptionHandler(cause -> {
        req.response().setChunked(true).end("Upload failed");
      });

      upload.endHandler(v -> {
        req.response().setChunked(true).end("Successfully uploaded to " + upload.filename());
      });
      // 保存文件
      upload.streamToFileSystem(upload.filename());
    });
  } else {
    req.response().setStatusCode(404);
    req.response().end();
  }
}).listen(8080);
```

[Kotlin Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/kotlin/io/vertx/example/core/http/simpleformupload)

Java API

- [Interface HttpServerFileUpload](http://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerFileUpload.html)
- [uploadHandler](https://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerRequest.html#uploadHandler-io.vertx.core.Handler-)
- [exceptionHandler](https://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerFileUpload.html#exceptionHandler-io.vertx.core.Handler-)
- [endHandler](https://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerFileUpload.html#endHandler-io.vertx.core.Handler-)
- [streamToFileSystem](https://vertx.io/docs/apidocs/io/vertx/core/http/HttpServerFileUpload.html#streamToFileSystem-java.lang.String-)

### [Http request body upload](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#http-request-body-upload)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/http/upload)

```java
vertx.createHttpServer().requestHandler(req -> {
  req.pause();
  String filename = UUID.randomUUID() + ".uploaded";
  vertx.fileSystem().open(filename, new OpenOptions(), ares -> {
    AsyncFile file = ares.result();
    // 连接请求数据和文件
    Pump pump = Pump.pump(req, file);
    req.endHandler(v1 -> file.close(v2 -> {
      System.out.println("Uploaded to " + filename);
      req.response().end();
    }));
    // 开始把数据写到文件
    pump.start();
    req.resume();
  });
}).listen(8080);
```

Kotlin Code 跳过

Java API

- [Interface FileSystem](http://vertx.io/docs/apidocs/io/vertx/core/file/FileSystem.html)
- [Interface AsyncFile](http://vertx.io/docs/apidocs/io/vertx/core/file/AsyncFile.html)
- [Interface Pump](http://vertx.io/docs/apidocs/io/vertx/core/streams/Pump.html)
- [open](https://vertx.io/docs/apidocs/io/vertx/core/file/FileSystem.html#open-java.lang.String-io.vertx.core.file.OpenOptions-io.vertx.core.Handler-)

> network io 网络读写

## [Event bus examples](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#event-bus-examples)

### [Point to point](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#point-to-point)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/eventbus/pointtopoint)

```java
// 发送消息
EventBus eb = vertx.eventBus();
eb.send("ping-address", "ping!", reply -> {
  if (reply.succeeded()) {
    // 有回复
  } else {
    // 无回复
  }
});

// 接收消息
EventBus eb = vertx.eventBus();
eb.consumer("ping-address", message -> {
  System.out.println("Received message: " + message.body());
  // 回复
  message.reply("pong!");
});
```

[Kotlin Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/kotlin/io/vertx/example/core/eventbus/pointtopoint)

注意：在命令行运行要加上 `-cluster` 选项，接下来的几个示例不再提示。

```bash
vertx run Receiver.kt -cluster
vertx run Sender.kt -cluster
```

Java API

- [Interface EventBus](https://vertx.io/docs/apidocs/io/vertx/core/eventbus/EventBus.html)
- [Interface Message<T>](https://vertx.io/docs/apidocs/io/vertx/core/eventbus/Message.html)
- [Interface MessageConsumer<T>](https://vertx.io/docs/apidocs/io/vertx/core/eventbus/MessageConsumer.html)
- [send](https://vertx.io/docs/apidocs/io/vertx/core/eventbus/EventBus.html#send-java.lang.String-java.lang.Object-io.vertx.core.Handler-)
- [consumer](https://vertx.io/docs/apidocs/io/vertx/core/eventbus/EventBus.html#consumer-java.lang.String-io.vertx.core.Handler-)

### [Publish / Subscribe](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#publish--subscribe)

[Java Code](https://github.com/vert-x3/vertx-examples/blob/master/core-examples/src/main/java/io/vertx/example/core/eventbus/pubsub)

```java
// 发布消息
EventBus eb = vertx.eventBus();
vertx.setPeriodic(1000, v -> eb.publish("news-feed", "Some news!"));

// 订阅消息
EventBus eb = vertx.eventBus();
eb.consumer("news-feed", message -> System.out.println("Received news on consumer 1: " + message.body()));
eb.consumer("news-feed", message -> System.out.println("Received news on consumer 2: " + message.body()));
eb.consumer("news-feed", message -> System.out.println("Received news on consumer 3: " + message.body()));
```

[Kotlin Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/kotlin/io/vertx/example/core/eventbus/pubsub)

Java API

- [publish](https://vertx.io/docs/apidocs/io/vertx/core/eventbus/EventBus.html#publish-java.lang.String-java.lang.Object-)

### [MessageCodec](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#messagecodec)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/eventbus/messagecodec)

```java
// 自定义编解码器
public class CustomMessageCodec implements MessageCodec<CustomMessage, CustomMessage> {
  @Override
  public void encodeToWire(Buffer buffer, CustomMessage customMessage) {
    // 编码逻辑
  }

  @Override
  public CustomMessage decodeFromWire(int position, Buffer buffer) {
    // 解码逻辑
  }
}
```

```java
// 注册编解码器（注意：发送者和接收者都要注册）
eventBus.registerDefaultCodec(CustomMessage.class, new CustomMessageCodec());
```

Java API

- [Interface MessageCodec<S,R>](https://vertx.io/docs/apidocs/io/vertx/core/eventbus/MessageCodec.html)

## [Future](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#future)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/future)

```java
@Override
public void start() throws Exception {
  Future<String> future = anAsyncAction();
  future.compose(this::anotherAsyncAction)
    .setHandler(ar -> { // Future 完成后（complete 或 fail）会触发这个回调
      if (ar.failed()) {
        // 失败
      } else {
        // 成功
      }
    });
}

private Future<String> anAsyncAction() {
  Future<String> future = Future.future();
  vertx.setTimer(100, l -> future.complete("world"));
  return future;
}

// 符合函数式接口 Function 的形态
private Future<String> anotherAsyncAction(String name) {
  Future<String> future = Future.future();
  vertx.setTimer(100, l -> future.complete("hello " + name));
  return future;
}
```

Java API

- [compose](https://vertx.io/docs/apidocs/io/vertx/core/Future.html#compose-java.util.function.Function-)
- [Interface Function<T,R>](https://docs.oracle.com/javase/8/docs/api/java/util/function/Function.html)

## [Verticle examples](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#verticle-examples)

### [Deploy example](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#deploy-example)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/verticle/deploy)

```java
// 无部署结果的回调
vertx.deployVerticle("io.vertx.example.core.verticle.deploy.OtherVerticle");

// 有部署结果的回调
vertx.deployVerticle("io.vertx.example.core.verticle.deploy.OtherVerticle", res -> {
  if (res.succeeded()) {
    // 成功
  } else {
    // 失败
  }
});

// 自定义部署配置
JsonObject config = new JsonObject().put("foo", "bar");
vertx.deployVerticle("io.vertx.example.core.verticle.deploy.OtherVerticle", new DeploymentOptions().setConfig(config));

// 部署多个实例
vertx.deployVerticle("io.vertx.example.core.verticle.deploy.OtherVerticle", new DeploymentOptions().setInstances(10));

// 以 Worker 的形式部署
vertx.deployVerticle("io.vertx.example.core.verticle.deploy.OtherVerticle", new DeploymentOptions().setWorker(true));
```

Kotlin Code 跳过

Java API

- [Class DeploymentOptions](https://vertx.io/docs/apidocs/io/vertx/core/DeploymentOptions.html)

### [Asynchronous deployment example](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#asynchronous-deployment-example)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/verticle/asyncstart)

```java
public class OtherVerticle extends AbstractVerticle {

  @Override
  public void start(Future<Void> startFuture) throws Exception {

    // 执行耗时代码

    // 执行完成，返回结果。
    startFuture.complete();
  }

  @Override
  public void stop(Future<Void> stopFuture) throws Exception {
    // 同上
    stopFuture.complete();
  }
}
```

Kotlin Code 跳过

Java API

- [start](https://vertx.io/docs/apidocs/io/vertx/core/AbstractVerticle.html#start-io.vertx.core.Future-)
- [stop](https://vertx.io/docs/apidocs/io/vertx/core/AbstractVerticle.html#stop-io.vertx.core.Future-)

### [Worker Verticle example](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#worker-verticle-example)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/verticle/worker)

```java
vertx.deployVerticle("io.vertx.example.core.verticle.worker.WorkerVerticle",
new DeploymentOptions().setWorker(true));
```

Java API

- [setWorker](https://vertx.io/docs/apidocs/io/vertx/core/DeploymentOptions.html#setWorker-boolean-)

**TODO** 对 Event Loop 和 Worker Pool 两个线程以后要深入了解

## [Execute blocking example](https://github.com/vert-x3/vertx-examples/tree/master/core-examples#execute-blocking-example)

[Java Code](https://github.com/vert-x3/vertx-examples/tree/master/core-examples/src/main/java/io/vertx/example/core/execblocking)

```java
vertx.<String>executeBlocking(future -> {

  // 执行阻塞代码

  // 执行完成，返回结果。
  future.complete(result);

}, res -> { // 执行结果的回调

  if (res.succeeded()) {
    // 成功
  } else {
    // 失败
  }
});
```

Java API

- [executeBlocking](https://vertx.io/docs/apidocs/io/vertx/core/Vertx.html#executeBlocking-io.vertx.core.Handler-io.vertx.core.Handler-)
- [setWorkerPoolName](https://vertx.io/docs/apidocs/io/vertx/core/DeploymentOptions.html#setWorkerPoolName-java.lang.String-)
- [setMaxWorkerExecuteTime](https://vertx.io/docs/apidocs/io/vertx/core/DeploymentOptions.html#setMaxWorkerExecuteTime-long-)
- [setWorkerPoolSize](https://vertx.io/docs/apidocs/io/vertx/core/DeploymentOptions.html#setWorkerPoolSize-int-)