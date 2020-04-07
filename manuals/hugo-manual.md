# Hugo Manual

<https://gohugo.io/>

<https://github.com/gohugoio/hugo>

<https://gohugo.io/getting-started/quick-start/>

## Install

<https://gohugo.io/getting-started/installing>

二进制文件下载地址 <https://github.com/gohugoio/hugo/releases>

> 提示：推荐下载二进制文件直接使用！！！

### Mac

下载二进制文件 `hugo_0.68.3_macOS-64bit.tar.gz` 解压后放到目录 `~/hugo` 下

创建符号链接

```bash
cd ~/hugo

ln -s hugo_0.68.3_macOS-64bit current
```

配置 `PATH`

```bash
echo 'export PATH=${PATH}:~/hugo/current/' >> ~/.bash_profile

source ~/.bash_profile
```

检查安装结果

```bash
hugo version
```

## Commands

```bash
hugo help
hugo new help
hugo version
```
