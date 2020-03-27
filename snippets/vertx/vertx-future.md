# Vert.x Future

注意：使用 `Future` 一定要调用 `setHandler` 设置回调操作

```java
private void handleListProducts(RoutingContext routingContext) {
    // 获取异步操作返回的 Future，里面装着的是操作结果。
    Future<ResultSet> future = getProducts(routingContext);
    // 根据 Future 的结果执行相应的回调操作，这一步绝对不能漏了。
    future.setHandler(rs -> {
        JsonArray arr = new JsonArray();
        rs.result().getRows().forEach(arr::add);
        JsonObject obj = new JsonObject();
        obj.put("code", 200).put("msg", "success").put("data", arr);
        routingContext.response().putHeader("content-type", "application/json;charset=utf-8").end(obj.encodePrettily());
    });
}

private Future<ResultSet> getProducts(RoutingContext routingContext) {

    HttpServerResponse response = routingContext.response();
    SQLConnection conn = routingContext.get("conn");

    // 新建一个 Future，用来装异步操作的结果。
    Future<ResultSet> ret = Future.future();

    // 异步操作
    conn.query("select * from table", query -> {
        if (query.failed()) {
            // 操作失败
        } else {
            // 操作成功，把结果装进 Future。
            ret.complete(query.result());
        }
    });

    return ret;
}
```