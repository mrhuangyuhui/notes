<!-- omit in toc -->
# Class 的基本语法

- [简介](#简介)
- [严格模式](#严格模式)
- [constructor 方法](#constructor-方法)
- [类的实例对象](#类的实例对象)
- [Class 表达式](#class-表达式)
- [不存在变量提升](#不存在变量提升)
- [私有方法和私有属性](#私有方法和私有属性)
- [this 的指向](#this-的指向)
- [name 属性](#name-属性)
- [Class 的取值函数（getter）和存值函数（setter）](#class-的取值函数getter和存值函数setter)
- [Class 的 Generator 方法](#class-的-generator-方法)
- [Class 的静态方法](#class-的静态方法)

<https://es6.ruanyifeng.com/#docs/class>

## 简介

JavaScript 语言中，生成实例对象的传统方法是通过构造函数。
```js
function Point(x, y) {
    this.x = x;
    this.y = y;
}

Point.prototype.toString = function () {
    return '(' + this.x + ', ' + this.y + ')';
};

var p = new Point(1, 2);
console.log(p.toString());
```

输出结果：
```
$ npx babel-node example.js
(1, 2)
```

ES6 的类，完全可以看作构造函数的另一种写法。
```js
class Point {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }

    toString() {
        return '(' + this.x + ', ' + this.y + ')';
    }
}

console.log(typeof Point)
console.log(Point === Point.prototype.constructor)
```

输出结果：
```
$ npx babel-node example.js
function
true
```
上面代码表明，类的数据类型就是函数，类本身就指向构造函数。

使用的时候，也是直接对类使用`new`命令，跟构造函数的用法完全一致。
```js
class Bar {
    doStuff() {
        console.log('stuff');
    }
}

var b = new Bar();
b.doStuff();
```

输出结果：
```
$ npx babel-node example.js
stuff
```

构造函数的`prototype`属性，在 ES6 的“类”上面继续存在。事实上，类的所有方法都定义在类的`prototype`属性上面。

```js
class Point {
  constructor() {
    // ...
  }

  toString() {
    // ...
  }

  toValue() {
    // ...
  }
}

// 等同于

Point.prototype = {
  constructor() {},
  toString() {},
  toValue() {},
};
```

在类的实例上面调用方法，其实就是调用原型上的方法。
```js
class B { }

let b = new B();
console.log(b.constructor === B.prototype.constructor);
```

输出结果：
```
$ npx babel-node example.js
true
```

由于类的方法都定义在`prototype`对象上面，所以类的新方法可以添加在`prototype`对象上面。`Object.assign`方法可以很方便地一次向类添加多个方法。
```js
class Point {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
}

Object.assign(Point.prototype, {
    toString() { return '(' + this.x + ', ' + this.y + ')'; }
})

var p = new Point(1, 2);
console.log(p.toString());
```

输出结果：
```
$ npx babel-node example.js
(1, 2)
```

- [Object.assign()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign)

类的内部所有定义的方法，都是不可枚举的（non-enumerable）。
```js
class Point {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }

    toString() {
        return '(' + this.x + ', ' + this.y + ')';
    }
}

console.log(Object.keys(Point.prototype));
console.log(Object.getOwnPropertyNames(Point.prototype));
```

输出结果：
```
$ npx babel-node example.js
[]
[ 'constructor', 'toString' ]
```

- [Object.keys()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys)
- [Object.getOwnPropertyNames()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyNames)

采用 ES5 的写法，`toString`方法就是可枚举的。
```js
function Point(x, y) {
    this.x = x;
    this.y = y;
}

Point.prototype.toString = function () {
    return '(' + this.x + ', ' + this.y + ')';
};

console.log(Object.keys(Point.prototype));
console.log(Object.getOwnPropertyNames(Point.prototype));
```

输出结果：
```
$ npx babel-node example.js
[ 'toString' ]
[ 'constructor', 'toString' ]
```

类的属性名，可以采用表达式。
```js
let methodName = 'getArea';

class Square {
    constructor(length) {
        this.length = length;
    }

    [methodName]() {
        return this.length * this.length;
    }
}

var s = new Square(10);
console.log(s.getArea());
```

输出结果：
```
$ npx babel-node example.js
100
```

## 严格模式

类和模块的内部，默认就是严格模式，所以不需要使用`use strict`指定运行模式。只要你的代码写在类或模块之中，就只有严格模式可用。

## constructor 方法

`constructor`方法是类的默认方法，通过`new`命令生成对象实例时，自动调用该方法。一个类必须有`constructor`方法，如果没有显式定义，一个空的`constructor`方法会被默认添加。

```js
class Point {
}

// 等同于
class Point {
  constructor() {}
}
```

`constructor`方法默认返回实例对象（即`this`），完全可以指定返回另外一个对象。
```js
class Foo {
  constructor() {
    return Object.create(null);
  }
}

console.log(new Foo() instanceof Foo);
```

输出结果：
```
$ npx babel-node example.js
false
```

类必须使用`new`调用，否则会报错。这是它跟普通构造函数的一个主要区别，后者不用`new`也可以执行。
```js
class Foo {
  constructor() {
    return Object.create(null);
  }
}

Foo(); // TypeError: Class constructor Foo cannot be invoked without 'new'
```

## 类的实例对象

生成类的实例对象的写法，与 ES5 完全一样，也是使用`new`命令。前面说过，如果忘记加上`new`，像函数那样调用`Class`，将会报错。

```js
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  toString() {
    return '(' + this.x + ', ' + this.y + ')';
  }
}

var point = new Point(2, 3);

// TypeError: Class constructor Point cannot be invoked without 'new'
var point = Point(2, 3);
```

与 ES5 一样，实例的属性除非显式定义在其本身（即定义在`this`对象上），否则都是定义在原型上（即定义在`class`上）。

```js
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  toString() {
    return '(' + this.x + ', ' + this.y + ')';
  }
}

var point = new Point(2, 3);

console.log(point.toString());

console.log(point.hasOwnProperty('x'));
console.log(point.hasOwnProperty('y'));
console.log(point.hasOwnProperty('toString'));

console.log(point.__proto__.hasOwnProperty('toString'));
```

输出结果：
```
$ npx babel-node example.js(2, 3)
true
true
false
true
```

与 ES5 一样，类的所有实例共享一个原型对象。

```js
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  toString() {
    return '(' + this.x + ', ' + this.y + ')';
  }
}

var p1 = new Point(2, 3);
var p2 = new Point(3, 2);

console.log(p1.__proto__ === p2.__proto__); // true
```

输出结果：
```
$ npx babel-node example.jstrue
```

这也意味着，可以通过实例的`__proto__`属性为“类”添加方法。

```js
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  toString() {
    return '(' + this.x + ', ' + this.y + ')';
  }
}

var p1 = new Point(2, 3);
var p2 = new Point(3, 2);

p1.__proto__.printName = function () { return 'Oops' };
// Object.getPrototypeOf(p1).printName = function () { return 'Oops' };

console.log(p1.printName())
console.log(p2.printName())

var p3 = new Point(4, 2);
console.log(p3.printName())
```

输出结果：
```
$ npx babel-node example.js
Oops
Oops
Oops
```

> `__proto__` 并不是语言本身的特性，这是各大厂商具体实现时添加的私有属性，虽然目前很多现代浏览器的 JS 引擎中都提供了这个私有属性，但依旧不建议在生产中使用该属性，避免对环境产生依赖。生产环境中，我们可以使用 `Object.getPrototypeOf` 方法来获取实例对象的原型，然后再来为原型添加方法/属性。

- [Object.getPrototypeOf()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getPrototypeOf)

## Class 表达式

与函数一样，类也可以使用表达式的形式定义。

```js
const MyClass = class Me {
  getClassName() {
    return Me.name;
  }
};

let myclass = new MyClass();
console.log(myclass.getClassName());
// console.log(Me.name); // ReferenceError: Me is not defined
```

输出结果：
```
$ npx babel-node example.js
Me
```

如果类的内部没用到的话，可以省略`Me`，也就是可以写成下面的形式。

```js
const MyClass = class { /* ... */ };
```

采用 Class 表达式，可以写出立即执行的 Class。

```js
let person = new class {
  constructor(name) {
    this.name = name;
  }

  sayName() {
    console.log(this.name);
  }
}('John');

person.sayName();
```

输出结果：
```
$ npx babel-node example.js
John
```
## 不存在变量提升

类不存在变量提升（hoist），这一点与 ES5 完全不同。

```js
new Foo(); // ReferenceError: Foo is not defined
class Foo { }
```

上面代码中，`Foo`类使用在前，定义在后，这样会报错，因为 ES6 不会把类的声明提升到代码头部。这种规定的原因与下文要提到的继承有关，必须保证子类在父类之后定义。

```js
{
  let Foo = class { };
  class Bar extends Foo {
  }
}
```

上面的代码不会报错，因为`Bar`继承`Foo`的时候，`Foo`已经有定义了。但是，如果存在`class`的提升，上面代码就会报错，因为`class`会被提升到代码头部，而`let`命令是不提升的，所以导致`Bar`继承`Foo`的时候，`Foo`还没有定义。【注：也就是子类 Bar 的定义会跑到父类 Foo 的定义前】

## 私有方法和私有属性

私有方法是常见需求，但 ES6 不提供，只能通过变通方法模拟实现。

一种做法是在命名上加以区别。

```js
class Widget {

  // 公有方法
  foo(baz) {
    this._bar(baz);
  }

  // 私有方法
  _bar(baz) {
    return this.snaf = baz;
  }
}
```

上面代码中，`_bar`方法前面的下划线，表示这是一个只限于内部使用的私有方法。但是，这种命名是不保险的，在类的外部，还是可以调用到这个方法。

另一种方法就是索性将私有方法移出模块，因为模块内部的所有方法都是对外可见的。

```js
class Widget {
  foo(baz) {
    bar.call(this, baz);
  }
}

function bar(baz) {
  return this.snaf = baz;
}
```

上面代码中，`foo`是公有方法，内部调用了`bar.call(this, baz)`。这使得`bar`实际上成为了当前模块的私有方法。

还有一种方法是利用`Symbol`值的唯一性，将私有方法的名字命名为一个`Symbol`值。

```js
const bar = Symbol('bar');
const snaf = Symbol('snaf');

export default class myClass {

  // 公有方法
  foo(baz) {
    this[bar](baz);
  }

  // 私有方法
  [bar](baz) {
    return this[snaf] = baz;
  }
};
```

上面代码中，`bar`和`snaf`都是`Symbol`值，导致第三方无法获取到它们，因此达到了私有方法和私有属性的效果。

## this 的指向

类的方法内部如果含有`this`，它默认指向类的实例。但是，必须非常小心，一旦单独使用该方法，很可能报错。

```js
class Logger {
  printName(name = 'there') {
    this.print(`Hello ${name}`);
  }

  print(text) {
    console.log(text);
  }
}

const logger = new Logger();
const { printName } = logger;
printName(); // TypeError: Cannot read property 'print' of undefined
```

上面代码中，`printName`方法中的`this`，默认指向`Logger`类的实例。但是，如果将这个方法提取出来单独使用，`this`会指向该方法运行时所在的环境，因为找不到`print`方法而导致报错。

一个比较简单的解决方法是，在构造方法中绑定`this`，这样就不会找不到`print`方法了。

```js
class Logger {
  constructor() {
    this.printName = this.printName.bind(this);
  }

  printName(name = 'there') {
    this.print(`Hello ${name}`);
  }

  print(text) {
    console.log(text);
  }
}

const logger = new Logger();
const { printName } = logger;
printName(); // Hello there
```

另一种解决方法是使用箭头函数。

```js
class Logger {
  constructor() {
    this.printName = (name = 'there') => {
      this.print(`Hello ${name}`);
    };
  }

  printName(name = 'there') {
    this.print(`Hello ${name}`);
  }

  print(text) {
    console.log(text);
  }
}

const logger = new Logger();
const { printName } = logger;
printName(); // Hello there
```

还有一种解决方法是使用`Proxy`，获取方法的时候，自动绑定`this`。

跳过（学完 Proxy 再回来）

## name 属性

由于本质上，ES6 的类只是 ES5 的构造函数的一层包装，所以函数的许多特性都被`Class`继承，包括`name`属性。

```js
class Point { }
console.log(Point.name); // Point
```

## Class 的取值函数（getter）和存值函数（setter）

与 ES5 一样，在“类”的内部可以使用`get`和`set`关键字，对某个属性设置存值函数和取值函数，拦截该属性的存取行为。

```js
class MyClass {
  constructor() {
  }
  get prop() {
    return 'getter';
  }
  set prop(value) {
    console.log('setter: ' + value);
  }
}

let inst = new MyClass();
inst.prop = 123; // setter: 123
console.log(inst.prop); // getter
```

存值函数和取值函数是设置在属性的 Descriptor 对象上的。

```js
class CustomHTMLElement {
  constructor(element) {
    this.element = element;
  }

  get html() {
    return this.element.innerHTML;
  }

  set html(value) {
    this.element.innerHTML = value;
  }
}

var descriptor = Object.getOwnPropertyDescriptor(
  CustomHTMLElement.prototype, "html"
);

console.log("get" in descriptor); // true
console.log("set" in descriptor); // true
```

## Class 的 Generator 方法

跳过（学完 Generator 函数后再回来）

## Class 的静态方法

类相当于实例的原型，所有在类中定义的方法，都会被实例继承。如果在一个方法前，加上`static`关键字，就表示该方法不会被实例继承，而是直接通过类来调用，这就称为“静态方法”。

```js
class Foo {
  static classMethod() {
    console.log("hello")
  }
}

Foo.classMethod(); // hello

var foo = new Foo();
foo.classMethod(); // TypeError: foo.classMethod is not a function
```

注意，如果静态方法包含`this`关键字，这个`this`指的是类，而不是实例。

```js
class Foo {
  static bar() {
    this.baz();
  }
  static baz() {
    console.log('hello');
  }
  baz() {
    console.log('world');
  }
}

Foo.bar(); // hello
```

上面代码中，静态方法`bar`调用了`this.baz`，这里的`this`指的是`Foo`类，而不是`Foo`的实例，等同于调用`Foo.baz`。另外，从这个例子还可以看出，静态方法可以与非静态方法重名。

父类的静态方法，可以被子类继承。

```js
class Foo {
  static classMethod() {
    console.log("hello");
  }
}

class Bar extends Foo {
}

Bar.classMethod(); // 'hello'
```

静态方法也是可以从`super`对象上调用的。

```js
class Foo {
  static classMethod() {
    return 'hello';
  }
}

class Bar extends Foo {
  static classMethod() {
    return super.classMethod() + ', too';
  }
}

console.log(Bar.classMethod()); // "hello, too"
```
