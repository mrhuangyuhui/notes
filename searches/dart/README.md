# Dart Search

## Sourcegraph

<https://sourcegraph.com/users/mrhuangyuhui/settings>

```json
{
  "name": "搜索 Dart 代码",
  "value": "repo:^github.com/dart-lang/http$ lang:dart file:lib patterntype:regexp case:yes"
}
```

<https://sourcegraph.com/search?q=repo:%5Egithub.com/dart-lang/http%24+lang:dart+file:lib+example&case=yes&patternType=regexp>

## Chrome

chrome://settings/searchEngines

```
https://sourcegraph.com/search?q=repo:%5Egithub.com/dart-lang/http%24+lang:dart+file:lib+%s&case=yes&patternType=regexp
```

## Alfred

```
https://sourcegraph.com/search?q=repo:%5Egithub.com/dart-lang/http%24+lang:dart+file:lib+{query}&case=yes&patternType=regexp
```
