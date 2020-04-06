<!-- #selenium -->
<!-- omit in toc -->
# ChromeDriver

- [Install](#install)
  - [Mac](#mac)

<http://chromedriver.chromium.org/>

<http://chromedriver.chromium.org/downloads>

## Install

### Mac

下载并解压 [ChromeDriver 80.0.3987.106](https://chromedriver.storage.googleapis.com/index.html?path=80.0.3987.106/) 到目录 `~/chromedriver`

`~/chromedriver` 的目录结构

```bash
cd ~/chromedriver

$ tree
.
|____chromedriver_mac64_80.0.3987.106
| |____chromedriver
|____current
```

设置符号链接

```bash
cd ~/chromedriver

ln -s chromedriver_mac64_80.0.3987.106 current
```

配置环境变量

```bash
# 设置 PATH
echo 'export PATH=${PATH}:~/chromedriver/current' >> ~/.bash_profile
```
