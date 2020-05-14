# PHP - Namespaces

[PHP: Namespaces - Manual](https://www.php.net/manual/en/language.namespaces.php)

[PHP: Namespaces overview - Manual](https://www.php.net/manual/en/language.namespaces.rationale.php)

> In the PHP world, namespaces are designed to solve two problems that authors of libraries and applications encounter when creating re-usable code elements such as classes or functions:
>
> - Name collisions between code you create, and internal PHP classes/functions/constants or third-party classes/functions/constants.
> - Ability to alias (or shorten) Extra_Long_Names designed to alleviate the first problem, improving readability of source code.

[PHP: Defining namespaces - Manual](https://www.php.net/manual/en/language.namespaces.definition.php)

> Although any valid PHP code can be contained within a namespace, only the following types of code are affected by namespaces: classes (including abstracts and traits), interfaces, functions and constants.
>
> Namespaces are declared using the `namespace` keyword. A file containing a namespace must declare the namespace at the top of the file before any other code - with one exception: the `declare` keyword.

> The same namespace may be defined in multiple files.

[PHP: Defining multiple namespaces in the same file - Manual](https://www.php.net/manual/en/language.namespaces.definitionmultiple.php)

> It is strongly discouraged as a coding practice to combine multiple namespaces into the same file.

[PHP: Using namespaces: Basics - Manual](https://www.php.net/manual/en/language.namespaces.basics.php)

> One caveat: unqualified names for functions and constants will resolve to global functions and constants if the namespaced function or constant is not defined.

> Note that to access any global class, function or constant, a fully qualified name can be used, such as `\strlen()` or `\Exception` or `\INI_ALL`.

[PHP: Namespaces and dynamic language features - Manual](https://www.php.net/manual/en/language.namespaces.dynamic.php)

[PHP: `namespace` keyword and `__NAMESPACE__` constant - Manual](https://www.php.net/manual/en/language.namespaces.nsconstants.php)

[PHP: Using namespaces: Aliasing/Importing - Manual](https://www.php.net/manual/en/language.namespaces.importing.php)

> PHP 5.6+ also allows aliasing or importing function and constant names.

```php
// importing a function (PHP 5.6+)
use function My\Full\functionName;

// aliasing a function (PHP 5.6+)
use function My\Full\functionName as func;

// importing a constant (PHP 5.6+)
use const My\Full\CONSTANT;
```

> The `use` keyword must be declared in the outermost scope of a file (the global scope) or inside namespace declarations. This is because the importing is done at compile time and not runtime, so it cannot be block scoped.

```php
<?php
namespace Languages;

function toGreenlandic()
{
    // 报错
    use Languages\Danish;

    // ...
}
?>
```

> From PHP 7.0 onwards, classes, functions and constants being imported from the same namespace can be grouped together in a single `use` statement.

```php
// PHP 7+ code
use some\namespace\{ClassA, ClassB, ClassC as C};
use function some\namespace\{fn_a, fn_b, fn_c};
use const some\namespace\{ConstA, ConstB, ConstC};
```

[PHP: Global space - Manual](https://www.php.net/manual/en/language.namespaces.global.php)

> Prefixing a name with \ will specify that the name is required from the global space even in the context of the namespace.

[PHP: Using namespaces: fallback to global function/constant - Manual](https://www.php.net/manual/en/language.namespaces.fallback.php)

[PHP: Name resolution rules - Manual](https://www.php.net/manual/en/language.namespaces.rules.php)
