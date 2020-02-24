[toc]

# 第5章　Kafka基本操作实战

## 5.2　主题管理

### 5.2.1　创建主题【注：学习结束】

```bash
$ kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic apple
Created topic "apple".

# 在 ${log.dir} 目录下创建相应的分区文件目录
$ tree /tmp/kafka-logs/
/tmp/kafka-logs/
├── apple-0
│   ├── 00000000000000000000.index
│   ├── 00000000000000000000.log
│   ├── 00000000000000000000.timeindex
│   └── leader-epoch-checkpoint
├── apple-1
│   ├── 00000000000000000000.index
│   ├── 00000000000000000000.log
│   ├── 00000000000000000000.timeindex
│   └── leader-epoch-checkpoint
├── apple-2
│   ├── 00000000000000000000.index
│   ├── 00000000000000000000.log
│   ├── 00000000000000000000.timeindex
│   └── leader-epoch-checkpoint

# 在 ZooKeeper 客户端查看主题的元数据信息
[zk: localhost:2181(CONNECTED) 2] ls /brokers/topics/apple/partitions
[0, 1, 2]
[zk: localhost:2181(CONNECTED) 3] get /brokers/topics/apple           
{"version":1,"partitions":{"2":[0],"1":[0],"0":[0]}}
```

创建带自定义配置的主题
```bash
$ kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic tiger --config max.message.bytes=404800
Created topic "tiger".

# 查看主题详情
$ kafka-topics.sh --describe --zookeeper localhost:2181 --topic tiger
Topic:tiger     PartitionCount:3        ReplicationFactor:1     Configs:max.message.bytes=404800 # 自定义配置
        Topic: tiger    Partition: 0    Leader: 0       Replicas: 0     Isr: 0
        Topic: tiger    Partition: 1    Leader: 0       Replicas: 0     Isr: 0
        Topic: tiger    Partition: 2    Leader: 0       Replicas: 0     Isr: 0

# 在 ZooKeeper 客户端查看主题的自定义配置
[zk: localhost:2181(CONNECTED) 4] get /config/topics/tiger
{"version":1,"config":{"max.message.bytes":"404800"}}
```

### 5.2.2　删除主题【注：学习结束】

```bash
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic movie

# 删除主题
$ kafka-topics.sh --delete --zookeeper localhost:2181 --topic movie
Topic movie is marked for deletion.
Note: This will have no impact if delete.topic.enable is not set to true.

# 实际上并未彻底删除，只是把分区标记为删除状态。
$ tree /tmp/kafka-logs/ | grep movie
├── movie-0.206519bb6bff448cb4ddc69183e87ae3-delete
├── movie-1.f67f1df496524425b21c0ee1187fa861-delete
├── movie-2.9ffb0989adf846b4ba8c6413fba03986-delete

# 重新创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic movie

# 删除标记取消
$ tree /tmp/kafka-logs/ | grep movie
├── movie-0
├── movie-1
├── movie-2

# 停止 Kafka 服务器
cd /usr/local/kafka/current && bin/kafka-server-stop.sh

# 重新启动 Kafka 服务器，设置 delete.topic.enable=true。
cd /usr/local/kafka/current && bin/kafka-server-start.sh -daemon config/server.properties --override delete.topic.enable=true

# 重新删除主题
$ kafka-topics.sh --delete --zookeeper localhost:2181 --topic movie
Topic movie is marked for deletion.
Note: This will have no impact if delete.topic.enable is not set to true.

# 立即查看，仍然没有彻底删除。
$ tree /tmp/kafka-logs/ | grep movie
├── movie-0.8bba0fd61b264533a10ff897d58d9b16-delete
├── movie-1.266e3e7c376a4bd5ab00ddbd46c522d3-delete
├── movie-2.3b69b338699343338b8093744e8c4a86-delete

# 过几秒后查看，已经删除，这说明了彻底删除也是有延时的。
# 详情查看配置属性 log.retention.check.interval.ms
$ tree /tmp/kafka-logs/ | grep movie
```

### 5.2.3　查看主题【注：学习结束】

测试数据
```bash
# 创建三个主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic number
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic fruit
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic animal
```

**1．查看所有主题**

列出所有主题的 ID
```bash
$ kafka-topics.sh --list --zookeeper localhost:2181
__consumer_offsets # 新版本的 Kafka 把消费偏移量保存在一个内部主题中
animal
fruit
number
```

**2．查看某个特定主题信息**

