# Web Bench

<http://home.tiscali.cz/~cz210552/webbench.html>

```bash
# CentOS 7.3
wget http://home.tiscali.cz/~cz210552/distfiles/webbench-1.5.tar.gz

tar -zxvf webbench-1.5.tar.gz

# 安装依赖
yum install ctags -y

make

# 创建相应目录
mkdir -m 644 -p /usr/local/man/man1

make install

# 测试
webbench -c 500 -t 30 http://www.baidu.com/
```