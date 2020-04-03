<!-- #selenium-ide -->
# Selenium IDE

<https://www.selenium.dev/selenium-ide/>

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

```bash
# Chrome（注意：如果安装失败，请使用 VPN）
npm install -g chromedriver

# Firefox
npm install -g geckodriver
```
