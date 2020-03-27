# [VueJS - Directives](https://www.tutorialspoint.com/vuejs/vuejs_directives.htm)

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <div v-mystyle>Hello, world!</div>
  </div>
  <script type="text/javascript">
    Vue.directive('mystyle', {
      bind: function (el, binding, vnode) {
        el.style.color = 'red'
        el.style.fontSize = '30px'
      }
    })

    new Vue({
      el: '#app',
    })
  </script>
</body>
</html>
```

https://vuejs.org/v2/api/#Vue-directive \
https://vuejs.org/v2/guide/custom-directive.html

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <div v-mystyle="{color: 'blue', fontSize: '40px'}">Hello, world!</div>
  </div>
  <script type="text/javascript">
    Vue.directive('mystyle', {
      bind: function (el, binding, vnode) {
        el.style.color = binding.value.color
        el.style.fontSize = binding.value.fontSize
      }
    })

    new Vue({
      el: '#app',
    })
  </script>
</body>
</html>
```

## Filters

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <input type="text" v-model="name">
    Letter count is: {{ name | countLetters }}
  </div>
  <script type="text/javascript">
    new Vue({
      el: '#app',
      data: {
        name: ''
      },
      filters: {
        countLetters: function (value) {
          return value.length
        }
      }
    })
  </script>
</body>
</html>
```

https://vuejs.org/v2/api/#Vue-filter