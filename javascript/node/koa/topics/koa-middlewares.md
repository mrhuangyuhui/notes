# Koa Middlewares

```js
const Koa = require('koa');
const app = new Koa();

app.use(async (ctx, next) => {
  console.log('m1-start');
  await next();
  console.log('m1-end');
});

app.use(async (ctx, next) => {
  console.log('m2-start');
  await next();
  console.log('m2-end');
});

app.use(async (ctx, next) => {
  console.log('m3-start');
  await next();
  console.log('m3-end');
});

app.use(async ctx => {
  console.log('我是洋葱的中心');
  ctx.body = 'Koa 的中间件洋葱模型演示';
});

app.listen(3000);

/**
$ node hello-world/app.js
m1-start
m2-start
m3-start
我是洋葱的中心
m3-end
m2-end
m1-end
 */
```
