# VueJS - Routing

https://router.vuejs.org/zh-cn/api/router-link.html \
https://router.vuejs.org/zh-cn/api/router-view.html \
https://router.vuejs.org/zh-cn/api/options.html#routes

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
  <script src="https://unpkg.com/vue-router"></script>
</head>
<body>
  <div id="app">
    <p>
      <router-link to="/route1">Router Link 1</router-link>
      <router-link to="/route2">Router Link 2</router-link>
      <router-view></router-view>
    </p>
  </div>
  <script type="text/javascript">
    const Route1 = { template: '<div style="border-radius: 20px; background-color: cyan; width: 200px; height: 50px; margin: 10px; font-size: 25px; padding: 10px;">This is router 1</div>' }
    const Route2 = { template: '<div style="border-radius: 20px; background-color: green; width: 200px; height: 50px; margin: 10px; font-size: 25px; padding: 10px;">This is router 2</div>' }
    const routes = [
      { path: '/route1', component: Route1 },
      { path: '/route2', component: Route2 },
    ]
    const router = new VueRouter({
      routes
    })
    new Vue({
      el: '#app',
      router
    })
  </script>
</body>
</html>
```

## Props for Router Link

### `to`
```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
  <script src="https://unpkg.com/vue-router"></script>
</head>
<body>
  <div id="app">
    <p>
      <router-link v-bind:to="{ path: '/route1' }">Router Link 1</router-link>
      <router-link v-bind:to="{ path: '/route2', query: { name: 'Terry' } }">Router Link 2</router-link>
      <router-view></router-view>
    </p>
  </div>
  <script type="text/javascript">
    const Route1 = { template: '<div style="border-radius: 20px; background-color: cyan; width: 200px; height: 50px; margin: 10px; font-size: 25px; padding: 10px;">This is router 1</div>' }
    const Route2 = { template: '<div style="border-radius: 20px; background-color: green; width: 200px; height: 50px; margin: 10px; font-size: 25px; padding: 10px;">This is router 2</div>' }
    const routes = [
      { path: '/route1', component: Route1 },
      { path: '/route2', component: Route2 },
    ]
    const router = new VueRouter({
      routes
    })
    new Vue({
      el: '#app',
      router
    })
  </script>
</body>
</html>
```

### `replace`

略

### `append`

略

### `tag`
```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
  <script src="https://unpkg.com/vue-router"></script>
</head>
<body>
  <div id="app">
    <p>
      <router-link to="/route1" tag="span">Router Link 1</router-link>
      <router-link to="/route2" tag="span">Router Link 2</router-link>
      <router-view></router-view>
    </p>
  </div>
  <script type="text/javascript">
    const Route1 = { template: '<div style="border-radius: 20px; background-color: cyan; width: 200px; height: 50px; margin: 10px; font-size: 25px; padding: 10px;">This is router 1</div>' }
    const Route2 = { template: '<div style="border-radius: 20px; background-color: green; width: 200px; height: 50px; margin: 10px; font-size: 25px; padding: 10px;">This is router 2</div>' }
    const routes = [
      { path: '/route1', component: Route1 },
      { path: '/route2', component: Route2 },
    ]
    const router = new VueRouter({
      routes
    })
    new Vue({
      el: '#app',
      router
    })
  </script>
</body>
</html>
```

### `active-class`

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
  <script src="https://unpkg.com/vue-router"></script>
  <style>
    ._active {
      background-color: red;
    }
  </style>
</head>
<body>
  <div id="app">
    <p>
      <router-link to="/route1" active-class="_active">Router Link 1</router-link>
      <router-link to="/route2">Router Link 2</router-link>
      <router-view></router-view>
    </p>
  </div>
  <script type="text/javascript">
    const Route1 = { template: '<div style="border-radius: 20px; background-color: cyan; width: 200px; height: 50px; margin: 10px; font-size: 25px; padding: 10px;">This is router 1</div>' }
    const Route2 = { template: '<div style="border-radius: 20px; background-color: green; width: 200px; height: 50px; margin: 10px; font-size: 25px; padding: 10px;">This is router 2</div>' }
    const routes = [
      { path: '/route1', component: Route1 },
      { path: '/route2', component: Route2 },
    ]
    const router = new VueRouter({
      routes
    })
    new Vue({
      el: '#app',
      router
    })
  </script>
</body>
</html>
```

### `exact-active-class`

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
  <script src="https://unpkg.com/vue-router"></script>
  <style>
    ._active {
      background-color: red;
    }
  </style>
</head>
<body>
  <div id="app">
    <p>
      <router-link to="/route1" exact-active-class="_active">Router Link 1</router-link>
      <router-link to="/route2">Router Link 2</router-link>
      <router-view></router-view>
    </p>
  </div>
  <script type="text/javascript">
    const Route1 = { template: '<div style="border-radius: 20px; background-color: cyan; width: 200px; height: 50px; margin: 10px; font-size: 25px; padding: 10px;">This is router 1</div>' }
    const Route2 = { template: '<div style="border-radius: 20px; background-color: green; width: 200px; height: 50px; margin: 10px; font-size: 25px; padding: 10px;">This is router 2</div>' }
    const routes = [
      { path: '/route1', component: Route1 },
      { path: '/route2', component: Route2 },
    ]
    const router = new VueRouter({
      routes
    })
    new Vue({
      el: '#app',
      router
    })
  </script>
</body>
</html>
```

### `event`

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
  <script src="https://unpkg.com/vue-router"></script>
  <style>
    ._active {
      background-color: red;
    }
  </style>
</head>
<body>
  <div id="app">
    <p>
      <router-link to="/route1" exact-active-class="_active" event="mouseover">Router Link 1</router-link>
      <router-link to="/route2">Router Link 2</router-link>
      <router-view></router-view>
    </p>
  </div>
  <script type="text/javascript">
    const Route1 = { template: '<div style="border-radius: 20px; background-color: cyan; width: 200px; height: 50px; margin: 10px; font-size: 25px; padding: 10px;">This is router 1</div>' }
    const Route2 = { template: '<div style="border-radius: 20px; background-color: green; width: 200px; height: 50px; margin: 10px; font-size: 25px; padding: 10px;">This is router 2</div>' }
    const routes = [
      { path: '/route1', component: Route1 },
      { path: '/route2', component: Route2 },
    ]
    const router = new VueRouter({
      routes
    })
    new Vue({
      el: '#app',
      router
    })
  </script>
</body>
</html>
```