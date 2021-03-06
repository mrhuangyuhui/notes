<!-- omit in toc -->
# PHPUnit Manual

- [Install](#install)
- [PhpStorm](#phpstorm)
- [`phpunit-bridge`](#phpunit-bridge)
- [`phpunit.xml`](#phpunitxml)

<https://phpunit.de/>

<https://phpunit.de/documentation.html>

## Install

<https://phpunit.de/getting-started/phpunit-8.html>

<https://phpunit.de/getting-started/phpunit-7.html>

安装

```bash
composer require --dev phpunit/phpunit ^7

./vendor/bin/phpunit --version
```

测试

```bash
./vendor/bin/phpunit --bootstrap vendor/autoload.php tests/EmailTest
```

## PhpStorm

[PhpStorm Manual - Test](phpstorm-manual.md#test)

[Test Frameworks](https://www.jetbrains.com/help/phpstorm/php-test-frameworks.html)

[Testing with PHPUnit](https://www.jetbrains.com/help/phpstorm/using-phpunit-framework.html)

## `phpunit-bridge`

[`phpunit-bridge.md`](phpunit-bridge.md)

## `phpunit.xml`

或 `phpunit.xml.dist`

[Composing a Test Suite Using XML Configuration](https://phpunit.readthedocs.io/en/9.1/organizing-tests.html#composing-a-test-suite-using-xml-configuration)
