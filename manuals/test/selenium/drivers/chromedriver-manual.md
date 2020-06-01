<!-- #selenium-chrome -->
<!-- omit in toc -->
# ChromeDriver Manual

- [Install](#install)
  - [Mac](#mac)
- [Downloads](#downloads)

<http://chromedriver.chromium.org/>

## Install

### Mac

```bash
mkdir ~/chromedriver_home && cd ~/chromedriver_home
```

> 注意：因为二进制文件的名称是 `chromedriver`，所以其主目录命名为 `chromedriver_home`，不然，两者名称一样，在 Ruby 环境下可能会出现 `not a file` 的错误！！！

下载并解压安装包 [chromedriver_mac64.zip](https://chromedriver.storage.googleapis.com/80.0.3987.106/chromedriver_mac64.zip) 到目录 `~/chromedriver_home`

创建符号链接

```bash
ln -s chromedriver_mac64_80.0.3987.106 current
```

配置 `PATH`

```bash
cat >> ~/.bash_profile << EOF
# ChromeDriver
export PATH=\${PATH}:~/chromedriver_home/current
EOF

tail -n 2 ~/.bash_profile

source ~/.bash_profile
```

验证安装结果

```bash
chromedriver
```

## Downloads

<http://chromedriver.chromium.org/downloads>

<https://chromedriver.storage.googleapis.com/index.html>
