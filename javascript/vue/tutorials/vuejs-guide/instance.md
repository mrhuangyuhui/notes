# [Vue 实例](https://cn.vuejs.org/v2/guide/instance.html)

## 数据与方法

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>

</body>

<script type="text/javascript">
    var data = { a: 1 }
    var vm = new Vue({
        data: data
    })
    // 他们引用相同的对象！
    console.log(vm.a === data.a) // true

    // 设置属性也会影响到原始数据
    vm.a = 2
    console.log(data.a) // 2

    // ... 反之亦然
    data.a = 3
    console.log(vm.a) // 3
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
    <div id="example"></div>
</body>

<script type="text/javascript">
    var data = { a: 1 }
    var vm = new Vue({
        el: '#example',
        data: data
    })

    console.log(vm.$data === data) // true
    console.log(vm.$el === document.getElementById('example')) // true

    vm.$watch('a', function (newValue, oldValue) {
        console.log('newValue: ' + newValue + ' oldValue: ' + oldValue)
    })
</script>

</html>
```

## 实例生命周期钩子

```html
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>

<body>

</body>

<script type="text/javascript">
    new Vue({
        data: {
            a: 1
        },
        created: function () {
            console.log('a is: ' + this.a)
        }
    })
</script>

</html>
```