查看所有主题的详细信息
```bash
$ kafka-topics.sh --describe --zookeeper localhost:2181
Topic:__consumer_offsets        PartitionCount:50       ReplicationFactor:1     Configs:segment.bytes=104857600,cleanup.policy=compact,compression.type=producer
Topic:animal    PartitionCount:3        ReplicationFactor:1     Configs:
        Topic: animal   Partition: 0    Leader: 0       Replicas: 0     Isr: 0
        Topic: animal   Partition: 1    Leader: 0       Replicas: 0     Isr: 0
        Topic: animal   Partition: 2    Leader: 0       Replicas: 0     Isr: 0
Topic:fruit     PartitionCount:3        ReplicationFactor:1     Configs:
        Topic: fruit    Partition: 0    Leader: 0       Replicas: 0     Isr: 0
        Topic: fruit    Partition: 1    Leader: 0       Replicas: 0     Isr: 0
        Topic: fruit    Partition: 2    Leader: 0       Replicas: 0     Isr: 0
Topic:number    PartitionCount:3        ReplicationFactor:1     Configs:
        Topic: number   Partition: 0    Leader: 0       Replicas: 0     Isr: 0
        Topic: number   Partition: 1    Leader: 0       Replicas: 0     Isr: 0
        Topic: number   Partition: 2    Leader: 0       Replicas: 0     Isr: 0
```

查看指定主题的详细信息
```bash
$ kafka-topics.sh --describe --zookeeper localhost:2181 --topic fruit
Topic:fruit     PartitionCount:3        ReplicationFactor:1     Configs:
        Topic: fruit    Partition: 0    Leader: 0       Replicas: 0     Isr: 0
        Topic: fruit    Partition: 1    Leader: 0       Replicas: 0     Isr: 0
        Topic: fruit    Partition: 2    Leader: 0       Replicas: 0     Isr: 0
```

**3．查看正在同步的主题**

跳过

**4．查看没有Leader的分区**

跳过

**5．查看主题覆盖的配置**

查看带自定义配置的主题
```bash
# 再创建一个带自定义配置的主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic movie --config max.message.bytes=404800

# 筛选出带自定义配置的主题
$ kafka-topics.sh --describe --zookeeper localhost:2181 --topics-with-overrides
Topic:__consumer_offsets        PartitionCount:50       ReplicationFactor:1     Configs:segment.bytes=104857600,cleanup.policy=compact,compression.type=producer
Topic:movie     PartitionCount:3        ReplicationFactor:1     Configs:max.message.bytes=404800

# 不带 --topics-with-overrides 选项，列出的是所有主题。
$ kafka-topics.sh --describe --zookeeper localhost:2181
Topic:animal    PartitionCount:3        ReplicationFactor:1     Configs:
        Topic: animal   Partition: 0    Leader: 0       Replicas: 0     Isr: 0
        Topic: animal   Partition: 1    Leader: 0       Replicas: 0     Isr: 0
        Topic: animal   Partition: 2    Leader: 0       Replicas: 0     Isr: 0
Topic:fruit     PartitionCount:3        ReplicationFactor:1     Configs:
        Topic: fruit    Partition: 0    Leader: 0       Replicas: 0     Isr: 0
        Topic: fruit    Partition: 1    Leader: 0       Replicas: 0     Isr: 0
        Topic: fruit    Partition: 2    Leader: 0       Replicas: 0     Isr: 0
Topic:movie     PartitionCount:3        ReplicationFactor:1     Configs:max.message.bytes=404800
        Topic: movie    Partition: 0    Leader: 0       Replicas: 0     Isr: 0
        Topic: movie    Partition: 1    Leader: 0       Replicas: 0     Isr: 0
        Topic: movie    Partition: 2    Leader: 0       Replicas: 0     Isr: 0
Topic:number    PartitionCount:3        ReplicationFactor:1     Configs:
        Topic: number   Partition: 0    Leader: 0       Replicas: 0     Isr: 0
        Topic: number   Partition: 1    Leader: 0       Replicas: 0     Isr: 0
        Topic: number   Partition: 2    Leader: 0       Replicas: 0     Isr: 0
```

### 5.2.4　修改主题【注：学习结束】

**1．修改主题级别配置**

```bash
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic fruit

# 添加或修改主题的自定义配置，多个配置项以逗号分隔。
$ kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name fruit --alter --add-config flush.messages=2,max.message.bytes=102400
Completed Updating config for entity: topic 'fruit'.

# 查看主题的自定义配置
$ kafka-configs.sh --zookeeper localhost:2181 --describe --entity-type topics --entity-name fruit
Configs for topic 'fruit' are max.message.bytes=102400,flush.messages=2

# 删除主题的自定义配置，多个配置项以逗号分隔。
$ kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name fruit -alter --delete-config flush.messages,max.message.bytes
Completed Updating config for entity: topic 'fruit'.
```

