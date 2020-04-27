<!-- omit in toc -->
# Anaconda Manual

- [Install](#install)
- [Uninstall](#uninstall)

<https://www.anaconda.com/>

## Install

<https://www.anaconda.com/download/>

[Mac](https://docs.anaconda.com/anaconda/install/mac-os)

```bash
# Python 3.6
bash ~/Downloads/Anaconda3-5.2.0-MacOSX-x86_64.sh
# Python 2.7
bash ~/Downloads/Anaconda2-5.2.0-MacOSX-x86_64.sh
```

## Uninstall

<https://docs.anaconda.com/anaconda/install/uninstall/>

Mac

```bash
# 安装卸载程序
conda install anaconda-clean

# 启动卸载程序
anaconda-clean

# 删除安装目录
sudo rm -rf ~/anaconda3

# 删除 PATH 配置
export PATH="/Users/yuhuihuang/anaconda3/bin:$PATH"
```
