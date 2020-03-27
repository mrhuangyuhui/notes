# PHP 类和对象

定义一个类

```php
<?php
class myCar {
    public $color = "silver";
    public $make = "Mazda";
    public $model = "Protege5";
}

$car = new myCar();
echo "I drive a: $car->color $car->make $car->model<br/>";
// 改变对象的属性
$car->color = "red";
$car->make = "Porsche";
$car->model = "Boxter";
echo "I drive a: $car->color $car->make $car->model";
?>
```

定义类的方法

```php
<?php
class myClass {
    public $name = "Jimbo";
    function sayHello() {
        echo "HELLO! My name is $this->name.";
    }
}

$object1 = new myClass();
$object1->sayHello();
?>
```

在类的方法中访问属性

```php
<?php
class myClass {
    public $name = "Jimbo";

    function setName($name) {
        $this->name = $name;
    }
    function sayHello() {
        echo "HELLO! My name is $this->name.";
    }
}

$object1 = new myClass();
$object1->sayHello();
echo "<br/>";
$object1->setName("Julie");
$object1->sayHello();
?>
```

类的继承

```php
<?php
class myClass {
    public $name = "Matt";

    function myClass($n) {
        $this->name = $n;
    }

    function sayHello() {
        echo "HELLO! My name is $this->name.";
    }
}

class childClass extends myClass {
    //
}

$object1 = new childClass("Baby Matt");
$object1->sayHello();
?>
```

重写父类的方法

```php
<?php
class myClass {
    public $name = "Matt";

    function myClass($n) {
        $this->name = $n;
    }

    function sayHello() {
        echo "HELLO! My name is $this->name.";
    }
}

class childClass extends myClass {
    // 重写父类的方法
    function sayHello() {
        echo "I will not tell you my name.";
    }
}

$object1 = new childClass("Baby Matt");
$object1->sayHello();
?>
```