# DPKG Practice

https://wiki.debian.org/dpkg


Show help message
```bash
dpkg --help
```

Install package
```bash
dpkg -i tree_1.7.0-3_amd64.deb
```

List files 'owned' by package(s)
```bash
dpkg -L package
```


dpkg

# 安装包
dpkg -i package.deb

# 删除包 ，保留配置文件。
dpkg -r package

# 删除包，包括配置文件。
dpkg -P package


# 显示该包的版本
dpkg -l  package

# 列出当前已安装的包
dpkg -l

# 查看已安装包的状态信息
dpkg -s package

# 在已安装的包中搜索关键词
dpkg -S keyword
