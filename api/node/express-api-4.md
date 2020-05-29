# [Express API](https://gitee.com/mrhuangyuhui/notes/blob/master/apis/express-api-4.md)

<http://expressjs.com/en/4x/api.html>

---

[TOC]

## [express()](http://expressjs.com/en/4x/api.html#express)

Methods

- [express.static(root, [options])](http://expressjs.com/en/4x/api.html#express.static)
- [express.Router([options])](http://expressjs.com/en/4x/api.html#express.router)

## [Request](http://expressjs.com/en/4x/api.html#req)

Properties

- [req.body](http://expressjs.com/en/4x/api.html#req.body)
- [req.cookies](http://expressjs.com/en/4x/api.html#req.cookies)
- [req.params](http://expressjs.com/en/4x/api.html#req.params)

## [Application](http://expressjs.com/en/4x/api.html#app)

Methods

- [app.get(path, callback [, callback ...])](http://expressjs.com/en/4x/api.html#app.get.method)
- [app.listen([port[, host[, backlog]]][, callback])](http://expressjs.com/en/4x/api.html#app.listen)
- [app.post(path, callback [, callback ...])](http://expressjs.com/en/4x/api.html#app.post.method)
- [app.set(name, value)](http://expressjs.com/en/4x/api.html#app.set)
- [app.use([path,] callback [, callback...])](http://expressjs.com/en/4x/api.html#app.use)

## [Response](http://expressjs.com/en/4x/api.html#res)

Methods

- [res.clearCookie(name [, options])](http://expressjs.com/en/4x/api.html#res.clearCookie)
- [res.cookie(name, value [, options])](http://expressjs.com/en/4x/api.html#res.cookie)
- [res.render(view [, locals] [, callback])](http://expressjs.com/en/4x/api.html#res.render)
- [res.json([body])](http://expressjs.com/en/4x/api.html#res.json)
- [res.sendStatus(statusCode)](http://expressjs.com/en/4x/api.html#res.sendStatus)
- [res.send([body])](http://expressjs.com/en/4x/api.html#res.send)

## [Router](http://expressjs.com/en/4x/api.html#router)

Methods

- [router.METHOD(path, [callback, ...] callback)](http://expressjs.com/en/4x/api.html#router.METHOD)