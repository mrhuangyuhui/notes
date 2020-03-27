# [介绍](https://cn.vuejs.org/v2/guide/index.html)

## 声明式渲染

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>
    <div id="app">
        {{ message }}
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            message: 'Hello Vue!'
        }
    })
</script>

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
        <span v-bind:title="message">
            鼠标悬停几秒钟查看此处动态绑定的提示信息！
        </span>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: "#app",
        data: {
            message: '页面加载于 ' + new Date().toLocaleString()
        },
    })
</script>

</html>
```

## 条件与循环

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>
    <div id="app">
        <p v-if="seen">现在你看到我了</p>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            seen: true
        }
    })
</script>

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
        <ol>
            <li v-for="todo in todos">
                {{ todo.text }}
            </li>
        </ol>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            todos: [
                { text: '学习 JavaScript' },
                { text: '学习 Vue' },
                { text: '整个牛项目' }
            ]
        }
    })
</script>

</html>
```

## 处理用户输入

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>
    <div id="app">
        <p>{{ message }}</p>
        <button v-on:click="reverseMessage">反转消息</button>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            message: 'Hello Vue.js!',
        },
        methods: {
            reverseMessage: function () {
                this.message = this.message.split('').reverse().join('')
            }
        },
    })
</script>

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
        <p>{{ message }}</p>
        <input v-model="message">
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            message: 'Hello Vue.js!',
        }
    })
</script>

</html>
```

## 组件化应用构建

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>
    <div id="app">
        <ol>
            <todo-item v-for="item in groceryList" v-bind:todo="item" v-bind:key="item.id"></todo-item>
        </ol>
    </div>
</body>

<script type="text/javascript">
    Vue.component('todo-item', {
        props: ['todo'],
        template: '<li>{{ todo.text }}</li>'
    })
    var app = new Vue({
        el: '#app',
        data: {
            groceryList: [
                { id: 0, text: '蔬菜' },
                { id: 1, text: '奶酪' },
                { id: 2, text: '随便其它什么人吃的东西' }
            ]
        }
    })
</script>

</html>
```
