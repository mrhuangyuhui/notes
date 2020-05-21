# TODO

http

```dart
// throw
throw ClientException('$message.', _fromUriOrString(url));
```

```dart
// is, as
Uri _fromUriOrString(uri) => uri is String ? Uri.parse(uri) : uri as Uri;
```

```dart
// cast
request.bodyBytes = body.cast<int>();
```
