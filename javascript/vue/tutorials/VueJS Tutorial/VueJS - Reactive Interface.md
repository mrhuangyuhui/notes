# [VueJS - Reactive Interface](https://www.tutorialspoint.com/vuejs/vuejs_reactive_interface.htm)

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <p>Counter: {{ counter }}</p>
    <button @click="counter++">Click Me</button>
  </div>
  <script type="text/javascript">
    var app = new Vue({
      el: '#app',
      data: {
        counter: 1
      }
    })

    app.$watch('counter', function (newValue, oldValue) {
      console.log('Counter is incremented from ' + oldValue + ' to ' + newValue)
    })

    setTimeout(() => {
      app.counter = 20
    }, 2000)

  </script>
</body>
</html>
```

## `Vue.set`

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
    var myProduct = {id: 1, name: 'iPhone 7', price: 5299}
    var app = new Vue({
      el: '#app',
      data: {
        product: myProduct
      }
    })
    // 在控制台打印，看不到 get/set 方法。
    app.product.quantity = 1
    console.log(app)
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
    var myProduct = {id: 1, name: 'iPhone 7', price: 5299}
    var app = new Vue({
      el: '#app',
      data: {
        product: myProduct
      }
    })
    // 在控制台打印，可以看到有 get/set 方法。
    Vue.set(myProduct, 'quantity', 1)
    console.log(app)
  </script>
</body>
</html>
```

## `Vue.delete`

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
    var myProduct = {id: 1, name: 'iPhone 7', price: 5299}
    var app = new Vue({
      el: '#app',
      data: {
        product: myProduct
      }
    })
    Vue.delete(myProduct, 'price')
    console.log(app)
  </script>
</body>
</html>
```

# 复习结束