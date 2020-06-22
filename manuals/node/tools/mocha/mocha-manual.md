<!-- omit in toc -->
# Mocha Manual

- [Quick Start](#quick-start)
- [Install](#install)
- [Repos](#repos)
- [Commands](#commands)
- [Docs](#docs)
- [Examples](#examples)
- [WebStorm](#webstorm)
- [Debugging](#debugging)

<https://mochajs.org/>

## Quick Start

<https://mochajs.org/#getting-started>

```bash
npm install mocha

mkdir test

$EDITOR test/test.js # or open with your favorite editor
```

In your editor:

```js
var assert = require('assert');
describe('Array', function () {
  describe('#indexOf()', function () {
    it('should return -1 when the value is not present', function () {
      assert.equal([1, 2, 3].indexOf(4), -1);
    });
  });
});
```

Back in the terminal:

```bash
./node_modules/mocha/bin/mocha
```

Set up a test script in `package.json`:

```json
"scripts": {
  "test": "mocha"
}
```

Then run tests with:

```bash
npm test
```

## Install

<https://mochajs.org/#installation>

Install with npm globally:

```bash
npm install --global mocha
```

or as a development dependency for your project:

```bash
npm install --save-dev mocha
```

## Repos

<https://github.com/mochajs/mocha>

<https://github.com/mochajs/mocha-examples>

## Commands

<https://mochajs.org/#command-line-usage>

```bash
mocha -h
mocha --help
```

```bash
mocha -V
mocha --version
```

如果非全局安装，可设置别名。

```bash
alias mocha='./node_modules/mocha/bin/mocha'
```

```bash
Positional Arguments
  spec  One or more files, directories, or globs to test
                                                     [array] [default: ["test"]]
```

只执行某一个测试文件

```bash
mocha test/app.js
```

```bash
Test Filters
  --fgrep, -f   Only run tests containing this string                   [string]
  --grep, -g    Only run tests matching this string or regexp           [string]
```

只执行某一个测试用例

```bash
mocha -g 'should be callable' test/app.js
```

## Docs

<https://mochajs.org/>

[Interfaces](https://mochajs.org/#interfaces)

## Examples

[Examples](https://mochajs.org/#examples)

<https://github.com/mochajs/mocha-examples>

## WebStorm

<https://mochajs.org/#jetbrains>

<!-- #mocha-debug -->
## Debugging

[mocha-debug.md](mocha-debug.md)
