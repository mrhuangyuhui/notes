# [ExpressJS - Templating](https://www.tutorialspoint.com/expressjs/expressjs_templating.htm)

```
$ npm install --save pug
```

`./views/first_view.pug`
```
doctype html
html
    head
        title Hello Pug!
    body
        p.greetings#people Hello Pug!
```

`./index.js`
```js
var express = require('express')
var app = express()

app.set('view engine', 'pug')
app.set('views', './views')

app.get('/first_view', function (req, res) {
    res.render('first_view')
})

app.listen(3000)
```

```
$ curl "http://localhost:3000/first_view"
<!DOCTYPE html><html><head><title>Hello Pug!</title></head><body><p class="greetings" id="people">Hello Pug!</p></body></html>
```

**API** \
http://expressjs.com/en/4x/api.html#app.set \
http://expressjs.com/en/4x/api.html#res.render

## Important Features of Pug

### Simple Tags / Comments / Attributes

`./views/first_view.pug`
```
doctype html
html
    head
        title Hello Pug!
    body
        // Space seperated
        h1 Welcome to Pug
        // Piped text
        div
            | To insert multiline text, 
            | You can use the pipe operator.
        // Block of text
        div.
            But that gets tedious if you have a lot of text.
            You can use "." at the end of tag to denote block of text.
            To put tags inside this block, simply enter tag in a new line and 
            indent it accordingly.
        // Attributes
        div.container.column.main#division(width="100", height="100")
```

```
$ curl "http://localhost:3000/first_view"
<!DOCTYPE html><html><head><title>Hello Pug!</title></head><body><!-- Space seperated--><h1>Welcome to Pug</h1><!-- Piped text--><div>To insert multiline text,
You can use the pipe operator.</div><!-- Block of text--><div>But that gets tedious if you have a lot of text.
You can use "." at the end of tag to denote block of text.
To put tags inside this block, simply enter tag in a new line and
indent it accordingly.</div><!-- Attributes--><div class="container column main" id="division" width="100" height="100"></div></body></html>
```

### Passing Values to Templates

`./index.js`
```js
var express = require('express')
var app = express()

app.set('view engine', 'pug')
app.set('views', './views')

app.get('/dynamic_view', function (req, res) {
    res.render('dynamic_view', {
        name: "TutorialsPoint",
        url: "http://www.tutorialspoint.com"
    })
})

app.listen(3000)
```

`./views/dynamic_view.pug`
```
html
    head
        title=name
    body
        h1=name
        a(href=url) URL
```

```
$ curl "http://localhost:3000/first_view"
<html><head><title>TutorialsPoint</title></head><body><h1>TutorialsPoint</h1><a href="http://www.tutorialspoint.com">URL</a></body></html>
```

`./views/first_view.pug`
```
html
    head
        title=name
    body
        h1 Greetings from #{name}
        a(href=url) URL
```

```
$ curl "http://localhost:3000/dynamic_view"
<html><head><title>TutorialsPoint</title></head><body><h1>Greetings from TutorialsPoint</h1><a href="http://www.tutorialspoint.com">URL</a></body></html>
```

### Conditionals

`./index.js`
```
var express = require('express')
var app = express()

app.set('view engine', 'pug')
app.set('views', './views')

app.get('/dynamic_view', function (req, res) {
    res.render('dynamic_view', {
        user: { name: 'Ayush', age: '20' }
    })
})

app.listen(3000)
```

`./views/dynamic_view.pug`
```
html
    head
        title Simple template
    body
        if (user)
            h1 Hi, #{user.name}
        else
            a(href="/sign_up") Sign Up
```

```
$ curl "http://localhost:3000/dynamic_view"
<html><head><title>Simple template</title></head><body><h1>Hi, Ayush</h1></body></html>
```

### Include and Components

`./views/header.pug`
```
div.header.
    I'm the header for this website.
```

`./views/footer.pug`
```
div.footer.
    I'm the footer for this website.
```

`./views/content.pug`
```
html
    head
        title Simple template
    body
        include ./header.pug
        h3 I'm the main content
        include ./footer.pug
```

`./index.js`
```js
var express = require('express')
var app = express()

app.set('view engine', 'pug')
app.set('views', './views')

app.get('/components', function (req, res) {
    res.render('content')
})

app.listen(3000)
```

```
$ curl "http://localhost:3000/components"
<html><head><title>Simple template</title></head><body><div class="header">I'm the header for this website.</div><h3>I'm the main content</h3><div class="footer">I'm the footer for this website.</div></body></html>
```