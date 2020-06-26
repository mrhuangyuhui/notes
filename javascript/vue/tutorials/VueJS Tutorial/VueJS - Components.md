# [VueJS - Components](https://www.tutorialspoint.com/vuejs/vuejs_components.htm)

Global Component
```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <div id="test1">
            <my-component></my-component>
        </div>
        <div id="test2"></div>
    </div>
    <script type="text/javascript">
        var MyComponent = Vue.component('my-component', {
            template: '<div><h1>Hello, Component!</h1></div>'
        })

        new Vue({
            el: '#test1'
        })

        // new MyComponent().$mount('#test2')

        new MyComponent({
            el: '#test2'
        })
    </script>
</body>
</html>
```

**API**

https://vuejs.org/v2/api/#Vue-component \
https://vuejs.org/v2/api/#template

Local Component
```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <my-component></my-component>
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el: '#app',
            components: {
                'my-component': {
                    template: '<div><h1>Hello, Component!</h1></div>'
                }
            }
        })
    </script>
</body>
</html>
```

**API**

https://vuejs.org/v2/api/#components

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <div id="test1">
            <my-component></my-component>
        </div>
        <div id="test2">
            <my-component></my-component>
        </div>
    </div>
    <script type="text/javascript">
        Vue.component('my-component', {
            template: '\
                <div v-on:mouseover="changeName()" v-on:mouseout="originalName()">\
                    <h1>Custom Component created by <span id="name">{{ name }}</span></h1>\
                </div>',
            data: function () {
                return {
                    name: 'Ria'
                }
            },
            methods: {
                changeName: function () {
                    this.name = 'Ben'
                },
                originalName: function () {
                    this.name = 'Ria'
                }
            }
        })
        new Vue({
            el: '#test1'
        })
        new Vue({
            el: '#test2'
        })
    </script>
</body>
</html>
```

## Dynamic Components

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <component v-bind:is="view1"></component>
        <component v-bind:is="view2"></component>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                view1: 'component1',
                view2: 'component2'
            },
            components: {
                'component1': {
                    template: '<div><span style="font-size: 25; color: red;">Dynamic Component</span></div>'
                },
                'component2': {
                    template: '<div><span style="font-size: 25; color: blue;">Dynamic Component</span></div>'
                },
            }
        })
    </script>
</body>
</html>
```

**API**

https://vuejs.org/v2/api/#is