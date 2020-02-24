[toc]

# Kafka Vert.x Client

https://vertx.io/docs/vertx-kafka-client/java/

https://github.com/vert-x3/vertx-kafka-client

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>vertx-kafka</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <dependency>
            <groupId>io.vertx</groupId>
            <artifactId>vertx-kafka-client</artifactId>
            <version>3.5.1</version>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.1</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                    <encoding>utf-8</encoding>
                </configuration>
            </plugin>
        </plugins>
    </build>

</project>
```

## 接收消息

```java
import io.vertx.core.Vertx;
import io.vertx.kafka.client.common.TopicPartition;
import io.vertx.kafka.client.consumer.KafkaConsumer;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

/**
 * 接收消息
 */
public class ReceiveMessagesExample {

    public static void main(String[] args) throws Exception {

        // 使用 Properties 进行配置，推荐这种方式。
        Properties config = new Properties();
        config.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "128.199.91.70:9092");
        config.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        config.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        config.put(ConsumerConfig.GROUP_ID_CONFIG, "my_group"); // 加入一个消费组
        config.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
        config.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "false");

        // 使用 Map 进行配置
        /*Map<String, String> config = new HashMap<>();
        config.put("bootstrap.servers", "128.199.91.70:9092");
        config.put("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
        config.put("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
        config.put("group.id", "my_group");
        config.put("auto.offset.reset", "earliest");
        config.put("enable.auto.commit", "false");*/

        KafkaConsumer<String, String> consumer = KafkaConsumer.create(Vertx.vertx(), config);

        consumer.handler(record -> {
            System.out.println("Processing key=" + record.key() +
                    ",value=" + record.value() +
                    ",partition=" + record.partition() +
                    ",offset=" + record.offset());
        });

        // 订阅单个主题，不带回调函数。
        // consumer.subscribe("number");
        // 订阅单个主题，带回调函数。
        /*consumer.subscribe("number", ar -> {
            if (ar.succeeded()) {
                System.out.println("subscribed");
            } else {
                System.out.println("Could not subscribe " + ar.cause().getMessage());
            }
        });*/

        // 订阅多个主题，带回调函数。
        Set<String> topics = new HashSet<>();
        topics.add("fruit");
        topics.add("animal");
        topics.add("number");
        consumer.subscribe(topics, ar -> {
            if (ar.succeeded()) {
                System.out.println("subscribed");
            } else {
                System.out.println("Could not subscribe " + ar.cause().getMessage());
            }
        });
        // 订阅多个主题，不带回调函数。
        // consumer.subscribe(topics);

        // 主题分区分配完成时会触发
        consumer.partitionsAssignedHandler(topicPartitions -> {
            for (TopicPartition topicPartition : topicPartitions) {
                System.out.println("Partitions assigned " + topicPartition.getTopic() + " " + topicPartition.getPartition());
            }
        });

        // 主题分区重新分配时会触发，有消费者进入或退出消费组，或新增分区都会导致重新分配。
        consumer.partitionsRevokedHandler(topicPartitions -> {
            for (TopicPartition topicPartition : topicPartitions) {
                System.out.println("Partitions revoked " + topicPartition.getTopic() + " " + topicPartition.getPartition());
            }
        });

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

测试数据
```bash
# 创建主题
$ kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic animal 
Created topic "animal".
$ kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic fruit
Created topic "fruit".
$ kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic number
Created topic "number".

# 程序运行后执行以下操作

# 发送消息
kafka-console-producer.sh --broker-list 128.199.91.70:9092 --topic number
>10
>20
>30

$ kafka-console-producer.sh --broker-list 128.199.91.70:9092 --topic fruit
>apple  
>pear
>banana

$ kafka-console-producer.sh --broker-list 128.199.91.70:9092 --topic animal
>dog
>cat
>tiger

# 加入一个新的消费者
kafka-console-consumer.sh --bootstrap-server 128.199.91.70:9092 --consumer-property group.id=my_group --whitelist "fruit|animal|number"
```

