# [VueJS - Instances](https://www.tutorialspoint.com/vuejs/vuejs_instances.htm)

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <h1>Firstname: {{ firstname }}</h1>
        <h1>Lastname: {{ lastname }}</h1>
        <h1>{{ mydetails() }}</h1>
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el: '#app',
            data: {
                firstname: 'Ria',
                lastname: 'Singh',
                address: 'Mumbai'
            },
            methods: {
                mydetails: function () {
                    return "I am " + this.firstname + " " + this.lastname
                }
            }
        })
    </script>
</body>
</html>
```

## `data`

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">

    </div>
    <script type="text/javascript">
        var obj = {
            fname: 'Raj',
            lname: 'Singh'
        }
        var app = new Vue({
            el: '#app',
            data: obj,
        })
        console.log(app.fname)
        console.log(app.$data)
        console.log(app.$data.fname)
    </script>
</body>
</html>
```

**API**

https://vuejs.org/v2/api/#data

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">

    </div>
    <script type="text/javascript">
        var obj = {
            fname: 'Raj',
            lname: 'Singh'
        }
        var MyComponent = Vue.extend({
            data: function () {
                return obj
            }
        })
        
        var myComponentInstance = new MyComponent()
        console.log(myComponentInstance.lname)
        console.log(myComponentInstance.$data)
    </script>
</body>
</html>
```

**API**

https://vuejs.org/v2/api/#Vue-extend

## `props`

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <my-component firstname="Terry" lastname="Ben"></my-component>
    </div>
    <script type="text/javascript">
        Vue.component('my-component', {
            props: ['firstname', 'lastname'],
            template: '<div>{{ firstname }} {{ lastname }}</div>'
        })
        var app = new Vue({
            el: '#app',
        })
    </script>
</body>
</html>
```

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <!-- 如果直接传递数字、布尔值、数组、对象，而且不使用 v-bind，传递的仅仅是字符串。 -->
        <my-component :height="175" :age="32"></my-component>
    </div>
    <script type="text/javascript">
        Vue.component('my-component', {
            props: {
                height: Number,
                age: {
                    type: Number,
                    default: 0,
                    required: true,
                    validator: function (value) {
                        return value >= 0
                    }
                }
            },
            template: '<div>Height: {{ height }}, Age: {{ age }}</div>'
        })
        var app = new Vue({
            el: '#app',
        })
    </script>
</body>
</html>
```

**API**

https://vuejs.org/v2/api/#props

## `propsData`

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
    </div>
    <script type="text/javascript">
        var MyComponent = Vue.extend({
            props: ['msg'],
            template: '<div>{{ msg }}</div>'
        })
        new MyComponent({
            el: '#app',
            propsData: {
                msg: 'Hello, world!'
            }
        })
    </script>
</body>
</html>
```

**API**

https://vuejs.org/v2/api/#Vue-extend

https://vuejs.org/v2/api/#propsData

## `computed`

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">

    </div>
    <script type="text/javascript">
        var app = new Vue({
            data: {
                a: 2
            },
            computed: {
                aSum: function () {
                    return this.a + 2
                },
                aSquare: {
                    get: function () {
                        return this.a * this.a
                    },
                    set: function (v) {
                        this.a = v * 2
                    }
                }
            }
        })

        console.log(app.aSquare)
        app.aSquare = 3
        console.log(app.a)
        console.log(app.aSum)
    </script>
</body>
</html>
```

**API**

https://vuejs.org/v2/api/#computed

## `methods`

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
    </div>
    <script type="text/javascript">
        var app = new Vue({
            data: {
                a: 5
            },
            methods: {
                aSquare: function () {
                    this.a *= this.a
                }
            }
        })

        app.aSquare()
        console.log(app.a)
    </script>
</body>
</html>
```

**API**

https://vuejs.org/v2/api/#methods