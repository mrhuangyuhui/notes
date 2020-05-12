# Dart - Constructors

[Using constructors - Language tour | Dart](https://dart.dev/guides/language/language-tour#using-constructors)

> Constructor names can be either `ClassName` or `ClassName.identifier`.

[Constructors - Language tour | Dart](https://dart.dev/guides/language/language-tour#constructors)

> If you don’t declare a constructor, a default constructor is provided for you. The default constructor has no arguments and invokes the no-argument constructor in the superclass.

> Subclasses don’t inherit constructors from their superclass. A subclass that declares no constructors has only the default (no argument, no name) constructor.

[Constant constructors | Language tour | Dart](https://dart.dev/guides/language/language-tour#constant-constructors)

[Named constructors - Language tour | Dart](https://dart.dev/guides/language/language-tour#named-constructors)

> Remember that constructors are not inherited, which means that a superclass’s named constructor is not inherited by a subclass. If you want a subclass to be created with a named constructor defined in the superclass, you must implement that constructor in the subclass.

[Invoking a non-default superclass constructor - Language tour | Dart](https://dart.dev/guides/language/language-tour#invoking-a-non-default-superclass-constructor)

> By default, a constructor in a subclass calls the superclass’s unnamed, no-argument constructor. The superclass’s constructor is called at the beginning of the constructor body. If an initializer list is also being used, it executes before the superclass is called. In summary, the order of execution is as follows:
>
> - initializer list
> - superclass’s no-arg constructor
> - main class’s no-arg constructor
>
> If the superclass doesn’t have an unnamed, no-argument constructor, then you must manually call one of the constructors in the superclass. Specify the superclass constructor after a colon (`:`), just before the constructor body (if any).

> Warning: Arguments to the superclass constructor do not have access to `this`. For example, arguments can call static methods but not instance methods.
