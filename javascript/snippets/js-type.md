# JavaScript Type

判断变量的类型

```js
if (typeof name == 'string') {
    return "Hi, " + name + "!";
}
```

判断变量是否某个类的实例

```js
var hello = function (name) {
    return "Hi, " + name
}
console.log("Is 'hello' a Function instance? " + (hello instanceof Function))
console.log("Is 'hello' an Object instance? " + (hello instanceof Object))
console.log(hello)
```