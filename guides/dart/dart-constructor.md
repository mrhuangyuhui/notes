# Dart - Constructor

<https://dart.dev/guides/language/language-tour#using-constructors>

<https://dart.dev/guides/language/language-tour#constructors>

<https://dart.dev/guides/language/language-tour#constant-constructors>

<https://dart.dev/guides/language/language-tour#named-constructors>

> By default, a constructor in a subclass calls the superclass’s unnamed, no-argument constructor. The superclass’s constructor is called at the beginning of the constructor body. If an initializer list is also being used, it executes before the superclass is called. In summary, the order of execution is as follows:
>
> - initializer list
> - superclass’s no-arg constructor
> - main class’s no-arg constructor
>
> If the superclass doesn’t have an unnamed, no-argument constructor, then you must manually call one of the constructors in the superclass. Specify the superclass constructor after a colon (:), just before the constructor body (if any).

> Warning: Arguments to the superclass constructor do not have access to this. For example, arguments can call static methods but not instance methods.
