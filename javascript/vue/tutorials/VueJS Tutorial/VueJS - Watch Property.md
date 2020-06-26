# [VueJS - Watch Property](https://www.tutorialspoint.com/vuejs/vuejs_watch_property.htm)

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        Kilometers: <input type="text" v-model="kilometers">
        Meters: <input type="text" v-model="meters">
        <br>
        <h1>Kilometers: {{ kilometers }}</h1>
        <h1>Meters: {{ meters }}</h1>
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                kilometers: 0,
                meters: 0
            },
            watch: {
                kilometers: function (val) {
                    this.meters = val * 1000
                },
                meters: function (val) {
                    this.kilometers = val / 1000
                }
            }
        })
    </script>
</body>
</html>
```