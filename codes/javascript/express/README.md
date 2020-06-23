<!-- #express-code -->
<!-- omit in toc -->
# Express 源码阅读笔记

- [Versions](#versions)
  - [4.17.1](#4171)
- [Q&A](#qa)
- [Router、Route、Layer](#routerroutelayer)
- [路由匹配](#路由匹配)

<https://github.com/expressjs/express> | [Fork](https://github.com/mrhuangyuhui/express) | [Sourcegraph](https://sourcegraph.com/github.com/expressjs/express)

<https://github.com/mrhuangyuhui/express/tree/mrhuangyuhui/gitpod-setup>

## Versions

### 4.17.1

<https://github.com/expressjs/express/tree/4.17.1>

<https://gitee.com/mrhuangyuhui/express/tree/4.17.1/>

[`after`](https://npm.taobao.org/package/after) 包的用法解释

[`test/Route.js`](https://sourcegraph.com/github.com/expressjs/express@4.17.1/-/blob/test/Route.js#L32)

```js
it('should handle VERBS', function(done) {
  var count = 0;
  var route = new Route('/foo');
  // 函数 `cb` 在 `methods.forEach` 中被调用 34 次后，其参数闭包才会被调用。
  var cb = after(methods.length, function (err) {
    if (err) return done(err);
    count.should.equal(methods.length);
    done();
  });
  route.all(function(req, res, next) {
    count++;
    next();
  });
  // `methods` 有 34 个元素
  methods.forEach(function testMethod(method) {
    var req = { method: method, url: '/' };
    route.dispatch(req, {}, cb);
  });
})
```

![img](https://gitee.com/mrhuangyuhui/images/raw/master/express/express-methods-1.jpg)

## Q&A

`process_params` 是做什么的？

`trim_prefix` 是做什么的？

## Router、Route、Layer

<https://sourcegraph.com/github.com/expressjs/express@4.17.1/-/tree/lib/router>

调用 `router.use`，就是将每一个传入的中间件函数都绑定到一个新创建的 `layer` 上，然后装入数组 `router.stack` 中。

[`lib/router/index.js`](https://sourcegraph.com/github.com/expressjs/express@4.17.1/-/blob/lib/router/index.js#L428)

```js
proto.use = function use(fn) {
  // ...

  var callbacks = flatten(slice.call(arguments, offset));

  // ...

  for (var i = 0; i < callbacks.length; i++) {
    var fn = callbacks[i];

    // ...

    var layer = new Layer(path, {
      sensitive: this.caseSensitive,
      strict: false,
      end: false
    }, fn)/* 将中间件函数 fn 绑定到 layer.handle 上 */;

    // layer.route 为 undefined
    layer.route = undefined;

    this.stack.push(layer);
  }

  return this;
};
```

调用 `router.route`，就是创建一个新的 `route` 和 `layer`，并把 `route` 绑定到 `layer` 上，然后装入数组 `router.stack` 中。

[`lib/router/index.js`](https://sourcegraph.com/github.com/expressjs/express@4.17.1/-/blob/lib/router/index.js#L491)

```js
proto.route = function route(path) {
  var route = new Route(path);

  var layer = new Layer(path, {
    sensitive: this.caseSensitive,
    strict: this.strict,
    end: true
  }, route.dispatch.bind(route)/* route.dispatch 绑定到 layer.handle 上 */);

  // route 绑定到 layer.route 上
  layer.route = route;

  this.stack.push(layer);
  return route;
};
```

调用 `route.METHOD`，就是将每一个传入的中间件函数都绑定到一个新创建的 `layer` 上，然后装入数组 `route.stack` 中。

[`lib/router/route.js`](https://sourcegraph.com/github.com/expressjs/express@4.17.1/-/blob/lib/router/route.js#L192)

```js
methods.forEach(function(method){
  Route.prototype[method] = function(){
    var handles = flatten(slice.call(arguments));

    for (var i = 0; i < handles.length; i++) {
      var handle = handles[i];

      // ...

      var layer = Layer('/', {}, handle/* 中间件函数绑定到 layer.handle 上 */);
      layer.method = method;

      this.methods[method] = true;
      this.stack.push(layer);
    }

    return this;
  };
});
```

## 路由匹配

与正则表达式相关的笔记：

- [`regexp.code-search`](/searches/regexp)
- [`js-regexp.code-search`](/searches/js-regexp.code-search)
- [`regexp-js.code-search`](/searches/regexp-js.code-search)
- [`js-regexp.code-search`](/searches/js-regexp.code-search)

[Express Route Tester](http://forbeslindesay.github.io/express-route-tester/)

```js
var params = [];
// 对路由参数 foo 的格式进行限制
var m = pathToRegExp('/:foo((\\d)+)/:bar', params).exec('/123/abc');
```
