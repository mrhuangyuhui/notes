# [Object Oriented Programming in PHP](https://www.tutorialspoint.com/php/php_object_oriented.htm)

## Interfaces

```php
interface Mail {
   public function sendMail();
}

class Report implements Mail {
   // sendMail() Definition goes here
}
```

## Constants

```php
class MyClass {
   const requiredMargin = 1.7;

   function __construct($incomingValue) {
      // Statements here run every time
      // an instance of the class
      // is created.
   }
}
```

## Static Keyword

```php
<?php
   class Foo {
      public static $my_static = 'foo';

      public function staticValue() {
         return self::$my_static;
      }
   }

   print Foo::$my_static . "\n";
   $foo = new Foo();

   print $foo->staticValue() . "\n";
?>
```

## Final Keyword

```php
<?php

   class BaseClass {
      public function test() {
         echo "BaseClass::test() called<br>";
      }

      final public function moreTesting() {
         echo "BaseClass::moreTesting() called<br>";
      }
   }

   class ChildClass extends BaseClass {
      public function moreTesting() {
         echo "ChildClass::moreTesting() called<br>";
      }
   }
?>
```