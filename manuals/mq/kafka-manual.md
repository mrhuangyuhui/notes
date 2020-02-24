# Kafka Manual

http://kafka.apache.org

https://github.com/apache/kafka

https://github.com/yahoo/kafka-manager

https://github.com/mrhuangyuhui/kafka

## Installation

**下载站点**

https://www.apache.org/dyn/closer.cgi?path=/kafka

[安装脚本](https://github.com/mrhuangyuhui/kafka/blob/master/install-kafka-bin.sh)（**注意：要求主机内存 2G 以上**）
```bash
yum install -y wget tar vim tree

# 安装 SDKMAN
curl -L https://raw.githubusercontent.com/mrhuangyuhui/sdkman/master/install-sdkman.sh | bash

# 安装 Java
sdk install java 8.0.171-oracle

# 安装 Kafka
curl -L https://github.com/mrhuangyuhui/kafka/raw/master/install-kafka-bin.sh | bash
```

**注意：对外提供服务一定要配置以下两项**
```bash
# 手动配置
vim /usr/local/kafka/current/config/server.properties
listeners=PLAINTEXT://10.1.5.63:9092
advertised.listeners=PLAINTEXT://10.1.5.63:9092

# 自动配置
IP_ADDR=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d '/'` && cat >> /usr/local/kafka/current/config/server.properties << EOF

listeners=PLAINTEXT://${IP_ADDR}:9092
advertised.listeners=PLAINTEXT://${IP_ADDR}:9092
EOF

```

启动服务器
```bash
# 启动内置的 ZooKeeper 服务器（后台启动）
cd /usr/local/kafka/current && bin/zookeeper-server-start.sh -daemon config/zookeeper.properties

# 启动 Kafka 服务器（后台启动）
cd /usr/local/kafka/current && bin/kafka-server-start.sh -daemon config/server.properties

# 启动内置的 ZooKeeper 客户端
cd /usr/local/kafka/current && bin/zookeeper-shell.sh localhost:2181

# 验证结果
$ jps
10528 Kafka # Kafka 服务器
9804 QuorumPeerMain # ZooKeeper 服务器
10047 ZooKeeperMain # ZooKeeper 客户端
```

停止服务器
```bash
# 停止内置的 ZooKeeper 服务器
cd /usr/local/kafka/current && bin/zookeeper-server-stop.sh
# 停止 Kafka 服务器
cd /usr/local/kafka/current && bin/kafka-server-stop.sh

# 另一种停止方法
kill -9 `jps | awk '/Kafka/ {print $1}'`

# 验证结果
$ jps
32215 Jps
```

**伪集群环境部署**

```bash
cd /usr/local/kafka/current/

# 拷贝配置文件
cp config/server.properties config/server-1.properties
cp config/server.properties config/server-2.properties

# 修改配置文件
yum install -y vim
vim config/server-1.properties
    broker.id=1
    listeners=PLAINTEXT://:9093
    log.dir=/tmp/kafka-logs-1

vim config/server-2.properties
    broker.id=2
    listeners=PLAINTEXT://:9094
    log.dir=/tmp/kafka-logs-2

# 启动服务器
bin/kafka-server-start.sh config/server-1.properties &
bin/kafka-server-start.sh config/server-2.properties &
```

### Mac

```bash
echo 'export PATH=${PATH}:/usr/local/kafka/current/bin' >> ~/.bash_profile
```

## Commands

**主题**
```bash
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic number

# 列出所有主题的 ID
kafka-topics.sh --list --zookeeper localhost:2181

# 列出所有主题的信息
kafka-topics.sh --describe --zookeeper localhost:2181

# 查看指定主题的详细信息
kafka-topics.sh --describe --zookeeper localhost:2181 --topic number

# 删除主题
kafka-topics.sh --delete --zookeeper localhost:2181 --topic number
```

**生产者**
```bash
# 创建一个生产者
kafka-console-producer.sh --broker-list localhost:9092 --topic number
```

**消费者**
```bash
# 消费单个主题的消息
kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --topic number

# 消费多个主题的消息
kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --whitelist "fruit|animal|number" 
```

**消费组**
```bash
# 列出所有消费组的 ID
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list

# 查看指定消费组的消费情况
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my_group

# 删除消费组
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete --group my_group
```

**消费偏移量**
```bash
# 查看指定主题各分区在指定时间的消息数（注意：不是消费偏移量）
kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic number -time -1
```

**配置**
```bash
# 添加或修改主题的自定义配置，多个配置项以逗号分隔。
$ kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name fruit --alter --add-config flush.messages=2,max.message.bytes=102400

# 查看主题的自定义配置
kafka-configs.sh --zookeeper localhost:2181 --describe --entity-type topics --entity-name fruit

# 删除主题的自定义配置，多个配置项以逗号分隔。
kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name fruit -alter --delete-config flush.messages,max.message.bytes
```

**连接器**
```bash
# 创建一个 Source 连接器（把数据从文件发送到 Kafka 主题）
cd /usr/local/kafka/current && bin/connect-standalone.sh config/connect-standalone.properties config/connect-file-source.properties

# 创建一个 Sink 连接器（把消息从 Kafka 主题输出到文件）
cd /usr/local/kafka/current && bin/connect-standalone.sh config/connect-standalone.properties config/connect-file-sink.properties
```

### `kafka-server-start.sh`

```bash
$ kafka-server-start.sh
USAGE: kafka-server-start.sh [-daemon] server.properties [--override property=value]*
```

### `kafka-topics.sh`

```bash
$ kafka-topics.sh
Create, delete, describe, or change a topic.
```

命令行选项 | 简要说明
---|---
--alter | 修改主题的分区、配置等
--config <String: name=value> | 自定义主题的配置
--create | 创建主题
--delete | 删除主题
--delete-config <String: name> | 删除主题的自定义配置
--describe | 查看主题详情
--list | 列出所有主题
--replication-factor <Integer: replication factor> | 主题的副本数
--topic <String: topic> | 主题 ID
--topics-with-overrides | 筛选出有自定义配置的主题
--zookeeper <String: hosts> | ZooKeeper 服务器列表

### `kafka-console-producer.sh`

```bash
$ kafka-console-producer.sh
Read data from standard input and publish it to Kafka.
```

命令行选项 | 简要说明
---|---
--broker-list <String: broker-list> | Kafka 服务器列表
--topic <String: topic> | 主题 ID

### `kafka-console-consumer.sh`

```bash
$ ./kafka-console-consumer.sh
The console consumer is a tool that reads data from Kafka and outputs it to standard output.

--bootstrap-server <String: server to connect to> 服务器列表
--consumer-property <String: consumer_prop> 自定义属性
--from-beginning 从头开始读取消息
--group <String: consumer group id> 消费者所属的组名
--topic <String: topic> 主题 ID
```

### `kafka-consumer-groups.sh`

```bash
$ kafka-consumer-groups.sh
List all consumer groups, describe a consumer group, delete consumer group info, or reset consumer group offsets.
```

命令行选项 | 简要说明
---|---
--bootstrap-server <String: server to connect to> | Kafka 服务器列表（**注意：带上该选项表示使用新版 API**）
--delete | 删除消费组的消费信息（**注意：使用旧版 API 才支持删除消费组**）
--describe | 查看消费组的消费消息
--group <String: consumer group> | 消费组 ID
--list | 列出全部消费组
--new-consumer | 使用新版 API
--topic <String: topic> | 主题 ID
--zookeeper <String: urls> | ZooKeeper 服务器列表（**注意：带上该选项表示使用旧版 API**）

### `kafka-configs.sh`

```bash
$ kafka-configs.sh
Add/Remove entity config for a topic, client, user or broker
```

命令行选项 | 简要说明
---|---
--add-config <String> | 添加或修改自定义配置（不存在添加，已存在修改），必须与 alter 搭配使用。
--alter | 变更自定义配置（添加、修改、删除）
--bootstrap-server <String: server to connect to> | Kafka 服务器列表（查看或更改服务器的自定义配置时是必选项）
--delete-config <String> | 删除自定义配置，必须与 alter 搭配使用。
--describe | 查看自定义配置
--entity-name <String> | 实体名称
--entity-type <String> | 实体类型 topics/clients/users/brokers
--zookeeper <String: urls> | ZooKeeper 服务器列表

### `connect-standalone.sh`

```bash
$ connect-standalone.sh
USAGE: /usr/local/kafka/current/bin/connect-standalone.sh [-daemon] connect-standalone.properties
```

### [System Tools](https://cwiki.apache.org/confluence/display/KAFKA/System+Tools)

- [Dump Log Segment](https://cwiki.apache.org/confluence/display/KAFKA/System+Tools#SystemTools-DumpLogSegment)
- [Get Offset Shell](https://cwiki.apache.org/confluence/display/KAFKA/System+Tools#SystemTools-GetOffsetShell)

## Configurations [>>](http://kafka.apache.org/documentation#configuration)

### Broker Configs [>>](http://kafka.apache.org/documentation/#brokerconfigs)

[server.properties](https://github.com/apache/kafka/blob/trunk/config/server.properties)
```bash
vim /usr/local/kafka/current/config/server.properties
```

属性 | 简要说明 | 数据类型 | 默认值 | 有效值
---|---|---|---|---
advertised.listeners | 对生产者和消费者广播的主机名和端口号 | string | null
auto.create.topics.enable | 是否允许自动创建主题，如果允许，当访问不存在的主题时，将自动创建，否则，将提示错误。 | boolean | true
default.replication.factor | 一个主题默认的副本数量 | int | 1
delete.topic.enable | 是否允许彻底删除主题，如果允许，将删除日志文件，否则，只把日志文件标记为删除状态。 | boolean | true
log.retention.bytes | 一个日志文件存储多少字节后删除 | long | -1	
log.retention.check.interval.ms | 每隔多少毫秒检查一次哪些日志文件要删除 | long | 300000 | [1,...]
log.retention.hours | 一个日志文件保留多少小时后删除 | int | 168 | 
log.retention.minutes | 一个日志文件保留多少分钟后删除 | int | null
log.retention.ms | 一个日志文件保留多少毫秒后删除 | long | null
log.dir | 日志文件的存储目录 | string | /tmp/kafka-logs
num.partitions | 一个主题默认的分区数量 | int | 1
zookeeper.connect | ZooKeeper 服务器列表 | string

### Topic-Level Configs [>>](http://kafka.apache.org/documentation/#topicconfigs)

### Producer Configs [>>](http://kafka.apache.org/documentation/#producerconfigs)

属性 | 说明 | 数据类型 | 默认值 | 有效值
---|---|---|---|---
acks | 请求生产消息时需要几个服务器确认 | string | 1 | [all, -1, 0, 1]
bootstrap.servers | Kafka 引导服务器列表，用于找到集群内所有服务器，建议两个以上。 | list | "" | 
client.id | 客户端 ID | string | "" | 
key.serializer | 消息键的序列化器 | class | | 
value.serializer | 消息值的序列化器 | class | | 

### Consumer Configs [>>](http://kafka.apache.org/documentation/#consumerconfigs)

In 0.9.0.0 we introduced the new Java consumer as a replacement for the older Scala-based simple and high-level consumers.

**[New Consumer Configs](http://kafka.apache.org/documentation/#newconsumerconfigs)**

属性 | 说明 | 数据类型 | 默认值 | 有效值
---|---|---|---|---
auto.offset.reset | 当前服务器没有初始偏移量或当前偏移量数据丢失时，自动重置偏移量。 | string | latest | [latest, earliest, none]
bootstrap.servers | Kafka 引导服务器列表，用于找到集群内所有服务器，建议两个以上。 | list | "" | 
client.id | 客户端 ID | string | "" | 
group.id | 消费组 ID | string | "" | 
key.deserializer | 消息键的反序列化器 |	class | | 
value.deserializer | 消息值的反序列化器 | class | | 

**[Old Consumer Configs](http://kafka.apache.org/documentation/#oldconsumerconfigs)**

### Kafka Streams Configs [>>](http://kafka.apache.org/documentation/#streamsconfigs)

属性 | 说明 | 数据类型 | 默认值 | 有效值
---|---|---|---|---
metrics.sample.window.ms | 连接操作时间窗口的长度 | long | 30000 | [0,...]

## References

### APIS [>>](http://kafka.apache.org/documentation/#api)

**[Producer API](http://kafka.apache.org/documentation/#producerapi)**
```xml
<dependency>
    <groupId>org.apache.kafka</groupId>
    <artifactId>kafka-clients</artifactId>
    <version>1.1.0</version>
</dependency>
```

**[Consumer API](http://kafka.apache.org/documentation/#consumerapi)**
```xml
<dependency>
    <groupId>org.apache.kafka</groupId>
    <artifactId>kafka-clients</artifactId>
    <version>1.1.0</version>
</dependency>
```

## Clients [>>](https://cwiki.apache.org/confluence/display/KAFKA/Clients)

### Python

https://cwiki.apache.org/confluence/display/KAFKA/Clients#Clients-Python

### Ruby [>>](https://cwiki.apache.org/confluence/display/KAFKA/Clients#Clients-Ruby)

https://github.com/zendesk/ruby-kafka

### Vert.x [>>](https://vertx.io/docs/vertx-kafka-client/java/)

`pom.xml`
```xml
<dependency>
  <groupId>io.vertx</groupId>
  <artifactId>vertx-kafka-client</artifactId>
  <version>3.5.1</version>
</dependency>
```

`build.gradle`
```gradle
compile io.vertx:vertx-kafka-client:3.5.1
```

https://github.com/vert-x3/vertx-kafka-client \
https://github.com/vert-x3/vertx-examples/tree/master/kafka-examples

## Tutorials

[Quickstart](http://kafka.apache.org/quickstart)

[Documentation](http://kafka.apache.org/documentation/)

http://www.jasongj.com/categories/Kafka/

http://orchome.com/kafka/index

http://zqhxuyuan.github.io/

https://blog.csdn.net/lizhitao/article/category/2194509

## Examples

https://github.com/apache/kafka/tree/trunk/examples

## Tools

https://github.com/yahoo/kafka-manager

```bash
yum install -y git
git clone https://github.com/yahoo/kafka-manager.git
cd kafka-manager/
./sbt clean dist
```
