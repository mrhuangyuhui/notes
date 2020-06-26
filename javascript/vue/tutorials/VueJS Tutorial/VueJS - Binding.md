# [VueJS - Binding](https://www.tutorialspoint.com/vuejs/vuejs_binding.htm)

**Hence, to assign values to HTML attributes, we need to bind it with the directive `v-bind` as follows.**

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <a href="hrefLink" target="_blank">Click Me</a><br>
        <a href="{{hrefLink}}" target="_blank">Click Me</a><br>
        <a v-bind:href="hrefLink" target="_blank">Click Me</a>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                hrefLink: "https://www.google.com/"
            }
        })
    </script>
</body>
</html>
```

## Binding HTML Classes

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <style type="text/css">
        .active {
            background: red;
        }
    </style>
    <div id="app">
        <div v-bind:class="{ active: isActive }">Hello, world!</div>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                isActive: true
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
    <style type="text/css">
        .info {
            color: #00529B;
            background-color: #BDE5F8;
         }
         div {
            margin: 10px 0;
            padding: 12px;
         }
         .active {
            color: #4F8A10;
            background-color: #DFF2BF;
         }
         .displayError {
            color: #D8000C;
            background-color: #FFBABA;
         }
    </style>
    <div id="app">
        <div class="info" v-bind:class="{ active: isActive, 'displayError': hasError }">Hello, world!</div>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                isActive: true,
                hasError: false
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.0.0/vue.js"></script>
</head>
<body>
    <style type="text/css">
        .info {
            color: #00529B;
            background-color: #BDE5F8;
         }
         div {
            margin: 10px 0;
            padding: 12px;
         }
         .active {
            color: #4F8A10;
            background-color: #DFF2BF;
         }
         .displayError {
            color: #D8000C;
            background-color: #FFBABA;
         }
    </style>
    <div id="example">
        <div v-bind:class="[infoClass, errorClass]">Hello, world!</div>
    </div>
    
    <script type="text/javascript">
        var vm = new Vue({
            el: "#example",
            data: {
                infoClass: "info",
                errorClass: "displayError"
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
    <style type="text/css">
        .info {
            color: #00529B;
            background-color: #BDE5F8;
         }
         div {
            margin: 10px 0;
            padding: 12px;
         }
         .active {
            color: #4F8A10;
            background-color: #DFF2BF;
         }
         .displayError {
            color: #D8000C;
            background-color: #FFBABA;
         }
    </style>
    <div id="app">
        <div v-bind:class="[infoClass, errorClass]">Hello, world!</div>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                infoClass: 'info',
                errorClass: 'displayError'
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
    <style type="text/css">
        .info {
            color: #00529B;
            background-color: #BDE5F8;
         }
         div {
            margin: 10px 0;
            padding: 12px;
         }
         .active {
            color: #4F8A10;
            background-color: #DFF2BF;
         }
         .displayError {
            color: #D8000C;
            background-color: #FFBABA;
         }
    </style>
    <div id="app">
        <div v-bind:class="[isActive ? infoClass : '', hasError ? errorClass : '']">Hello, world!</div>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                infoClass: 'info',
                errorClass: 'displayError',
                isActive : true,
                hasError : false
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
    <style type="text/css">
        .info {
            color: #00529B;
            background-color: #BDE5F8;
         }
         div {
            margin: 10px 0;
            padding: 12px;
         }
         .active {
            color: #4F8A10;
            background-color: #DFF2BF;
         }
         .displayError {
            color: #D8000C;
            background-color: #FFBABA;
         }
    </style>
    <div id="app">
        <my-component class="active"></my-component>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            components: {
                'my-component': {
                    template: '<div class="info">Class Binding for component</div>'
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
    <style type="text/css">
        .info {
            color: #00529B;
            background-color: #BDE5F8;
         }
         div {
            margin: 10px 0;
            padding: 12px;
         }
         .active {
            color: #4F8A10;
            background-color: #DFF2BF;
         }
         .displayError {
            color: #D8000C;
            background-color: #FFBABA;
         }
    </style>
    <div id="app">
        <my-component v-bind:class="{ active: isActive }"></my-component>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                isActive: false
            },
            components: {
                'my-component': {
                    template: '<div class="info">Class Binding for component</div>'
                }
            }
        })
    </script>
</body>
</html>
```

## Binding Inline Styles

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }">Hello, world!</div>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                activeColor: 'red',
                fontSize: '30'
            },
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
        <div v-bind:style="styleObj">Hello, world!</div>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                styleObj: {
                    color: 'blue',
                    fontSize: '40px'
                }
            },
        })
    </script>
</body>
</html>
```

## Form Input Bindings

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <input type="text" v-model="name" placeholder="Enter Name"> Name: {{ name }}
        <br><br>
        <input type="checkbox" v-model="checked">Checked: {{ checked }}
        <br><br>
        <textarea v-model="text" placeholder="Add Details"></textarea><br>
        Text: <p>{{ text }}</p>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                name: '',
                text: '',
                checked: false
            },
        })
    </script>
</body>
</html>
```

### Radio and Select

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <input type="radio" id="black" value="Black" v-model="picked"> Black
        <input type="radio" id="white" value="White" v-model="picked"> White
        <h3>Radio: {{ picked }}</h3>
        <select v-model="lang">
            <option value="" disabled>Please select one</option>
            <option>Java</option>
            <option>Javascript</option>
            <option>PHP</option>
            <option>C</option>
            <option>C++</option>
        </select>
        <h3>Language: {{ lang }}</h3>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                picked: 'White',
                lang: "Java"
            },
        })
    </script>
</body>
</html>
```

### Modifiers
```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        Age: <input type="number" v-model.number="age">
        <br><br>
        Lazy Message: <input type="text" v-model.lazy="lazyMsg">
        Display Message: {{ lazyMsg }}
        <br><br>
        Trim Message: <input type="text" v-model.trim="trimMsg">
        Display Message: {{ trimMsg }}
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                age: 0,
                lazyMsg: '',
                trimMsg: ''
            },
        })
    </script>
</body>
</html>
```