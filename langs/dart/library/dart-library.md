# Dart - Libraries

[Libraries and visibility | Language tour | Dart](https://dart.dev/guides/language/language-tour#libraries-and-visibility)

> Every Dart app is a library, even if it doesn’t use a `library` directive.

- [Using libraries](https://dart.dev/guides/language/language-tour#using-libraries)

> For built-in libraries, the URI has the special `dart:` scheme. For other libraries, you can use a file system path or the `package:` scheme. The `package:` scheme specifies libraries provided by a package manager such as the pub tool.

```dart
import 'dart:html';
import 'package:test/test.dart';
```

[Importing only part of a library](https://dart.dev/guides/language/language-tour#importing-only-part-of-a-library)

```dart
// Import only foo.
import 'package:lib1/lib1.dart' show foo;

// Import all names EXCEPT foo.
import 'package:lib2/lib2.dart' hide foo;
```

- [Implementing libraries](https://dart.dev/guides/language/language-tour#implementing-libraries)
