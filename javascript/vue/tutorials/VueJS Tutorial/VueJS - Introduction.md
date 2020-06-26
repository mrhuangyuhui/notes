# [VueJS - Introduction](https://www.tutorialspoint.com/vuejs/vuejs_introduction.htm)

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <h1>{{ message }}</h1>
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el: '#app',
            data: {
                message: 'My first VueJS Task'
            }
        })
    </script>
</body>
</html>
```

Console
```js
app.message = "VueJs is interesting"
```