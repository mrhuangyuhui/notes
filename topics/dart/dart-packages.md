# Dart - Packages

<https://pub.dev/> | [CN](https://pub.flutter-io.cn/)

[Application package | Glossary of package terms](https://dart.dev/tools/pub/glossary#application-package)

[Library package | Glossary of package terms](https://dart.dev/tools/pub/glossary#library-package)

[How to use packages](https://dart.dev/guides/packages) | [如何使用 package](https://dart.cn/guides/packages)

[Commonly used packages](https://dart.dev/guides/libraries/useful-libraries) | [常用 package 介绍](https://dart.cn/guides/libraries/useful-libraries)

[Creating packages](https://dart.dev/guides/libraries/create-library-packages) | [创建 package](https://dart.cn/guides/libraries/create-library-packages)

- What makes a library package

> As you might expect, the library code lives under the `lib` directory and is public to other packages. You can create any hierarchy under `lib`, as needed. By convention, implementation code is placed under `lib/src`. Code under `lib/src` is considered private; other packages should never need to import `src/...`. To make APIs under `lib/src` public, you can export `lib/src` files from a file that’s directly under `lib`.

- Organizing a library package

> Library packages are easiest to maintain, extend, and test when you create small, individual libraries, referred to as mini libraries. In most cases, **each class should be in its own mini library**, unless you have a situation where two classes are tightly coupled.
>
> > Note: You may have heard of the `part` directive, which allows you to split a library into multiple Dart files. We recommend that you avoid using `part` and create mini libraries instead.
>
> Create a “main” library file directly under `lib`, `lib/<package-name>.dart`, that exports all of the public APIs. This allows the user to get all of a library’s functionality by importing a single file.

- Importing library files

> You can import a library using a relative path when both files are inside of `lib`, or when both files are outside of `lib`. However, you must use `package:` when importing a file that reaches inside, or outside, of `lib`. When in doubt, use the `package:` directive; it works in all cases.

[Publishing packages](https://dart.dev/tools/pub/publishing) | [发布 package](https://dart.cn/tools/pub/publishing)

[Package dependencies](https://dart.dev/tools/pub/dependencies) | [Package 依赖](https://dart.cn/tools/pub/dependencies)

## Commands



## `pubspec.yaml`

[The pubspec file](https://dart.dev/tools/pub/pubspec) | [Pubspec 文件](https://dart.cn/tools/pub/pubspec)

Examples: <https://gitee.com/mrhuangyuhui/shelf/blob/0.7.5/pubspec.yaml>

## Examples

<https://pub.dev/packages/shelf> | [CN](https://pub.flutter-io.cn/packages/shelf) | [GitHub](https://github.com/dart-lang/shelf) | [Gitee](https://gitee.com/mrhuangyuhui/shelf)
