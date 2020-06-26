# [VueJS - Mixins](https://www.tutorialspoint.com/vuejs/vuejs_mixins.htm)

https://vuejs.org/v2/api/#mixins

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
    var mixin = {
      created: function () {
        this.foo()
      },
      methods: {
        foo: function () {
          alert('Hello, world!')
        }
      }
    }

    var Component = Vue.extend({
      mixins: [mixin]
    })
    var component = new Component()
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
  </div>
  <script type="text/javascript">
    var mixin = {
      created: function () {
        console.log('Mixin called')
      },
    }

    new Vue({
      mixins: [mixin],
      created: function () {
        console.log('Component called')
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
  </div>
  <script type="text/javascript">
    var mixin = {
      methods: {
        mixinMethod: function () {
          console.log('Mixin Method')
        },
        sameMethod: function () {
          console.log('Same Method from Mixin')
        }
      }
    }

    var app = new Vue({
      mixins: [mixin],
      methods: {
        componentMethod: function () {
          console.log('Component Method')
        },
        sameMethod: function () {
          console.log('Same Method from Component')
        }
      }
    })

    app.mixinMethod()
    app.componentMethod()
    app.sameMethod()
  </script>
</body>
</html>
```