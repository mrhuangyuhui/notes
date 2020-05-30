# Dart - Constructors

[Using constructors - Language tour | Dart](https://dart.dev/guides/language/language-tour#using-constructors)

[Constructors - Language tour | Dart](https://dart.dev/guides/language/language-tour#constructors)

Constructors aren’t inherited

> Subclasses don’t inherit constructors from their superclass. A subclass that declares no constructors has only the default (no argument, no name) constructor.

Invoking a non-default superclass constructor

> By default, a constructor in a subclass calls the superclass’s unnamed, no-argument constructor. The superclass’s constructor is called at the beginning of the constructor body. If an initializer list is also being used, it executes before the superclass is called. In summary, the order of execution is as follows:
>
> 1. initializer list
> 1. superclass’s no-arg constructor
> 1. main class’s no-arg constructor
>
> If the superclass doesn’t have an unnamed, no-argument constructor, then you must manually call one of the constructors in the superclass. Specify the superclass constructor after a colon (`:`), just before the constructor body (if any).
