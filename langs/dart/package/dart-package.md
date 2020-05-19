<!-- omit in toc -->
# Dart - Packages

- [How to use packages](#how-to-use-packages)
- [Commonly used packages](#commonly-used-packages)
- [Creating packages](#creating-packages)
  - [What makes a library package](#what-makes-a-library-package)
  - [Organizing a library package](#organizing-a-library-package)
  - [Importing library files](#importing-library-files)
  - [Conditionally importing and exporting library files](#conditionally-importing-and-exporting-library-files)
- [Publishing packages](#publishing-packages)
- [`pubspec.yaml`](#pubspecyaml)
- [Examples](#examples)

<https://pub.dev/> | [CN](https://pub.flutter-io.cn/)

[Application package | Glossary of package terms](https://dart.dev/tools/pub/glossary#application-package)

[Library package | Glossary of package terms](https://dart.dev/tools/pub/glossary#library-package)

## How to use packages

<https://dart.dev/guides/packages>

## Commonly used packages

<https://dart.dev/guides/libraries/useful-libraries>

## Creating packages

<https://dart.dev/guides/libraries/create-library-packages>

### What makes a library package

> As you might expect, the library code lives under the `lib` directory and is public to other packages. You can create any hierarchy under `lib`, as needed. By convention, implementation code is placed under `lib/src`. Code under `lib/src` is considered private; other packages should never need to import `src/...`. To make APIs under `lib/src` public, you can export `lib/src` files from a file that’s directly under `lib`.

### Organizing a library package

> Library packages are easiest to maintain, extend, and test when you create small, individual libraries, referred to as mini libraries. In most cases, **each class should be in its own mini library**, unless you have a situation where two classes are tightly coupled.
>
> > Note: You may have heard of the `part` directive, which allows you to split a library into multiple Dart files. We recommend that you avoid using `part` and create mini libraries instead.
>
> Create a “main” library file directly under `lib`, `lib/<package-name>.dart`, that exports all of the public APIs. This allows the user to get all of a library’s functionality by importing a single file.

### Importing library files

> You can import a library using a relative path when both files are inside of `lib`, or when both files are outside of `lib`. However, you must use `package:` when importing a file that reaches inside, or outside, of `lib`. When in doubt, use the `package:` directive; it works in all cases.

### Conditionally importing and exporting library files

[`langs/dart/keywords/dart-import-if.md`](/langs/dart/keywords/dart-import-if.md)

## Publishing packages

<https://dart.dev/tools/pub/publishing>

[Package dependencies](https://dart.dev/tools/pub/dependencies)

## `pubspec.yaml`

[The pubspec file](https://dart.dev/tools/pub/pubspec) | [Pubspec 文件](https://dart.cn/tools/pub/pubspec)

Examples: <https://gitee.com/mrhuangyuhui/shelf/blob/0.7.5/pubspec.yaml>

## Examples

<https://pub.dev/packages/shelf> | [CN](https://pub.flutter-io.cn/packages/shelf) | [GitHub](https://github.com/dart-lang/shelf) | [Gitee](https://gitee.com/mrhuangyuhui/shelf)