输出结果
```
subscribed
Partitions assigned number 0 # 三个分区都分到了
Partitions assigned number 1
Partitions assigned fruit 2
Partitions assigned fruit 0
Partitions assigned number 2
Partitions assigned animal 2
Partitions assigned fruit 1
Partitions assigned animal 0
Partitions assigned animal 1
# 在控制台发送消息
Processing key=null,value=10,partition=0,offset=0 # 全部消息都收到了
Processing key=null,value=20,partition=2,offset=0
Processing key=null,value=30,partition=1,offset=0
Processing key=null,value=apple,partition=0,offset=0
Processing key=null,value=pear,partition=2,offset=0
Processing key=null,value=banana,partition=1,offset=0
Processing key=null,value=dog,partition=1,offset=0
Processing key=null,value=cat,partition=0,offset=0
Processing key=null,value=tiger,partition=2,offset=0
# 在控制台加入一个新的消费者
Partitions revoked fruit 0 # 触发分区重新分配事件
Partitions revoked animal 0
Partitions revoked animal 1
Partitions revoked number 1
Partitions revoked number 0
Partitions revoked fruit 1
Partitions revoked number 2
Partitions revoked fruit 2
Partitions revoked animal 2
Partitions assigned animal 0 # 只分到了两个分区
Partitions assigned fruit 1
Partitions assigned fruit 0
Partitions assigned number 1
Partitions assigned number 0
Partitions assigned animal 1
Processing key=null,value=30,partition=1,offset=0 # 只收到了自己那些分区的消息
Processing key=null,value=10,partition=0,offset=0
Processing key=null,value=banana,partition=1,offset=0
Processing key=null,value=apple,partition=0,offset=0
Processing key=null,value=cat,partition=0,offset=0
Processing key=null,value=dog,partition=1,offset=0
```

### 指定特定的主题分区

```java
import io.vertx.core.Vertx;
import io.vertx.kafka.client.common.TopicPartition;
import io.vertx.kafka.client.consumer.KafkaConsumer;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

/**
 * 向服务器申请分配特定的主题分区
 */
public class SpecificPartitionsExample {

    public static void main(String[] args) throws Exception {

        Properties config = new Properties();
        config.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "159.65.128.10:9092");
        config.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        config.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        config.put(ConsumerConfig.GROUP_ID_CONFIG, "my_group"); // 加入一个消费组
        config.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
        config.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "false");

        KafkaConsumer<String, String> consumer = KafkaConsumer.create(Vertx.vertx(), config);

        consumer.handler(record -> {
            System.out.println("Processing key=" + record.key() +
                    ",value=" + record.value() +
                    ",partition=" + record.partition() +
                    ",offset=" + record.offset());
        });

        // 自己想要被分配到的主题分区
        Set<TopicPartition> topicPartitions = new HashSet<>();
        topicPartitions.add(new TopicPartition()
                .setTopic("number")
                .setPartition(0));

        // 向服务器申请表把自己分配到特定的主题分区
        consumer.assign(topicPartitions, done -> {
            if (done.succeeded()) {
                System.out.println("Partition assigned");
                // 查看被分配到的主题分区
                consumer.assignment(done1 -> {
                    if (done1.succeeded()) {
                        for (TopicPartition topicPartition : done1.result()) {
                            System.out.println(topicPartition.getTopic() + " " + topicPartition.getPartition());
                        }
                    }
                });
            }
        });


    }
}
```

测试数据
```bash
## 运行程序前执行以下操作
# 创建主题，包含三个分区。
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic number

# 启动一个生产者
kafka-console-producer.sh --broker-list 159.65.128.10:9092 --topic number

## 运行程序后执行以下操作

# 发送消息，观察输出结果。
$ kafka-console-producer.sh --broker-list 159.65.128.10:9092 --topic number
>10
>20
>30
>40
>50
```

