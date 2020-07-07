# Ruby - Inheritance

<https://ruby-doc.org/core-2.7.1/doc/syntax/modules_and_classes_rdoc.html#label-Inheritance>

## Ruby 基础教程（第 5 版）

> 利用继承，我们可以在不修改已有的类的前提下，通过增加 新功能或重定义已有功能等来创建新的类。

> 程序通过 super 关键字调用父类中同名的方 法(在本例中也就是 Array#[])。

> 定义类时没有指定父类的情况下，Ruby 会默认该类为 Object 类的子类。
Object 类提供了很多便于实际编程的方法。但在某些情况下，我们也有可能会希望使用更
轻量级的类，而这时就可以使用 BasicObject 类。
> BasicObject 类只提供了作为 Ruby 对象的最低限度的方法。

> 与 Object 类不同，需要明确指定 BasicObject 类为父类

