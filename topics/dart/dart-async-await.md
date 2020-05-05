# Dart - Async & Await

[Async | Language samples | Dart](https://dart.dev/samples#async)

> Avoid callback hell and make your code much more readable by using `async` and `await`.

```dart
const oneSecond = Duration(seconds: 1);
// ···
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}
```

The method above is equivalent to:

```dart
Future<void> printWithDelay(String message) {
  return Future.delayed(oneSecond).then((_) {
    print(message);
  });
}
```

[Asynchrony support | Language tour | Dart](https://dart.dev/guides/language/language-tour#asynchrony-support)

> The `async` and `await` keywords support asynchronous programming, **letting you write asynchronous code that looks similar to synchronous code**.

API

- <https://api.dart.dev/stable/dart-async/Future-class.html>
- <https://api.dart.dev/stable/dart-async/Stream-class.html>

[Asynchronous programming: futures, async, await | Dart](https://dart.dev/codelabs/async-await)
