# [JavaScript Array](https://gitee.com/mrhuangyuhui/notes/blob/master/snippets/javascript/js-array.md)

## API

- [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)

## Notes

JavaScript 经典实例（第 2 版） [第 2 章 JavaScript 数组](https://gitee.com/mrhuangyuhui/notes/blob/master/books/javascript/js-cookbook-2e/ch02.md)

## Snippets

从前向后搜索数组

```js
var beasts = ['ant', 'bison', 'camel', 'duck', 'bison']
console.log(beasts.indexOf('bison')) // 1
// 从索引 2 开始搜索
console.log(beasts.indexOf('bison', 2)) // 4
// 没有搜索到返回 -1
console.log(beasts.indexOf('giraffe')) // -1
```

从后向前搜索数组

```js
var animals = ['Dodo', 'Tiger', 'Penguin', 'Dodo']
console.log(animals.lastIndexOf('Dodo')) // 3
console.log(animals.lastIndexOf('Tiger')) // 1

var numbers = [2, 5, 9, 2]
// 从索引 3 开始往前搜索
numbers.lastIndexOf(2, 3) // 3
// 从索引 2 开始往前搜索
numbers.lastIndexOf(2, 2) // 0
// 从倒数第二个开始往前搜索
numbers.lastIndexOf(2, -2) // 0
// 从倒数第一个开始往前搜索
numbers.lastIndexOf(2, -1) // 3
```

传入条件函数搜索数组

```js
var array1 = [5, 12, 8, 130, 44]
// 条件函数，搜索第一个大于 13 的元素。
function findFirstLargeNumber(element) {
    return element > 13
}
console.log(array1.findIndex(findFirstLargeNumber)) // 3
```

```js
const fruits = ["apple", "banana", "cantaloupe", "blueberries", "grapefruit"]
// 箭头函数
const index = fruits.findIndex(fruit => fruit === "blueberries")
console.log(index) // 3
console.log(fruits[index]) // blueberries
```

拼接数组

```js
var array1 = ['a', 'b', 'c']
var array2 = ['d', 'e', 'f']
console.log(array1.concat(array2)) // [ 'a', 'b', 'c', 'd', 'e', 'f' ]
```

删除或替换数组元素

```js
var months = ['Jan', 'March', 'April', 'June']
// 从索引为 1 的元素开始，删除 0 个元素，插入 1 个新元素。
// 相当于在索引 1 处插入一个元素
months.splice(1, 0, 'Feb')
console.log(months) // [ 'Jan', 'Feb', 'March', 'April', 'June' ]
// 从索引为 4 的元素开始，删除 1 个元素，插入 1 个新元素。
// 相当于替换索引为 4 的元素
months.splice(4, 1, 'May')
console.log(months) // ['Jan', 'Feb', 'March', 'April', 'May']
```

提取数组元素

```js
var animals = ['ant', 'bison', 'camel',
    'duck', 'elephant']
// 提取从索引 2 开始的所有元素 
console.log(animals.slice(2)) // [ 'camel', 'duck', 'elephant' ]
// 提取索引 2-3 的元素
console.log(animals.slice(2, 4)) // [ 'camel', 'duck' ]
// 提取索引 1-4 的元素
console.log(animals.slice(1, 5)) // [ 'bison', 'camel', 'duck', 'elephant' ]
```

映射数组

```js
var array1 = [1, 4, 9, 16]
const map1 = array1.map(x => x * 2)
console.log(map1) // [ 2, 8, 18, 32 ]
```

过滤数组

```js
var words = ['spray', 'limit', 'elite',
    'exuberant', 'destruction', 'present']
const result = words.filter(word => word.length > 6)
console.log(result) // [ 'exuberant', 'destruction', 'present' ]
```

验证数组

```js
function isBelowThreshold(currentValue) {
    return currentValue < 40
}

var array1 = [1, 30, 39, 29, 10, 13]
console.log(array1.every(isBelowThreshold)) // true

var array = [1, 2, 3, 4, 5]
var even = function (element) {
    return element % 2 === 0
}
console.log(array.some(even)) // true
```