输出结果
```bash
Partition assigned
number 0 # 虽然有三个分区，但是只分到了分区 0。
# 发送消息后的输出
Processing key=null,value=10,partition=0,offset=0 # 只收到了部分消息，这些消息属于分区 0。
Processing key=null,value=40,partition=0,offset=1
```

创建生产者并发送消息
```java
import io.vertx.core.Vertx;
import io.vertx.kafka.client.producer.KafkaProducer;
import io.vertx.kafka.client.producer.KafkaProducerRecord;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by yuhuihuang on 18/04/2018.
 */
public class HelloWorld {

    public static void main(String[] args) throws InterruptedException {

        Map<String, String> config = new HashMap<>();
        config.put("bootstrap.servers", "localhost:9092");
        config.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        config.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        config.put("acks", "1");

        // use producer for interacting with Apache Kafka
        KafkaProducer<String, String> producer = KafkaProducer.create(Vertx.vertx(), config);

        for (int i = 0; i < 5; i++) {
            // only topic and message value are specified, round robin on destination partitions
            KafkaProducerRecord<String, String> record =
                    KafkaProducerRecord.create("test", "message_" + i);
            producer.write(record);
        }

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

验证结果
```bash
$ bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
message_0
message_1
message_2
message_3
message_4
```

## 获取特定主题的分区信息

测试数据
```
## 运行程序前执行以下操作
# 创建主题，包含三个分区。
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic number
```

```java
import io.vertx.core.Vertx;
import io.vertx.kafka.client.common.PartitionInfo;
import io.vertx.kafka.client.consumer.KafkaConsumer;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.util.Properties;

/**
 * 获取主题分区信息
 */
public class GetTopicPartitionInfo {

    public static void main(String[] args) throws Exception {

        Properties config = new Properties();
        config.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "159.65.128.10:9092");
        config.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        config.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        config.put(ConsumerConfig.GROUP_ID_CONFIG, "my_group"); // 加入一个消费组
        config.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
        config.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "false");

        KafkaConsumer<String, String> consumer = KafkaConsumer.create(Vertx.vertx(), config);

        consumer.partitionsFor("number", ar -> {
            if (ar.succeeded()) {
                for (PartitionInfo partitionInfo : ar.result()) {
                    System.out.println(partitionInfo);
                }
            }
        });
    }
}
```

输出结果
```bash
PartitionInfo{topic=number, partition=2, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}
PartitionInfo{topic=number, partition=1, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}
PartitionInfo{topic=number, partition=0, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}
```

## 获取主题的分区信息

测试数据
```bash
## 程序运行前执行以下操作
# 创建三个主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic animal

kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic fruit

kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic number
```


```java
import io.vertx.core.Vertx;
import io.vertx.kafka.client.common.PartitionInfo;
import io.vertx.kafka.client.consumer.KafkaConsumer;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * 获取主题的分区信息
 */
public class GetTopicPartitionInfo {

