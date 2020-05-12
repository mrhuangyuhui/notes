# Sourcegraph Manual

<https://sourcegraph.com/search>

<https://docs.sourcegraph.com/>

<https://docs.sourcegraph.com/user/search>

[Search pattern syntax](https://docs.sourcegraph.com/user/search/queries)

<https://sourcegraph.com/users/mrhuangyuhui/settings>

```json
{
  "typescript.accessToken": "f58c28a5848379c2185a1fdf7f6cafbb9e81c728",
  "codeHost.useNativeTooltips": true,
  "search.scopes": [
    {
      "name": "搜索 PHP 代码",
      "value": "repo:^github.com/laravel/framework$|^github.com/laravel/lumen-framework$|^github.com/composer/composer$ lang:php patterntype:regexp case:yes"
    },
    {
      "name": "搜索 Python 代码",
      "value": "repo:^github.com/pallets/flask$|^github.com/django/django$|^github.com/scrapy/scrapy$|^github.com/ansible/ansible$|^github.com/tensorflow/tensorflow$ lang:python patterntype:regexp case:yes"
    },
    {
      "name": "搜索 Dart 代码",
      "value": "repo:^github.com/dart-lang/http$ lang:dart file:lib patterntype:regexp case:yes"
    }
  ],
  "search.contextLines": 3
}
```
