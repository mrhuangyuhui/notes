# PHP - Namespaces

[命名空间](https://www.php.net/manual/zh/language.namespaces.php)

[命名空间概述](https://www.php.net/manual/zh/language.namespaces.rationale.php)

> 在PHP中，命名空间用来解决在编写类库或应用程序时创建可重用的代码如类或函数时碰到的两类问题：
>
> - 用户编写的代码与PHP内部的类/函数/常量或第三方类/函数/常量之间的名字冲突。
> - 为很长的标识符名称(通常是为了缓解第一类问题而定义的)创建一个别名（或简短）的名称，提高源代码的可读性。

[定义命名空间](https://www.php.net/manual/zh/language.namespaces.definition.php)

> 虽然任意合法的PHP代码都可以包含在命名空间中，但只有以下类型的代码受命名空间的影响，它们是：类（包括抽象类和traits）、接口、函数和常量。

> 同一个命名空间可以定义在多个文件中，即允许将同一个命名空间的内容分割存放在不同的文件中。

[在同一个文件中定义多个命名空间](https://www.php.net/manual/zh/language.namespaces.definitionmultiple.php)

> 在实际的编程实践中，非常不提倡在同一个文件中定义多个命名空间。

[使用命名空间：基础](https://www.php.net/manual/zh/language.namespaces.basics.php)

> 警告：如果命名空间中的函数或常量未定义，则该非限定的函数名称或常量名称会被解析为全局函数名称或常量名称。

> 注意：访问任意全局类、函数或常量，都可以使用完全限定名称，例如 \strlen() 或 \Exception 或 \INI_ALL。

[命名空间和动态语言特征](https://www.php.net/manual/zh/language.namespaces.dynamic.php)

[`namespace` 关键字和 `__NAMESPACE__` 常量](https://www.php.net/manual/zh/language.namespaces.nsconstants.php)

> 常量 `__NAMESPACE__` 的值是包含当前命名空间名称的字符串。在全局的，不包括在任何命名空间中的代码，它包含一个空的字符串。

[使用命名空间：别名/导入](https://www.php.net/manual/zh/language.namespaces.importing.php)

[全局空间](https://www.php.net/manual/zh/language.namespaces.global.php)

> 在名称前加上前缀 \ 表示该名称是全局空间中的名称

[使用命名空间：后备全局函数/常量](https://www.php.net/manual/zh/language.namespaces.fallback.php)

> 类名称总是解析到当前命名空间中的名称。

> 对于**函数和常量**来说，如果当前命名空间中不存在该函数或常量，PHP 会退而使用全局空间中的函数或常量。

[名称解析规则](https://www.php.net/manual/zh/language.namespaces.rules.php)
