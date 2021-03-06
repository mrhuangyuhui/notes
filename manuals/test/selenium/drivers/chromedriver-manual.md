<!-- #selenium-chrome -->
<!-- omit in toc -->
# ChromeDriver Manual

- [Install](#install)
  - [Mac](#mac)
- [Downloads](#downloads)
- [Commands](#commands)

<http://chromedriver.chromium.org/>

## Install

> 注意：ChromeDriver 的版本要与 Chrome 保持一致！

下载地址 <http://chromedriver.chromium.org/downloads>

### Mac

> 提示：一般情况下，可以直接把二进制文件 `chromedriver` 解压到目录 `/usr/local/bin` 下，如果想在不同版本间快速切换，可以采用以下安装方式。

```bash
mkdir ~/chromedriver_home && cd ~/chromedriver_home
```

> 注意：因为二进制文件的名称是 `chromedriver`，所以其主目录命名为 `chromedriver_home`，不然，两者名称一样，在 Ruby 环境下可能会出现 `not a file` 的错误！！！

下载并解压安装包 [chromedriver_mac64.zip](https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_mac64.zip) 到目录 `~/chromedriver_home`

创建版本目录

```bash
mkdir chromedriver_mac64_83.0.4103.39

mv chromedriver chromedriver_mac64_83.0.4103.39
```

创建符号链接

```bash
ln -s chromedriver_mac64_83.0.4103.39 current
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
chromedriver --version
```

## Downloads

<http://chromedriver.chromium.org/downloads>

<https://chromedriver.storage.googleapis.com/index.html>

## Commands

```bash
chromedriver -h
chromedriver --help
```

```bash
chromedriver -v
chromedriver --version
```
