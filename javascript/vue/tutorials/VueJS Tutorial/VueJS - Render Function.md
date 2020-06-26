# [VueJS - Render Function](https://www.tutorialspoint.com/vuejs/vuejs_render_function.htm)

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <my-component>Hello Jai</my-component>
    <my-component>Hello Roy</my-component>
    <my-component>Hello Ria</my-component>
    <my-component>Hello Ben</my-component>
  </div>
  <script type="text/javascript">
    Vue.component('my-component', {
      template: '<h1>Hello World</h1>'
    })

    new Vue({
      el: '#app'
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
    <my-component>Hello Jai</my-component>
    <my-component>Hello Roy</my-component>
    <my-component>Hello Ria</my-component>
    <my-component>Hello Ben</my-component>
  </div>
  <script type="text/javascript">
    Vue.component('my-component', {
      template: '<h1><slot></slot></h1>'
    })

    new Vue({
      el: '#app'
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
    <my-component :element-type="'div,red,25,div1'">Hello Jai</my-component>
    <my-component :element-type="'h3,green,25,h3tag'">Hello Roy</my-component>
    <my-component :element-type="'p,blue,25,ptag'">Hello Ria</my-component>
    <my-component :element-type="'div,green,25,divtag'">Hello Ben</my-component>
  </div>
  <script type="text/javascript">
    Vue.component('my-component', {
      props: {
        elementType: {
          attributes: String,
          required: true
        }
      },
      render: function (createElement) {
        var a = this.elementType.split(',')
        return createElement(a[0], {
          attrs: {
            id: a[3],
            style: "color: " + a[1] + "; font-size: " + a[2] + ";"
          }
        }, this.$slots.default)
      }
    })

    new Vue({
      el: '#app'
    })
  </script>
</body>
</html>
```

https://vuejs.org/v2/api/#render