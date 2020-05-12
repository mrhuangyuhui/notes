# Python Search

## Sourcegraph

<https://sourcegraph.com/search>

```json
{
  "name": "搜索 Python 代码",
  "value": "repo:^github.com/pallets/flask$|^github.com/django/django$|^github.com/scrapy/scrapy$|^github.com/ansible/ansible$|^github.com/tensorflow/tensorflow$ lang:python patterntype:regexp case:yes"
}
```

<https://sourcegraph.com/search?q=repo:%5Egithub.com/pallets/flask%24%7C%5Egithub.com/django/django%24%7C%5Egithub.com/scrapy/scrapy%24%7C%5Egithub.com/ansible/ansible%24%7C%5Egithub.com/tensorflow/tensorflow%24+lang:python+example&patternType=regexp&case=yes>

## Chrome

chrome://settings/searchEngines

```
https://sourcegraph.com/search?q=repo:%5Egithub.com/pallets/flask%24%7C%5Egithub.com/django/django%24%7C%5Egithub.com/scrapy/scrapy%24%7C%5Egithub.com/ansible/ansible%24%7C%5Egithub.com/tensorflow/tensorflow%24+lang:python+%s&patternType=regexp&case=yes
```

## Alfred

```
https://sourcegraph.com/search?q=repo:%5Egithub.com/pallets/flask%24%7C%5Egithub.com/django/django%24%7C%5Egithub.com/scrapy/scrapy%24%7C%5Egithub.com/ansible/ansible%24%7C%5Egithub.com/tensorflow/tensorflow%24+lang:python+{query}&patternType=regexp&case=yes
```

## GitHub

<https://github.com/search/advanced>

```
pallets/flask,django/django,scrapy/scrapy,ansible/ansible,tensorflow/tensorflow
```

<https://github.com/search?l=&q=example+repo%3Apallets%2Fflask+repo%3Adjango%2Fdjango+repo%3Ascrapy%2Fscrapy+repo%3Aansible%2Fansible+repo%3Atensorflow%2Ftensorflow&type=Code>
