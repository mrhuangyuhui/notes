<!-- omit in toc -->
# Jest Manual

- [Quick Start](#quick-start)
- [Repos](#repos)
- [Commands](#commands)
- [Guides](#guides)
- [WebStorm](#webstorm)

<https://jestjs.io/>

<https://www.npmjs.com/package/jest>

## Quick Start

<https://jestjs.io/docs/en/getting-started>

## Repos

<https://github.com/facebook/jest>

## Commands

<https://jestjs.io/docs/en/cli>

```bash
jest -h
jest --help
```

```bash
jest -v
jest --version
```

Run all tests (default):

```bash
jest
```

Run only the tests that were specified with a pattern or filename:

```bash
jest my-test #or
jest path/to/my-test.js
```

[`--testNamePattern=<regex>`](https://jestjs.io/docs/en/cli#--testnamepatternregex)

Run only tests with a name that matches the regex.

[`--testPathPattern=<regex>`](https://jestjs.io/docs/en/cli#--testnamepatternregex)

A regexp pattern string that is matched against all tests paths before executing the test.

## Guides

[Testing Web Frameworks](https://jestjs.io/docs/en/testing-frameworks)

[How to test Express.js with Jest and Supertest](http://www.albertgao.xyz/2017/05/24/how-to-test-expressjs-with-jest-and-supertest/)

## WebStorm

[Jest - Help | WebStorm](https://www.jetbrains.com/help/webstorm/running-unit-tests-on-jest.html)

[Run/Debug Configuration: Jest - Help | WebStorm](https://www.jetbrains.com/help/webstorm/run-debug-configuration-jest.html)
