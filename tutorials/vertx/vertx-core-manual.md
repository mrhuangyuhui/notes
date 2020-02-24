# [Vert.x Core Manual](https://vertx.io/docs/vertx-core/java/)

---

[TOC]

## [Async coordination](https://vertx.io/docs/vertx-core/java/#_async_coordination)

### [Sequential composition](https://vertx.io/docs/vertx-core/java/#_sequential_composition)

```java
FileSystem fs = vertx.fileSystem();
Future<Void> startFuture = Future.future();

Future<Void> fut1 = Future.future();
// completer 是一个简洁的写法，包括 complete 和 fail 两种情况。
fs.createFile("/foo", fut1.completer());

fut1.compose(v -> {
  // 这是函数式接口 Function 的 Lambda 表示，传入上一个 Future 的结果，然后执行一个操作，最后把结果丢进一个新的 Future 返回。
  Future<Void> fut2 = Future.future(); // 这里的 Future 是在内部创建的
  fs.writeFile("/foo", Buffer.buffer(), fut2.completer());
  return fut2;
}).compose(v -> {
          // 上一个 Future 完成后，执行传入的回调，把结果丢进一个新的 Future 返回。
          fs.move("/foo", "/bar", startFuture.completer());
        },
        // 这里的 Future 是从外部传入的
        startFuture);
```