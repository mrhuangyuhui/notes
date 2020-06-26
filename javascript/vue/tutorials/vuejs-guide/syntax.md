# [模板语法](https://cn.vuejs.org/v2/guide/syntax.html)

## 插值

### 文本

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>
    <div id="app">
        <span>Message: {{ msg }}</span>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            msg: "Hello, Vue.js!"
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
        <span v-once>这个将不会改变: {{ msg }}</span>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            msg: "Hello, Vue.js!"
        }
    })
</script>

</html>
```

### 原始 HTML

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>
    <div id="app">
        <p>Using mustaches: {{ rawHtml }}</p>
        <p>Using v-html directive: <span v-html="rawHtml"></span></p>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: function () {
            return {
                rawHtml: '<span style="color: red">This should be red.</span>'
            }
        }
    })
</script>

</html>
```

### 特性

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>
    <div id="app">
        <div v-bind:id="dynamicId">Hello, Vue.js!</div>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            dynamicId: 12
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
        <button v-bind:disabled="isButtonDisabled1">true</button>
        <!-- 如果 isButtonDisabled 的值是 null、undefined 或 false，则 disabled 特性甚至不会被包含在渲染出来的 <button> 元素中。 -->
        <button v-bind:disabled="isButtonDisabled2">false</button>
        <button v-bind:disabled="isButtonDisabled3">null</button>
        <button v-bind:disabled="isButtonDisabled4">undefined</button>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            isButtonDisabled1: true,
            isButtonDisabled2: false,
            isButtonDisabled3: null,
            isButtonDisabled4: undefined
        }
    })
</script>

</html>
```

### 使用 JavaScript 表达式

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>
    <div id="app">
        <div>{{ number + 1 }}</div>
        <div>{{ ok ? 'Yes' : 'NO' }}</div>
        <div>{{ message.split('').reverse().join('') }}</div>
        <div v-bind:id="'list-' + id"></div>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            number: 10,
            ok: true,
            message: 'Hello',
            id: 101
        }
    })
</script>

</html>
```

## 指令

指令的职责是，当表达式的值改变时，将其产生的连带影响，响应式地作用于 DOM。

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

### 参数

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>
    <div id="app">
        <a v-bind:href="url">Google</a>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            url: 'https://www.google.com/'
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
        <button v-on:click="doSomething">Button</button>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        methods: {
            doSomething: function () {
                console.log('Hello, Vue.js!')
            }
        }
    })
</script>

</html>
```

### 动态参数

> 2.6.0 新增

todo

## 缩写

### `v-bind` 缩写

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>
    <div id="app">
        <!-- v-bind:href 的缩写 -->
        <a :href="url">Google</a>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            url: 'https://www.google.com/'
        }
    })
</script>

</html>
```

### `v-on` 缩写

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>
    <div id="app">
        <!-- v-on:click 的缩写 -->
        <button @click="doSomething">Button</button>
    </div>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        methods: {
            doSomething: function () {
                console.log('Hello, Vue.js!')
            }
        }
    })
</script>

</html>
```
