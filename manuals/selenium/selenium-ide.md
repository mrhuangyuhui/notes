<!-- #selenium-ide -->
<!-- omit in toc -->
# Selenium IDE

- [Command-line Runner](#command-line-runner)
- [References](#references)
  - [Control Flow](#control-flow)

<https://www.selenium.dev/selenium-ide/>

<https://github.com/seleniumhq/selenium-ide>

[Chrome Extension](https://chrome.google.com/webstore/detail/selenium-ide/mooikfkahbdckldjjndioackbalphokd)

[Firefox Extension](https://addons.mozilla.org/en-US/firefox/addon/selenium-ide/)

[Getting Started](https://www.selenium.dev/selenium-ide/docs/en/introduction/getting-started)

## Command-line Runner

<https://www.selenium.dev/selenium-ide/docs/en/introduction/command-line-runner>

安装 Node（详情请参考 [Node Manual](/manuals/node/node-manual.md#nvm)）

```bash
# 使用 Node 多版本管理工具 NVM 进行安装
nvm install 10.19.0

# 指定 Node 版本
nvm use 10.19.0
```

安装 Command-line Runner

```bash
npm install -g selenium-side-runner
```

安装浏览器驱动

- [Chrome](http://chromedriver.chromium.org/)

> 提示：以下方法如果安装失败，请直接[下载安装](/manuals/test/chromedriver.md#install)。

```bash
npm install -g chromedriver
```

- [Firefox](https://github.com/mozilla/geckodriver)

```bash
npm install -g geckodriver
```

## References

<https://www.selenium.dev/selenium-ide/docs/en/api/commands>

### Control Flow

<https://www.selenium.dev/selenium-ide/docs/en/introduction/control-flow>

[`times`](https://www.selenium.dev/selenium-ide/docs/en/api/commands#times)

[![img](https://www.selenium.dev/selenium-ide/img/docs/control-flow/times.png)](https://www.selenium.dev/selenium-ide/docs/en/introduction/control-flow#times-selenium-ide-docs-en-api-commands-times)

[`do`](https://www.selenium.dev/selenium-ide/docs/en/api/commands#do)

[`repeat if`](https://www.selenium.dev/selenium-ide/docs/en/api/commands#repeat-if)

[![img](https://www.selenium.dev/selenium-ide/img/docs/control-flow/do.png)](https://www.selenium.dev/selenium-ide/docs/en/introduction/control-flow#do-selenium-ide-docs-en-api-commands-do)

[`while`](https://www.selenium.dev/selenium-ide/docs/en/api/commands#while)

[![img](https://www.selenium.dev/selenium-ide/img/docs/control-flow/while.png)](https://www.selenium.dev/selenium-ide/docs/en/introduction/control-flow#while-selenium-ide-docs-en-api-commands-while)
