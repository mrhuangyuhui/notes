# GeckoDriver Manual

<https://github.com/mozilla/geckodriver>

## Install

### Mac

```bash
mkdir ~/geckodriver_home && cd ~/geckodriver_home
```

> 注意：因为二进制文件的名称是 `geckodriver`，所以其主目录命名为 `geckodriver_home`，不然，两者名称一样，在 Ruby 环境下可能会出现 `not a file` 的错误！！！

下载并解压安装包 [geckodriver-v0.26.0-macos.tar.gz](https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-macos.tar.gz) 到目录 `~/geckodriver_home`

创建符号链接

```bash
ln -s geckodriver-v0.26.0-macos current
```

配置 `PATH`

```bash
cat >> ~/.bash_profile << EOF
# GeckoDriver
export PATH=\${PATH}:~/geckodriver_home/current
EOF

tail -n 2 ~/.bash_profile

source ~/.bash_profile
```

验证安装结果

```bash
geckodriver --version
```

## Downloads

<https://github.com/mozilla/geckodriver/releases>

## Commands

```bash
geckodriver -h
geckodriver --help
```

```bash
geckodriver -V
geckodriver --version
```
