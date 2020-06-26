# 第 6 章 表单与 `v-model`

## 6.1 基本用法

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <input type="text" v-model="message" placeholder="输入...">
        <p>输入的内容是：{{ message }}</p>
    </div>

    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                message: ''
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
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <textarea v-model="text" placeholder="输入..."></textarea>
        <p>输入的内容是：</p>
        <p style="white-space: pre">{{ text }}</p>
    </div>

    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                text: ''
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
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <input type="text" @input="handleInput" placeholder="输入...">
        <p>输入的内容是：{{ message }}</p>
    </div>

    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                message: ''
            },
            methods: {
                handleInput: function (e) {
                    this.message = e.target.value
                }
            }
        })
    </script>
</body>
</html>
```

**单选按钮：**

单选按钮在单独使用时，不需要 `v-model`，直接使用 `v-bind` 绑定一个布尔类型的值，为真时选中，为否时不选。
```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <input type="radio" :checked="picked">
        <label>单选按钮</label>
    </div>

    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                picked: true
            },
        })
    </script>
</body>
</html>
```

如果是组合使用来实现互斥选择的效果，就需要 `v-model` 配合 `value` 来使用。
```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <input type="radio" v-model="picked" value="html" id="html">
        <label for="html">HTML</label>
        <br>
        <input type="radio" v-model="picked" value="js" id="js">
        <label for="js">JavaScript</label>
        <br>
        <input type="radio" v-model="picked" value="css" id="css">
        <label for="css">CSS</label>
        <br>
        <p>选择的项是：{{ picked }}</p>
    </div>

    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                picked: 'js'
            },
        })
    </script>
</body>
</html>
```

**复选框：**

复选框单独使用时，也是用 `v-model` 来绑定一个布尔值。
```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <input type="checkbox" v-model="checked" id="checked">
        <label for="checked">选择状态：{{ checked }}</label>
    </div>

    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                checked: false
            },
        })
    </script>
</body>
</html>
```

组合使用时，也是 `v-model` 与 `value` 一起，多个勾选框都绑定到同一个数组类型的数据。
```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <input type="checkbox" v-model="checked" value="html" id="html">
        <label for="html">HTML</label>
        <br>
        <input type="checkbox" v-model="checked" value="js" id="js">
        <label for="js">JavaScript</label>
        <br>
        <input type="checkbox" v-model="checked" value="css" id="css">
        <label for="css">CSS</label>
        <br>
        <p>选择的项是：{{ checked }}</p>
    </div>

    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                checked: ['html', 'css']
            },
        })
    </script>
</body>
</html>
```

**选择列表：**

单选
```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <select v-model="selected">
            <option>html</option>
            <option value="js">JavaScript</option>
            <option>css</option>
        </select>
        <p>选择的项是：{{ selected }}</p>
    </div>

    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                selected: 'html'
            },
        })
    </script>
</body>
</html>
```

多选
```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <select v-model="selected" multiple>
            <option>html</option>
            <option value="js">JavaScript</option>
            <option>css</option>
        </select>
        <p>选择的项是：{{ selected }}</p>
    </div>

    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                selected: ['html', 'js']
            },
        })
    </script>
</body>
</html>
```

在业务中，`<option>` 经常用 `v-for` 动态输出，`value` 和 `text` 也是用 `v-bind` 来动态输出的。
```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <select v-model="selected">
            <option v-for="option in options" :value="option.value">
                {{ option.text }}
            </option>
        </select>
        <p>选择的项是：{{ selected }}</p>
    </div>

    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                selected: 'html',
                options: [
                    {
                        text: 'HTML',
                        value: 'html'
                    },
                    {
                        text: 'JavaScript',
                        value: 'js'
                    },
                    {
                        text: 'CSS',
                        value: 'css'
                    }
                ]
            },
        })
    </script>
</body>
</html>
```

## 6.2 绑定值

**单选按钮：**

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <input type="radio" v-model="picked" :value="value">
        <label>单选按钮</label>
        <p>{{ picked }}</p>
        <p>{{ value }}</p>
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                picked: false,
                value: 123
            }
        })
    </script>
</body>
</html>
```

**复选框：**

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <input
            type="checkbox"
            v-model="toggle"
            :true-value="value1"
            :false-value="value2">
        <label>复选框</label>
        <p>{{ toggle }}</p>
        <p>{{ value1 }}</p>
        <p>{{ value2 }}</p>
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                toggle: false,
                value1: 'a',
                value2: 'b'
            }
        })
    </script>
</body>
</html>
```

**选择列表：**

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <select v-model="selected">
            <option :value="{ number: 123 }">123</option>
        </select>
        {{ selected.number }}
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                selected: ''
            }
        })
    </script>
</body>
</html>
```

## 6.3 修饰符

**`.lazy`:**

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <input type="text" v-model.lazy="message">
        <p>{{ message }}</p>
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                message: ''
            }
        })
    </script>
</body>
</html>
```

**`.number`:**

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <input type="number" v-model.number="message">
        <p>{{ typeof message }}</p>
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                message: 123
            }
        })
    </script>
</body>
</html>
```

**`.trim`:**

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        <input type="text" v-model.trim="message">
        <p>{{ message }}</p>
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el: "#app",
            data: {
                message: ''
            }
        })
    </script>
</body>
</html>
```