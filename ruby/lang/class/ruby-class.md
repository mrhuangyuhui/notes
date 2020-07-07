# Ruby - Classes

[Classes](https://ruby-doc.org/core-2.7.1/doc/syntax/modules_and_classes_rdoc.html#label-Classes)

> Every class is also a module, but unlike modules **a class may not be mixed-in to another module (or class)**.

> A class also inherits methods and constants from its superclass.

[Defining a class](https://ruby-doc.org/core-2.7.1/doc/syntax/modules_and_classes_rdoc.html#label-Defining+a+class)

> If you do not supply a superclass your new class will inherit from [`Object`](https://ruby-doc.org/core-2.7.1/Object.html).

> There is a special class [`BasicObject`](https://ruby-doc.org/core-2.7.1/BasicObject.html) which is designed as a blank class and includes a minimum of built-in methods.

[Inheritance](https://ruby-doc.org/core-2.7.1/doc/syntax/modules_and_classes_rdoc.html#label-Inheritance)

[Singleton Classes](https://ruby-doc.org/core-2.7.1/doc/syntax/modules_and_classes_rdoc.html#label-Singleton+Classes)

API

- [`Object`](https://ruby-doc.org/core-2.7.1/Object.html)
- [`BasicObject`](https://ruby-doc.org/core-2.7.1/BasicObject.html)

## Ruby 基础教程（第 5 版）

> 类名的首字母必须大写

> 在 class 语句中定义的方法为该类的实例方法。代码清单 8.1 的 hello 方法就是实例方法。
其中，名为 initialize 的方法比较特别。使用 new 方法生成新的对象时，initialize 方 法会被调用，同时 new 方法的参数也会被原封不动地传给 initialize 方法。因此初始化对象 时需要的处理一般都写在这个方法中。

> 我们 把以 @ 开头的变量称为实例变量。

> 引用未初始化的实例变量时的返回值为 nil。

> 在 Ruby 中，从对象外部不能直接访问实例变量或对实例变量赋值，需要通过方法来访问对 象的内部。
>
> 当对象有多个实例变量时，如果逐个定义存取器，就会使程序变得难懂，而且也容易写错。为 此，Ruby 为我们提供了更简便的定义方法 attr_reader、attr_writer、attr_accessor
(表 8.1)。只要指定实例变量名的符号，Ruby 就会自动帮我们定义相应的存取器。

> 在实例方法中，可以用 self 这个特殊的变量来引用方法的接收者。

> 调用方法时，如果省略了接收者，Ruby 就会默认把 self 作为该方法的接收者。

类变量

> 以 @@ 开头的变量称为类变量。类变量是该类所有实例的共享变量，这一点与常量类似，不 同的是我们可以多次修改类变量的值。另外，与实例变量一样，从类的外部访问类变量时也需 要存取器。不过，由于 attr_accessor 等存取器都不能使用，因此需要直接定义。

限制方法的调用

> Ruby 提供了 3 种方法的访问级别，我们可以按照需要来灵活调整。
> ● public......以实例方法的形式向外部公开该方法
> ● private......在指定接收者的情况下不能调用该方法(只能使用缺省接收者的方式调用该
方法，因此无法从实例的外部访问)
> ● protected......在同一个类中时可将该方法作为实例方法调用

> 没有指定访问级别的方法默认为 public，但 initialize 方法是个例外，它通常会被定义为 private。

在原有类的基础上添加方法

> Ruby 允许我们在已经定义好的类中添加方法。