未来将废弃的修改方法
```bash
# 查看主题的自定义配置
$ kafka-topics.sh --describe --zookeeper localhost:2181 --topics-with-overrides --topic tiger
Topic:tiger     PartitionCount:3        ReplicationFactor:1     Configs:max.message.bytes=404800

# 修改主题的自定义配置
$ kafka-topics.sh --alter --zookeeper localhost:2181 --topic tiger --config max.message.bytes=204800
WARNING: Altering topic configuration from this script has been deprecated and may be removed in future releases. # 提示当前查看的方法未来将废弃
         Going forward, please use kafka-configs.sh for this functionality # 提示用新的方法来查看
Updated config for topic "tiger".

# 添加主题的自定义配置
$ kafka-topics.sh --alter --zookeeper localhost:2181 --topic tiger --config segment.bytes=209715200
WARNING: Altering topic configuration from this script has been deprecated and may be removed in future releases.
         Going forward, please use kafka-configs.sh for this functionality
Updated config for topic "tiger".

$ kafka-topics.sh --describe --zookeeper localhost:2181 --topics-with-overrides --topic tiger                                       
Topic:tiger     PartitionCount:3        ReplicationFactor:1     Configs:segment.bytes=209715200,max.message.bytes=204800

# 删除已有的自定义配置
$ kafka-topics.sh --alter --zookeeper localhost:2181 --topic tiger --delete-config segment.bytes
WARNING: Altering topic configuration from this script has been deprecated and may be removed in future releases.
         Going forward, please use kafka-configs.sh for this functionality
Updated config for topic "tiger".

$ kafka-topics.sh --describe --zookeeper localhost:2181 --topics-with-overrides --topic tiger   
Topic:tiger     PartitionCount:3        ReplicationFactor:1     Configs:max.message.bytes=204800
```

**2．增加分区**

**注意：Kafka 不支持减少分区**

```bash
$ kafka-topics.sh --alter --zookeeper localhost:2181 --topic apple --partitions 5
WARNING: If partitions are increased for a topic that has a key, the partition logic or ordering of the messages will be affected
Adding partitions succeeded!

# 查看新的分区目录
$ tree /tmp/kafka-logs/apple*
/tmp/kafka-logs/apple-0
├── 00000000000000000000.index
├── 00000000000000000000.log
├── 00000000000000000000.timeindex
└── leader-epoch-checkpoint
/tmp/kafka-logs/apple-1
├── 00000000000000000000.index
├── 00000000000000000000.log
├── 00000000000000000000.timeindex
└── leader-epoch-checkpoint
/tmp/kafka-logs/apple-2
├── 00000000000000000000.index
├── 00000000000000000000.log
├── 00000000000000000000.timeindex
└── leader-epoch-checkpoint
/tmp/kafka-logs/apple-3 # 新增的分区
├── 00000000000000000000.index
├── 00000000000000000000.log
├── 00000000000000000000.timeindex
└── leader-epoch-checkpoint
/tmp/kafka-logs/apple-4 # 新增的分区
├── 00000000000000000000.index
├── 00000000000000000000.log
├── 00000000000000000000.timeindex
└── leader-epoch-checkpoint
```

## 5.3　生产者基本操作

### 5.3.1　启动生产者【注：学习结束】

```bash
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic number

# parse.key=true 表示消息必须带一个键（key），消息的键和值（value）之间默认用制表符（tab）分隔。
$ kafka-console-producer.sh --broker-list localhost:9092 --topic number --property parse.key=true
>one    1 # 分隔符是 tab
>two	2
>three	3
>four   4
>five   5

# --property key.separator 指定消息的键和值之间的分隔符
$ kafka-console-producer.sh --broker-list localhost:9092 --topic number --property parse.key=true --property key.separator=' '

# 查看主题各分区对应的消息偏移量
$ kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic number --time -1
number:2:2 # 2 条消息
number:1:1 # 1 条消息
number:0:2 # 2 条消息
```

