<!-- omit in toc -->
# Selenium Manual

- [The Internet](#the-internet)
- [Install](#install)
  - [WebDriver binaries](#webdriver-binaries)
  - [Selenium libraries](#selenium-libraries)
    - [Ruby](#ruby)
    - [Python](#python)
- [Selenium IDE](#selenium-ide)
- [References](#references)
  - [Python](#python-1)
- [Tutorials](#tutorials)

<https://www.selenium.dev/>

<https://www.selenium.dev/documentation/en/>

<https://github.com/SeleniumHQ/selenium>

<https://github.com/SeleniumHQ/seleniumhq.github.io>

[Getting started](https://www.selenium.dev/documentation/en/getting_started/quick/)

> 提示：浏览中文文档请把 URL 中的 `en` 改为 `zh-cn`

## The Internet

测试网站

<http://the-internet.herokuapp.com/>

<https://github.com/tourdedave/the-internet>

<https://hub.docker.com/r/gprestes/the-internet/>

## Install

<https://www.selenium.dev/documentation/en/selenium_installation/>

<https://www.selenium.dev/downloads/>

> 注意：一定要先安装浏览器驱动！！！

### WebDriver binaries

[Selenium WebDriver](selenium-webdriver.md#install)

### Selenium libraries

<https://www.selenium.dev/documentation/en/selenium_installation/installing_selenium_libraries/>

<!-- #selenium-ruby -->
#### Ruby

> 提示：因网络问题，需要配置国内 Gem 源，请查看笔记 [Gem Manual](/manuals/ruby/gem-manual.md#mirrors)。

```bash
gem install selenium-webdriver
```

#### Python

安装 Selenium 的 Python 包

```bash
pip install -U selenium
```

配置环境变量

```bash
# Mac 设置 PATH
echo 'export PATH=${PATH}:~/chromedriver/current' >> ~/.bash_profile
```

## Selenium IDE

[Selenium IDE](selenium-ide.md)

## References

### [Python](http://seleniumhq.github.io/selenium/docs/api/py/index.html)

[PyPI](https://pypi.org/project/selenium/)

[API](https://seleniumhq.github.io/selenium/docs/api/py/api.html)

- [General Index](https://seleniumhq.github.io/selenium/docs/api/py/genindex.html)
- [Module Index](https://seleniumhq.github.io/selenium/docs/api/py/py-modindex.html)

<!-- #selenium-tutorial -->
## Tutorials

[Selenium 2 自动化测试实战：基于 Python 语言](/tutorials/selenium/selenium2-python/README.md)

[Selenium Tutorial](/tutorials/selenium/selenium-tutorial/README.md)

<http://elementalselenium.com/tips>
