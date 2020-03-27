# HBase Manual

<http://hbase.apache.org/>

<https://hbase.apache.org/downloads.html>

<https://hbase.apache.org/book.html>

<https://github.com/apache/hbase>

## Installation

[Downloads](https://hbase.apache.org/downloads.html)

[Quick Start - Standalone HBase](https://hbase.apache.org/book.html#quickstart)

```bash
# 下载
wget http://mirrors.shu.edu.cn/apache/hbase/2.1.0/hbase-2.1.0-bin.tar.gz
tar xzvf hbase-2.1.0-bin.tar.gz
ln -s hbase-2.1.0 current

# 设置环境变量
echo 'export HBASE_HOME=~/hbase/current' >> ~/.bash_profile
echo 'export PATH=${PATH}:${HBASE_HOME}/bin' >> ~/.bash_profile

# 启动 HBase
start-hbase.sh

# 停止 HBase
stop-hbase.sh

# 验证启动和停止情况
jps

# 启动客户端
hbase shell
```

## References

[Apache HBase API](https://hbase.apache.org/apidocs/index.html)

[Apache HBase Reference Guide](https://hbase.apache.org/book.html)

## Tutorials

[Apache HBase Reference Guide](https://hbase.apache.org/book.html)

## Examples

<https://github.com/apache/hbase/tree/master/hbase-examples>

## Articles

[HBase 入门教程](https://blog.csdn.net/yowoyn/article/details/79765132)