- [Get Offset Shell](https://cwiki.apache.org/confluence/display/KAFKA/System+Tools#SystemTools-GetOffsetShell)

### 5.3.2　创建主题【注：学习结束】

```bash
# 如果 Kafka 服务器已经启动，则停止并重新按以下方式（若主题不存在，则自动创建）启动。
cd /usr/local/kafka/current && bin/kafka-server-start.sh -daemon config/server.properties --override auto.create.topics.enable=true

# 确保主题 number 原来是不存在的，然后创建一个生产者，暂时先不要发送消息。
$ kafka-console-producer.sh --broker-list localhost:9092 --topic number

# 检查主题 number 是否自动创建
$ kafka-topics.sh --list --zookeeper localhost:2181
# 还没有创建

# 发送一条消息后会提示如下错误
$ kafka-console-producer.sh --broker-list localhost:9092 --topic number
>2
[2018-04-27 02:43:33,740] WARN [Producer clientId=console-producer] Error while fetching metadata with correlation id 1 : {number=LEADER_NOT_AVAILABLE} (org.apache.kafka.clients.NetworkClient)
[2018-04-27 02:43:33,935] WARN [Producer clientId=console-producer] Error while fetching metadata with correlation id 3 : {number=LEADER_NOT_AVAILABLE} (org.apache.kafka.clients.NetworkClient)

# 再次检查主题是否自动创建
$ kafka-topics.sh --list --zookeeper localhost:2181
number # 已经创建

# 查看主题的详细信息，默认有一个分区和一个副本。
$ kafka-topics.sh --describe --zookeeper localhost:2181 --topic number
Topic:number    PartitionCount:1        ReplicationFactor:1     Configs:
        Topic: number   Partition: 0    Leader: 0       Replicas: 0     Isr: 0

# 创建一个消费者
kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --topic number

# 继续发送消息
$ kafka-console-producer.sh --broker-list localhost:9092 --topic number
>2
[2018-04-27 02:43:33,740] WARN [Producer clientId=console-producer] Error while fetching metadata with correlation id 1 : {number=LEADER_NOT_AVAILABLE} (org.apache.kafka.clients.NetworkClient)
[2018-04-27 02:43:33,935] WARN [Producer clientId=console-producer] Error while fetching metadata with correlation id 3 : {number=LEADER_NOT_AVAILABLE} (org.apache.kafka.clients.NetworkClient)
>6 # 从这里开始
>9
>4
>3

# 消费者接收到的消息
$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --topic number
6
9
4
3
```

### 5.3.3　查看消息【注：学习结束】

```bash
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic fruit

# 查看分区目录
$ tree /tmp/kafka-logs/fruit*
/tmp/kafka-logs/fruit-0
├── 00000000000000000000.index
├── 00000000000000000000.log
├── 00000000000000000000.timeindex
└── leader-epoch-checkpoint
/tmp/kafka-logs/fruit-1
├── 00000000000000000000.index
├── 00000000000000000000.log
├── 00000000000000000000.timeindex
└── leader-epoch-checkpoint
/tmp/kafka-logs/fruit-2
├── 00000000000000000000.index
├── 00000000000000000000.log
├── 00000000000000000000.timeindex
└── leader-epoch-checkpoint

# 创建一个生产者并发送几条消息
$ kafka-console-producer.sh --broker-list localhost:9092 --topic fruit
>apple
>orange
>banana
>pear
>grape

# 查看日志文件的内容
$ kafka-run-class.sh kafka.tools.DumpLogSegments --files /tmp/kafka-logs/fruit-0/00000000000000000000.log
Dumping /tmp/kafka-logs/fruit-0/00000000000000000000.log
Starting offset: 0
baseOffset: 0 lastOffset: 0 baseSequence: -1 lastSequence: -1 producerId: -1 producerEpoch: -1 partitionLeaderEpoch: 0 isTransactional: false position: 0 CreateTime: 1524802142926 isvalid: true size: 73 magic: 2 compresscodec: NONE crc: 242267485
baseOffset: 1 lastOffset: 1 baseSequence: -1 lastSequence: -1 producerId: -1 producerEpoch: -1 partitionLeaderEpoch: 0 isTransactional: false position: 73 CreateTime: 1524802149859 isvalid: true size: 72 magic: 2 compresscodec: NONE crc: 3599915038
```

- [Dump Log Segment](https://cwiki.apache.org/confluence/display/KAFKA/System+Tools#SystemTools-DumpLogSegment)

### 5.3.4　生产者性能测试工具【注：跳过】

## 5.4　消费者基本操作

### 5.4.1　消费消息【注：学习结束】

**3．新版本消费者**

```bash
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic number

# 创建一个生产者（注意：先发送三条消息，再创建一个消费者，后观察消费偏移量）
$ kafka-console-producer.sh --broker-list localhost:9092 --topic number
>10
>20
>30
>40 # 创建消费者后从这里开始继续发送消息
>50
>60

# 创建一个消费者
$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --consumer-property client.id=my_client --topic number
40 # 实时接收了新的消息
50
60

# 查看某个主题各分区的消息偏移量
$ kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic number -time -1
number:2:2 # 尽管上述消费者只实时接收了新的消息，但是消费偏移量是在最后一条消息的位置。
number:1:2
number:0:2
```

**4．消费多主题**

```bash
# 创建两个主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic fruit
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic animal

# 创建一个消费者，订阅两个主题（注意：正则表达式内不要有空格，如 "fruit | animal" 是错误的）。
kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --whitelist "fruit|animal" 

# 创建两个生产者并发送消息
$ kafka-console-producer.sh --broker-list localhost:9092 --topic fruit
>banana
>apple
>pear

$ kafka-console-producer.sh --broker-list localhost:9092 --topic animal
>tiger
>pig
>dog

# 消费者接收到的消息
$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --whitelist "fruit|animal" 
banana
apple
pear
tiger
pig
dog
```

### 5.4.2　单播与多播【注：学习结束】

**1．单播**

```bash
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic fruit

# 创建一个生产者
$ kafka-console-producer.sh --broker-list localhost:9092 --topic fruit
>grape
>apple
>orange
>mango
>pear
>blackberry

# 创建两个相同分组的消费者（结论：一条消息只能被一个消费组内的一个消费者接收）
$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --topic fruit
grape
apple
mango
pear

$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --topic fruit
orange
blackberry
```

**2．多播**

```bash
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic fruit

# 创建一个生产者
$ kafka-console-producer.sh --broker-list localhost:9092 --topic fruit
>apple
>orange
>pear
>banana
>grape
>blackberry
>mango

# 创建三个消费者，两个属同一分组，另一个属其他分组（结论：一条消息只能被一个消费组内的
# 一个消费者接收，却可以被不同消费组内的消费者接收）。
$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group_1 --topic fruit
orange # 接收到了部分消息
pear
grape
blackberry

$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group_1 --topic fruit
apple # 接收到了部分消息
banana
mango

$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group_2 --topic fruit
apple # 接收到了全部消息
orange
pear
banana
grape
blackberry
mango
```

### 5.4.3　查看消费偏移量【注：学习结束】

**2．ConsumerGroupCommand用法**

列出所有消费组的 ID
```bash
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic number

# 创建两个消费组
kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group_1 --topic number
kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group_2 --topic number

$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list
Note: This will not show information about old Zookeeper-based consumers.
my_group_1
my_group_2
```

查看指定消费组的消费情况
```bash
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic number

# 消费组的消费情况：因为没有创建任何消费者，所以消费组不存在。
$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my_group
Note: This will not show information about old Zookeeper-based consumers.
Error: Consumer group 'my_group' does not exist.

# 创建第一个消费者
kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --topic number

# 消费组的消费情况：创建消费者后消费组存在，因为没有发送任何消息，所有消费偏移量为 0。
$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my_group
Note: This will not show information about old Zookeeper-based consumers.

TOPIC           PARTITION  CURRENT-OFFSET  LOG-END-OFFSET  LAG             CONSUMER-ID                                     HOST            CLIENT-ID
number          0          0               0               0               consumer-1-2df57799-9cc4-4c4b-bac3-77741e18326c /127.0.0.1      consumer-1
number          1          0               0               0               consumer-1-2df57799-9cc4-4c4b-bac3-77741e18326c /127.0.0.1      consumer-1
number          2          0               0               0               consumer-1-2df57799-9cc4-4c4b-bac3-77741e18326c /127.0.0.1      consumer-1

# 创建一个生产者（注意：先生产几条消息，再创建第二个消费者）
$ kafka-console-producer.sh --broker-list localhost:9092 --topic number
>10
>20
>30

# 第一个消费者“实时”消费的消息
$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --topic number
10
20
30

# 消费组的消费情况：三个分区的消费偏移量都为 1，三条消息都划归为被第一个消费者消费了。
$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my_group
Note: This will not show information about old Zookeeper-based consumers.

TOPIC           PARTITION  CURRENT-OFFSET  LOG-END-OFFSET  LAG             CONSUMER-ID                                     HOST            CLIENT-ID
number          0          1               1               0               consumer-1-2df57799-9cc4-4c4b-bac3-77741e18326c /127.0.0.1      consumer-1
number          1          1               1               0               consumer-1-2df57799-9cc4-4c4b-bac3-77741e18326c /127.0.0.1      consumer-1
number          2          1               1               0               consumer-1-2df57799-9cc4-4c4b-bac3-77741e18326c /127.0.0.1      consumer-1

# 创建第二个消费者
kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --topic number

# 消费组的消费情况：三个分区的消费偏移量都为 1，观察 CONSUMER-ID 发现，分区 0 和 1 的消息划定为被第一个消费者
# 消费了（实际上在前面的步骤中，三个分区的消息都是被第一个消费者“实时”消费的），而
# 分区 2 的消息则划归为第二个消费者（实际上第二个消费者未“实时”消费过任何消息）。
$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my_group
Note: This will not show information about old Zookeeper-based consumers.

TOPIC           PARTITION  CURRENT-OFFSET  LOG-END-OFFSET  LAG             CONSUMER-ID                                     HOST            CLIENT-ID
number          0          1               1               0               consumer-1-2df57799-9cc4-4c4b-bac3-77741e18326c /127.0.0.1      consumer-1
number          1          1               1               0               consumer-1-2df57799-9cc4-4c4b-bac3-77741e18326c /127.0.0.1      consumer-1
number          2          1               1               0               consumer-1-5aa24714-df10-4119-a3fb-957ea604c35b /127.0.0.1      consumer-1

# 继续生产消息
$ kafka-console-producer.sh --broker-list localhost:9092 --topic number
>10
>20
>30
>40 # 从这里开始
>50
>60
>70
>80
>90
>100

# 第一个消费者继续“实时”消费了五条消息 
$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --topic number
10
20
30
40 # 从这里开始继续实时消费
60
70
90
100

# 第二个消费者“实时”消费了两条消息
$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --consumer-property group.id=my_group --topic number
50
80

# 结论：在消费组 G1 内，如果消费者 C1 被分配到某个主题分区 P1，那么，不管 P1 内的
# 消息是否被 C1 “实时”消费过，P1 内的所有消息都视 C1 为其消费者。
$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my_group
Note: This will not show information about old Zookeeper-based consumers.

TOPIC           PARTITION  CURRENT-OFFSET  LOG-END-OFFSET  LAG             CONSUMER-ID                                     HOST            CLIENT-ID
number          0          4               4               0               consumer-1-2df57799-9cc4-4c4b-bac3-77741e18326c /127.0.0.1      consumer-1
number          1          3               3               0               consumer-1-2df57799-9cc4-4c4b-bac3-77741e18326c /127.0.0.1      consumer-1
number          2          3               3               0               consumer-1-5aa24714-df10-4119-a3fb-957ea604c35b /127.0.0.1      consumer-1
```

删除消费组
```bash
$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete --group my_group
Note: This will not show information about old Zookeeper-based consumers.
Deletion of requested consumer groups ('my_group') was successful.

$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list
Note: This will not show information about old Zookeeper-based consumers.
```

### 5.4.4　消费者性能测试工具【注：跳过】

## 5.5　配置管理

### 5.5.1　主题级别配置【注：学习结束】

**1．查看配置**

```bash
# 创建带自定义配置的主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic tiger --config max.message.bytes=404800

# 查看自定义配置
$ kafka-configs.sh --zookeeper localhost:2181 --describe --entity-type topics --entity-name tiger
Configs for topic 'tiger' are max.message.bytes=404800
```

**2．增加/修改配置**

```bash
# 添加或修改自定义配置（不存在是添加，已存在是修改）
$ kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name tiger --alter --add-config flush.messages=2,max.message.bytes=102400
Completed Updating config for entity: topic 'tiger'.

$ kafka-configs.sh --zookeeper localhost:2181 --describe --entity-type topics --entity-name tiger                                                    
Configs for topic 'tiger' are max.message.bytes=102400,flush.messages=2
```

**3．删除配置**

```bash
# 删除自定义配置
$ kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name tiger --alter --delete-config flush.messages,max.message.bytes
Completed Updating config for entity: topic 'tiger'.

$ kafka-configs.sh --zookeeper localhost:2181 --describe --entity-type topics --entity-name tiger                                              
Configs for topic 'tiger' are # 已删除
```

### 5.5.2　代理级别设置【注：跳过】

### 5.5.3　客户端/用户级别配置【注：跳过】

## 5.6　分区操作【注：跳过】

```bash
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 3 --topic animal

# 查看主题详情
$ kafka-topics.sh --describe --zookeeper localhost:2181 --topic animal
Topic:animal    PartitionCount:3        ReplicationFactor:3     Configs:
        Topic: animal   Partition: 0    Leader: 2       Replicas: 2,0,1 Isr: 2,0,1
        Topic: animal   Partition: 1    Leader: 0       Replicas: 0,1,2 Isr: 0,1,2
        Topic: animal   Partition: 2    Leader: 1       Replicas: 1,2,0 Isr: 1,2,0

# 查看几个节点的 PID
$ netstat -tulnp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp6       0      0 :::9092                 :::*                    LISTEN      16349/java          
tcp6       0      0 :::9093                 :::*                    LISTEN      30014/java # 这是第 2 个节点          
tcp6       0      0 :::9094                 :::*                    LISTEN      30339/java          

# 关闭节点 2
$ kill -9 30014

# 重新查看主题详情
$ kafka-topics.sh --describe --zookeeper localhost:2181 --topic animal
Topic:animal    PartitionCount:3        ReplicationFactor:3     Configs:
        Topic: animal   Partition: 0    Leader: 0       Replicas: 2,0,1 Isr: 0
        Topic: animal   Partition: 1    Leader: 0       Replicas: 0,1,2 Isr: 0
        Topic: animal   Partition: 2    Leader: 0       Replicas: 1,2,0 Isr: 0
```

## 5.7　连接器基本操作

### 5.7.1　独立模式

**1．Source连接器【注：把数据从文件发送到 Kafka 主题】**

创建测试目录和文件
```bash
mkdir -p /tmp/kafka-connect/source

# 写入数据
$ cat > /tmp/kafka-connect/source/test.txt << EOF
> apple
> banana
> orange
> EOF
```

编辑 Source 连接器的配置文件
```
# connect-file-source.properties
name=local-file-source
connector.class=FileStreamSource
tasks.max=1
file=/tmp/kafka-connect/source/test.txt
topic=fruit
```

创建一个 Source 连接器
```bash
cd /usr/local/kafka/current && bin/connect-standalone.sh config/connect-standalone.properties config/connect-file-source.properties
## 启动日志
# 创建连接器
[2018-04-27 07:55:19,733] INFO Created connector local-file-source (org.apache.kafka.connect.cli.ConnectStandalone:104)
# 自动创建一个生产者来发送消息（注意：提示主题不存在，服务器会自动创建）
[2018-04-27 07:55:19,781] WARN [Producer clientId=producer-1] Error while fetching metadata with correlation id 1 : {fruit=LEADER_NOT_AVAILABLE} (org.apache.kafka.clients.NetworkClient:882)
```

确认自动创建了主题
```bash
# 列出所有主题 ID
$ kafka-topics.sh --list --zookeeper localhost:2181
fruit

# 查看主题详情
$ kafka-topics.sh --describe --zookeeper localhost:2181 --topic fruit
Topic:fruit     PartitionCount:1        ReplicationFactor:1     Configs:
        Topic: fruit    Partition: 0    Leader: 0       Replicas: 0     Isr: 0

# 查看主题分区目录
$ tree /tmp/kafka-logs/fruit*
/tmp/kafka-logs/fruit-0
├── 00000000000000000000.index
├── 00000000000000000000.log
├── 00000000000000000000.timeindex
└── leader-epoch-checkpoint
```

确认从文件导入了数据到 Kafka 服务器
```bash
$ kafka-run-class.sh kafka.tools.DumpLogSegments --files /tmp/kafka-logs/fruit-0/00000000000000000000.log --print-data-log            
Dumping /tmp/kafka-logs/fruit-0/00000000000000000000.log
Starting offset: 0
offset: 0 position: 0 CreateTime: 1524815719756 isvalid: true keysize: 30 valuesize: 63 magic: 2 compresscodec: NONE producerId: -1 producerEpoch: -1 sequence: -1 isTransactional: false headerKeys: [] key: {"schema":null,"payload":null} payload: {"schema":{"type":"string","optional":false},"payload":"apple"}
offset: 1 position: 0 CreateTime: 1524815719758 isvalid: true keysize: 30 valuesize: 64 magic: 2 compresscodec: NONE producerId: -1 producerEpoch: -1 sequence: -1 isTransactional: false headerKeys: [] key: {"schema":null,"payload":null} payload: {"schema":{"type":"string","optional":false},"payload":"banana"}
offset: 2 position: 0 CreateTime: 1524815719758 isvalid: true keysize: 30 valuesize: 64 magic: 2 compresscodec: NONE producerId: -1 producerEpoch: -1 sequence: -1 isTransactional: false headerKeys: [] key: {"schema":null,"payload":null} payload: {"schema":{"type":"string","optional":false},"payload":"orange"}
```

**2．Sink连接器【注：把消息从 Kafka 主题输出到文件】**

示例一：创建一个 Sink 连接器（使用上一小节产生的主题消息作为测试数据）

创建测试目录和文件
```bash
mkdir -p /tmp/kafka-connect/sink && touch /tmp/kafka-connect/sink/test.txt
```

编辑 Sink 连接器的配置文件
```
# connect-file-sink.properties
name=local-file-sink
connector.class=FileStreamSink
tasks.max=1
file=/tmp/kafka-connect/sink/test.txt
topics=fruit
```

创建一个 Sink 连接器
```bash
cd /usr/local/kafka/current && bin/connect-standalone.sh config/connect-standalone.properties config/connect-file-sink.properties
## 启动日志
[2018-04-27 08:34:33,971] INFO Created connector local-file-sink (org.apache.kafka.connect.cli.ConnectStandalone:104)
# 自动创建一个消费者来接收消息
[2018-04-27 08:34:34,650] INFO [Consumer clientId=consumer-1, groupId=connect-local-file-sink] Discovered group coordinator centos-s-2vcpu-4gb-sgp1-01:9092 (id: 2147483647 rack: null) (org.apache.kafka.clients.consumer.internals.AbstractCoordinator:605)
[2018-04-27 08:34:34,659] INFO [Consumer clientId=consumer-1, groupId=connect-local-file-sink] Revoking previously assigned partitions [] (org.apache.kafka.clients.consumer.internals.ConsumerCoordinator:411)
[2018-04-27 08:34:34,659] INFO [Consumer clientId=consumer-1, groupId=connect-local-file-sink] (Re-)joining group (org.apache.kafka.clients.consumer.internals.AbstractCoordinator:442)
[2018-04-27 08:34:34,731] INFO [Consumer clientId=consumer-1, groupId=connect-local-file-sink] Successfully joined group with generation 1 (org.apache.kafka.clients.consumer.internals.AbstractCoordinator:409)
[2018-04-27 08:34:34,732] INFO [Consumer clientId=consumer-1, groupId=connect-local-file-sink] Setting newly assigned partitions [fruit-0] (org.apache.kafka.clients.consumer.internals.ConsumerCoordinator:256)
[2018-04-27 08:34:34,762] INFO [Consumer clientId=consumer-1, groupId=connect-local-file-sink] Resetting offset for partition fruit-0 to offset 0. (org.apache.kafka.clients.consumer.internals.Fetcher:561)
```

确认连接器把消息写入了指定文件
```bash
$ cat /tmp/kafka-connect/sink/test.txt
apple
banana
orange
```

示例二：创建两个 Sink 连接器

配置文件
```
# connect-file-sink-1.properties
name=local-file-sink-1
connector.class=FileStreamSink
tasks.max=1
file=/tmp/kafka-connect/sink/test1.txt
topics=fruit

# connect-file-sink-2.properties
name=local-file-sink-2
connector.class=FileStreamSink
tasks.max=1
file=/tmp/kafka-connect/sink/test2.txt
topics=fruit
```

```bash
$ cd /usr/local/kafka/current && bin/connect-standalone.sh config/connect-standalone.properties config/connect-file-sink-1.properties config/connect-file-sink-2.properties
# 从启动日志可以看出，自动创建了两个消费组，每个消费组有一个消费者，它们可以消费同一条消息。
[2018-04-27 08:46:38,139] INFO [Consumer clientId=consumer-1, groupId=connect-local-file-sink-1] Discovered group coordinator centos-s-2vcpu-4gb-sgp1-01:9092 (id: 2147483647 rack: null) (org.apache.kafka.clients.consumer.internals.AbstractCoordinator:605)
[2018-04-27 08:46:38,143] INFO [Consumer clientId=consumer-1, groupId=connect-local-file-sink-1] Revoking previously assigned partitions [] (org.apache.kafka.clients.consumer.internals.ConsumerCoordinator:411)
[2018-04-27 08:46:38,143] INFO [Consumer clientId=consumer-1, groupId=connect-local-file-sink-1] (Re-)joining group (org.apache.kafka.clients.consumer.internals.AbstractCoordinator:442)
[2018-04-27 08:46:38,152] INFO [Consumer clientId=consumer-2, groupId=connect-local-file-sink-2] Discovered group coordinator centos-s-2vcpu-4gb-sgp1-01:9092 (id: 2147483647 rack: null) (org.apache.kafka.clients.consumer.internals.AbstractCoordinator:605)
[2018-04-27 08:46:38,167] INFO [Consumer clientId=consumer-1, groupId=connect-local-file-sink-1] Successfully joined group with generation 1 (org.apache.kafka.clients.consumer.internals.AbstractCoordinator:409)
[2018-04-27 08:46:38,168] INFO [Consumer clientId=consumer-1, groupId=connect-local-file-sink-1] Setting newly assigned partitions [fruit-0] (org.apache.kafka.clients.consumer.internals.ConsumerCoordinator:256)
[2018-04-27 08:46:38,173] INFO [Consumer clientId=consumer-2, groupId=connect-local-file-sink-2] Revoking previously assigned partitions [] (org.apache.kafka.clients.consumer.internals.ConsumerCoordinator:411)
[2018-04-27 08:46:38,174] INFO [Consumer clientId=consumer-2, groupId=connect-local-file-sink-2] (Re-)joining group (org.apache.kafka.clients.consumer.internals.AbstractCoordinator:442)
[2018-04-27 08:46:38,196] INFO [Consumer clientId=consumer-2, groupId=connect-local-file-sink-2] Successfully joined group with generation 1 (org.apache.kafka.clients.consumer.internals.AbstractCoordinator:409)
[2018-04-27 08:46:38,196] INFO [Consumer clientId=consumer-2, groupId=connect-local-file-sink-2] Setting newly assigned partitions [fruit-0] (org.apache.kafka.clients.consumer.internals.ConsumerCoordinator:256)
[2018-04-27 08:46:38,201] INFO [Consumer clientId=consumer-1, groupId=connect-local-file-sink-1] Resetting offset for partition fruit-0 to offset 0. (org.apache.kafka.clients.consumer.internals.Fetcher:561)
[2018-04-27 08:46:38,224] INFO [Consumer clientId=consumer-2, groupId=connect-local-file-sink-2] Resetting offset for partition fruit-0 to offset 0. (org.apache.kafka.clients.consumer.internals.Fetcher:561)
```

确认消息写入了指定文件
```bash
$ cat /tmp/kafka-connect/sink/test1.txt 
apple
banana
orange
$ cat /tmp/kafka-connect/sink/test2.txt
apple
banana
orange
```
