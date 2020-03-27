# [VueJS - Computed Properties](https://www.tutorialspoint.com/vuejs/vuejs_computed_properties.htm)

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        First Name: <input type="text" v-model="firstname"><br>
        Last Name: <input type="text" v-model="lastname"><br>
        <h1>{{ firstname }} {{ lastname }}</h1>
        <h1>{{ fullname }}</h1>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                firstname: '',
                lastname: ''
            },
            computed: {
                fullname: function () {
                    return this.firstname + ' ' + this.lastname
                }
            }
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
        <h1>Computed: {{ random_number_computed }}</h1>
        <h1>Computed: {{ random_number_computed }}</h1>
        <h1>Computed: {{ random_number_computed }}</h1>
        <hr>
        <h1>Method: {{ random_number_method() }}</h1>
        <h1>Method: {{ random_number_method() }}</h1>
        <h1>Method: {{ random_number_method() }}</h1>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            methods: {
                random_number_method: function () {
                    return Math.random()
                }
            },
            computed: {
                random_number_computed: function () {
                    return Math.random()
                }
            }
        })
    </script>
</body>
</html>
```

## Get/Set in Computed Properties

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <input type="text" v-model.lazy="fullname">
        <h1>First Name: {{ firstname }}</h1>
        <h1>Last Name: {{ lastname }}</h1>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                firstname: 'Terry',
                lastname: 'Ben'
            },
            computed: {
                fullname: {
                    get: function () {
                        return this.firstname + ' ' + this.lastname
                    },
                    set: function (val) {
                        var fname = val.split(' ')
                        this.firstname = fname[0]
                        this.lastname = fname[1]
                    }
                }
            }
        })
    </script>
</body>
</html>
```