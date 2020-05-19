# Dart - `import ... if ...`

[Conditionally importing and exporting library files](https://dart.dev/guides/libraries/create-library-packages#conditionally-importing-and-exporting-library-files)

> **Note**: The conditional import or export checks only whether the library is available for use on the current platform, not whether it’s actually imported or used.

> All of the conditionally exported libraries must implement the same API.

## Examples

<https://github.com/dart-lang/http/blob/4681792615d4b9def5df274c03bd16a776e6b230/lib/src/client.dart#L12>

<https://github.com/dart-lang/http/blob/4681792615d4b9def5df274c03bd16a776e6b230/lib/src/multipart_file.dart#L12>
