# [Class 与 Style 绑定](https://cn.vuejs.org/v2/guide/class-and-style.html)

## 绑定 HTML Class

### 对象语法

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="example">
        <div v-bind:class="{ active: isActive }">
            <h1>Hello, Vue.js!</h1>
        </div>
    </div>
    <script type="text/javascript">
        var vm = new Vue({
            el: '#example',
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
    <div id="example">
        <div v-bind:class="{ active: isActive, 'text-danger': hasError }">
            <h1>Hello, Vue.js!</h1>
        </div>
    </div>
    <script type="text/javascript">
        var vm = new Vue({
            el: '#example',
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
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="example">
        <div v-bind:class="classObject">
            <h1>Hello, Vue.js!</h1>
        </div>
    </div>
    <script type="text/javascript">
        var vm = new Vue({
            el: '#example',
            data: {
                classObject: {
                    active: true,
                    'text-danger': false
                }
            }
        })
    </script>
</body>
</html>
```

### 数组语法

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="example">
        <div v-bind:class="[activeClass, errorClass]">
            <h1>Hello, Vue.js!</h1>
        </div>
    </div>
    <script type="text/javascript">
        var vm = new Vue({
            el: '#example',
            data: {
                activeClass: 'active',
                errorClass: 'text-danger'
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
    <div id="example">
        <div v-bind:class="[isActive ? activeClass : '', errorClass]">
            <h1>Hello, Vue.js!</h1>
        </div>
    </div>
    <script type="text/javascript">
        var vm = new Vue({
            el: '#example',
            data: {
                isActive: true,
                activeClass: 'active',
                errorClass: 'text-danger'
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
    <div id="example">
        <div v-bind:class="[{active: isActive}, errorClass]">
            <h1>Hello, Vue.js!</h1>
        </div>
    </div>
    <script type="text/javascript">
        var vm = new Vue({
            el: '#example',
            data: {
                isActive: true,
                errorClass: 'text-danger'
            }
        })
    </script>
</body>
</html>
```

### 用在组件上

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="example">
        <my-component class="baz boo"></my-component>
    </div>
    <script type="text/javascript">
        Vue.component('my-component', {
            template: '<p class="foo bar">Hi</p>'
        })
        var vm = new Vue({
            el: '#example'
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
    <div id="example">
        <my-component v-bind:class="{ active: isActive }"></my-component>
    </div>
    <script type="text/javascript">
        Vue.component('my-component', {
            template: '<p class="foo bar">Hi</p>'
        })
        var vm = new Vue({
            el: '#example',
            data: {
                isActive: true
            }
        })
    </script>
</body>
</html>
```

## 绑定内联样式

### 对象语法

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="example">
        <div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }">
            Hello, Vue.js!
        </div>
    </div>
    <script type="text/javascript">
        var vm = new Vue({
            el: '#example',
            data: {
                activeColor: 'red',
                fontSize: 30
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
    <div id="example">
        <div v-bind:style="styleObject">
            Hello, Vue.js!
        </div>
    </div>
    <script type="text/javascript">
        var vm = new Vue({
            el: '#example',
            data: {
                styleObject: {
                    color: 'red',
                    fontSize: '30px'
                } 
            }
        })
    </script>
</body>
</html>
```

### 数组语法

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="example">
        <div v-bind:style="[baseStyles, overridingStyles]">
            Hello, Vue.js!
        </div>
    </div>
    <script type="text/javascript">
        var vm = new Vue({
            el: '#example',
            data: {
                baseStyles: {
                    color: 'red',
                    fontSize: '30px'
                },
                overridingStyles: {
                    color: 'blue'
                } 
            }
        })
    </script>
</body>
</html>
```