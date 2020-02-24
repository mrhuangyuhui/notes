# RocketMQ Manual

<http://rocketmq.apache.org/>

<https://github.com/apache/rocketmq/>

<http://rocketmq.apache.org/docs/quick-start/>

## [Installation](http://rocketmq.apache.org/docs/quick-start/)

<http://rocketmq.apache.org/release_notes/release-notes-4.2.0/>

Prerequisite

```bash
64bit JDK 1.8+;
Maven 3.2.x
```

### Binary

安装脚本 [`install-rocketmq-bin.sh`](https://gitee.com/mrhuangyuhui/rocketmq/blob/master/install-rocketmq-bin.sh)

## [Quick Start](http://rocketmq.apache.org/docs/quick-start/)

```bash
curl -L https://gitee.com/mrhuangyuhui/rocketmq/raw/master/install-rocketmq-bin.sh | bash
```

Start Name Server

```bash
# 进入安装目录，这一步很重要！
cd /usr/local/rocketmq/current

# 后台启动
nohup sh bin/mqnamesrv &

# 查看启动日志
tail -f ~/logs/rocketmqlogs/namesrv.log
```

Start Broker

```bash
cd /usr/local/rocketmq/current

nohup sh bin/mqbroker -n localhost:9876 &

tail -f ~/logs/rocketmqlogs/broker.log
```

Send & Receive Messages

```bash
cd /usr/local/rocketmq/current

# 启动消息生产者
export NAMESRV_ADDR=localhost:9876 && sh bin/tools.sh org.apache.rocketmq.example.quickstart.Producer

# 启动消息消费者
export NAMESRV_ADDR=localhost:9876 && sh bin/tools.sh org.apache.rocketmq.example.quickstart.Consumer
```

Shutdown Servers

```bash
cd /usr/local/rocketmq/current

sh bin/mqshutdown broker

sh bin/mqshutdown namesrv
```