    public static void main(String[] args) throws Exception {

        Properties config = new Properties();
        config.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "159.65.128.10:9092");
        config.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        config.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        config.put(ConsumerConfig.GROUP_ID_CONFIG, "my_group"); // 加入一个消费组
        config.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
        config.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "false");

        KafkaConsumer<String, String> consumer = KafkaConsumer.create(Vertx.vertx(), config);

        consumer.partitionsFor("number", ar -> {
            if (ar.succeeded()) {
                System.out.println("获取指定主题的分区信息");
                for (PartitionInfo partitionInfo : ar.result()) {
                    System.out.println(partitionInfo);
                }
            }
        });

        consumer.listTopics(ar -> {
            if (ar.succeeded()) {
                System.out.println("获取所有主题的分区信息");
                Map<String, List<PartitionInfo>> map = ar.result();
                map.forEach((topic, partitions) -> {
                    System.out.println("topic = " + topic);
                    System.out.println("partitions = " + map.get(topic));
                });
            }
        });
    }
}
```

输出结果
```bash
获取指定主题的分区信息
PartitionInfo{topic=number, partition=2, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}
PartitionInfo{topic=number, partition=1, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}
PartitionInfo{topic=number, partition=0, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}
获取所有主题的分区信息
topic = number
partitions = [PartitionInfo{topic=number, partition=2, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=number, partition=1, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=number, partition=0, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}]
topic = color
partitions = [PartitionInfo{topic=color, partition=0, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}]
topic = fruit
partitions = [PartitionInfo{topic=fruit, partition=2, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=fruit, partition=1, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=fruit, partition=0, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}]
topic = animal
partitions = [PartitionInfo{topic=animal, partition=2, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=animal, partition=1, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=animal, partition=0, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}]
topic = __consumer_offsets
partitions = [PartitionInfo{topic=__consumer_offsets, partition=23, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=41, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=32, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=8, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=17, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=44, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=35, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=26, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=11, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=29, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=38, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=47, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=20, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=2, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=5, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=14, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=46, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=49, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=40, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=4, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=13, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=22, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=31, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=16, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=7, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=43, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=25, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=34, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=10, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=37, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=1, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=19, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=28, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=45, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=36, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=27, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=9, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=18, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=21, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=48, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=12, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=3, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=30, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=39, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=15, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=42, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=24, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=33, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=6, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}, PartitionInfo{topic=__consumer_offsets, partition=0, inSyncReplicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}], leader=Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}, replicas=[Node{id=0, host=159.65.128.10, hasRack=false, idString=0, isEmpty=false, port=9092, rack=null}]}]
```

## 设置消息偏移量

测试数据
```bash
## 程序运行前执行以下操作
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic number

# 发送消息
$ kafka-console-producer.sh --broker-list 159.65.128.10:9092 --topic number
>10
>20
>30
>40
>50
>60
>70
```

```java
import io.vertx.core.Vertx;
import io.vertx.kafka.client.common.TopicPartition;
import io.vertx.kafka.client.consumer.KafkaConsumer;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.util.Collections;
import java.util.Properties;

/**
 * 设置接收消息的起始位置
 */
public class SeekTopicPartition {

    public static void main(String[] args) throws Exception {

        Properties config = new Properties();
        config.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "159.65.128.10:9092");
        config.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        config.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        config.put(ConsumerConfig.GROUP_ID_CONFIG, "my_group"); // 加入一个消费组
        config.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
        config.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "false");

        KafkaConsumer<String, String> consumer = KafkaConsumer.create(Vertx.vertx(), config);

        // 定义一个主题分区
        TopicPartition topicPartition = new TopicPartition()
                .setTopic("number")
                .setPartition(0);

        // 向服务器申请接收特定主题分区的消息
        consumer.assign(topicPartition, done -> {
            // 申请成功
            if (done.succeeded()) {
                System.out.println("Partition assigned");
                // 查看申请到的分区信息
                consumer.assignment(done1 -> {
                    if (done1.succeeded()) {
                        for (TopicPartition topicPartition1 : done1.result()) {
                            System.out.println(topicPartition1.getTopic() + " " + topicPartition1.getPartition());
                        }
                    }
                });
            }
        });

        // 设置从消息队列的头部开始接收消息
        consumer.seekToBeginning(Collections.singleton(topicPartition), done -> {
            if (done.succeeded()) {
                System.out.println("Seeking done");
            }
        });

        // 接收消息
        consumer.handler(record -> {
            System.out.println("Processing key=" + record.key() +
                    ",value=" + record.value() +
                    ",partition=" + record.partition() +
                    ",offset=" + record.offset());
        });
    }
}
```


输出结果
```bash
Partition assigned
Seeking done
number 0
Processing key=null,value=10,partition=0,offset=0
Processing key=null,value=40,partition=0,offset=1
Processing key=null,value=70,partition=0,offset=2
```

