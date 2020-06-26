# [VueJS - Rendering](https://www.tutorialspoint.com/vuejs/vuejs_rendering.htm)

## Conditional Rendering

`v-if`
```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <button v-on:click="toggleShow">Toggle Show</button> {{ show }}
    <h3 v-if="show">Hello, world!</h3>
  </div>
  <script type="text/javascript">
    new Vue({
      el: '#app',
      data: {
        show: true
      },
      methods: {
        toggleShow: function () {
          this.show = !this.show
        }
      }
    })
  </script>
</body>
</html>
```

`v-else`
```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <button v-on:click="toggleShow">Toggle Show</button> {{ show }}
    <h3 v-if="show">foo</h3>
    <h3 v-else>bar</h3>
  </div>
  <script type="text/javascript">
    new Vue({
      el: '#app',
      data: {
        show: true
      },
      methods: {
        toggleShow: function () {
          this.show = !this.show
        }
      }
    })
  </script>
</body>
</html>
```

`v-show`
```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <button v-on:click="toggleShow">Toggle Show</button> {{ show }}
    <h3 v-show="show">Hello, world!</h3>
  </div>
  <script type="text/javascript">
    new Vue({
      el: '#app',
      data: {
        show: true
      },
      methods: {
        toggleShow: function () {
          this.show = !this.show
        }
      }
    })
  </script>
</body>
</html>
```

## List Rendering

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <input type="text" v-on:keyup.enter="addItem" placeholder="Enter Fruits Names">
    <h3 v-if="fruits.length > 0">Display Fruits Name</h3>
    <ul>
      <li v-for="(item, index) in fruits">{{ index }}/ {{ item }}</li>
    </ul>
  </div>
  <script type="text/javascript">
    new Vue({
      el: '#app',
      data: {
        fruits: []
      },
      methods: {
        addItem: function (e) {
          this.fruits.push(e.target.value)
          e.target.value = ''
        }
      }
    })
  </script>
</body>
</html>
```