# Dart - Final and const

[Final and const - Language tour | Dart](https://dart.dev/guides/language/language-tour#final-and-const)

> A const variable is a compile-time constant.

> **Note**: Instance variables can be `final` but not `const`. Final instance variables must be initialized before the constructor body starts — at the variable declaration, by a constructor parameter, or in the constructor’s initializer list.

> If the const variable is at the class level, mark it `static const`.

> The `const` keyword isn’t just for declaring **constant variables**. You can also use it to create **constant values**, as well as to declare constructors that create constant values. Any variable can have a constant value.

[DON’T use `const` redundantly. - Effective Dart: Usage | Dart](https://dart.dev/guides/language/effective-dart/usage#dont-use-const-redundantly)