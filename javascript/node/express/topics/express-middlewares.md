# Express Middlewares

[Express VS Koa 中间件机制分析](https://juejin.im/post/5d5f3f4cf265da03f233d579)

Express 中间件模型 <https://www.processon.com/view/link/5e7dac5fe4b027d999d1a781>

```js
var myRouter = new Router();

    myRouter.use('/', function m1(req, res,next) {
      console.log('m1-start')
      setTimeout(function () {
        next()
      }, 0)
      console.log('m1-end')
    })

    myRouter.use('/', function m2(req, res,next) {
      console.log('m2-start')
      setTimeout(function () {
        next()
      }, 0)
      console.log('m2-end')
    })

    var myRoute = myRouter.route('/')

    myRoute.get(function m3(req, res, next) {
      console.log('m3-start')
      setTimeout(function () {
        next()
      }, 0)
      console.log('m3-end')
    })

    myRoute.get(function m4(req, res, next) {
      console.log('m4-start')
      setTimeout(function () {
        next()
      }, 0)
      console.log('m4-end')
    })

    var anotherRouter = new Router()

    myRouter.use('/', anotherRouter)

    anotherRouter.use('/', function m5(req, res,next) {
      console.log('m5-start')
      setTimeout(function () {
        next()
      }, 0)
      console.log('m5-end')
    })

    anotherRouter.use('/', function m6(req, res,next) {
      console.log('m6-start')
      setTimeout(function () {
        next()
      }, 0)
      console.log('m6-end')
    })

    var anotherRoute = anotherRouter.route('/')

    anotherRoute.get(function m7(req, res, next) {
      console.log('m7-start')
      setTimeout(function () {
        next()
      }, 0)
      console.log('m7-end')
    })

    anotherRoute.get(function m8(req, res, next) {
      console.log('m8-start')
      setTimeout(function () {
        res.end()
      }, 0)
      console.log('m8-end')
    })

    myRouter.handle({ url: '/', method: 'GET' }, { end: done });
```
