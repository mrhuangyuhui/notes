# Hadoop Manual

<http://hadoop.apache.org/>

## Installation

<http://hadoop.apache.org/releases.html>

```bash
# 下载
wget http://mirrors.shu.edu.cn/apache/hadoop/common/hadoop-3.1.1/hadoop-3.1.1.tar.gz
tar xzvf hadoop-3.1.1.tar.gz
ln -s hadoop-3.1.1 current

# 设置环境变量 Mac
echo 'export HADOOP_HOME=~/hadoop/current' >> ~/.bash_profile
echo 'export PATH=${PATH}:${HADOOP_HOME}/bin' >> ~/.bash_profile

# 设置环境变量 Linux
echo 'export HADOOP_HOME=/usr/local/hadoop/current' >> /etc/profile.d/hadoop.sh
echo 'export PATH=${PATH}:${HADOOP_HOME}/bin' >> /etc/profile.d/hadoop.sh
```