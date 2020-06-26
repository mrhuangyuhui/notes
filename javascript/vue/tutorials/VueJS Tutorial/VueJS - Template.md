# [VueJS - Template](https://www.tutorialspoint.com/vuejs/vuejs_template.htm)

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <h1>First Name: {{ firstname }}</h1>
        <h1>Last Name: {{ lastname }}</h1>
        <div v-html="htmlcontent"></div>
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el: '#app',
            data: {
                firstname: 'Ria',
                lastname: 'Singh',
                htmlcontent: '<div><h1>Vue JS Template</h1></div>'
            }
        })
    </script>
</body>
</html>
```

**API**

https://vuejs.org/v2/api/#v-html

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <img v-bind:src="imgSrc">
        <img :src="imgSrc">
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el: '#app',
            data: {
                imgSrc: "https://www.tutorialspoint.com/vuejs/images/vuejs-mini-logo.jpg"
            }
        })
    </script>
</body>
</html>
```

**API**

https://vuejs.org/v2/api/#v-bind