<!-- #selenium-chrome -->
<!-- omit in toc -->
# ChromeDriver

- [Install](#install)
  - [Mac](#mac)

<http://chromedriver.chromium.org/>

## Install

<http://chromedriver.chromium.org/downloads>

<https://chromedriver.storage.googleapis.com/index.html>

### Mac

> 注意：因为二进制文件的名称是 `chromedriver`，所以主目录命名为 `chromedriver_home`，不然，两者名称一样，在 Ruby 环境下可能会出现 `not a file` 的错误！！！

下载并解压 [ChromeDriver 80.0.3987.106](https://chromedriver.storage.googleapis.com/index.html?path=80.0.3987.106/) 到目录 `~/chromedriver_home`

创建符号链接

```bash
cd ~/chromedriver_home

ln -s chromedriver_mac64_80.0.3987.106 current
```

配置 `PATH`

```bash
echo 'export PATH=${PATH}:~/chromedriver_home/current' >> ~/.bash_profile
```

检查安装结果

```bash
chromedriver
```
