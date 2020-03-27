[toc]

# 第 7 章 Kafka Streams

## 7.3 Kafka Streams API 介绍

### 7.3.1 KStream 与 KTable

**KStream 示例**

```java
package $7_3_1;

import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.StreamsConfig;
import org.apache.kafka.streams.kstream.KStream;
import org.apache.kafka.streams.kstream.KStreamBuilder;

import java.util.Properties;

/**
 * 7.3.1 创建 KStream 日志流并输出数据集到控制台
 */
public class KStreamOutputDemo {

    public static void main(String[] args) throws Exception {

        Properties config = new Properties();
        // Streams 的 ID 将作为其内置消费组的 ID
        config.put(StreamsConfig.APPLICATION_ID_CONFIG, "KStreamOutputDemo");
        config.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, "206.189.144.39:9092");
        config.put(StreamsConfig.KEY_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        config.put(StreamsConfig.VALUE_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        // 配置内部消费者的属性
        config.put(StreamsConfig.consumerPrefix(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG), "earliest");

        KStreamBuilder builder = new KStreamBuilder();
        KStream<String, String> stream = builder.stream("apple");
        stream.print();

        KafkaStreams streams = new KafkaStreams(builder, config);
        streams.start();

        Thread.sleep(Integer.MAX_VALUE);
        // streams.close();
    }
}
```

测试结果
```bash
# 创建主题（注意：只有一个分区）
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic apple

# 创建一个生产者并发送三条消息（注意：先不要运行程序）
# 要求有 key，key-value 之间的分隔符是空格
$ kafka-console-producer.sh --broker-list 206.189.144.39:9092 --topic apple --property parse.key=true --property key.separator=" "
>a1 10
>a2 20
>a3 30

## 开始运行程序

# 程序输出
[KSTREAM-SOURCE-0000000000]: a1 , 10
[KSTREAM-SOURCE-0000000000]: a2 , 20
[KSTREAM-SOURCE-0000000000]: a3 , 30

# 继续发送消息
>a1 100
>a2 200
>a3 300

# 程序继续输出
[KSTREAM-SOURCE-0000000000]: a1 , 100
[KSTREAM-SOURCE-0000000000]: a2 , 200
[KSTREAM-SOURCE-0000000000]: a3 , 300

# 列出所有消费组的 ID
$ kafka-consumer-groups.sh --bootstrap-server 206.189.144.39:9092 --list       
Note: This will not show information about old Zookeeper-based consumers.
KStreamOutputDemo # 可以看到，Streams 的 ID 是其内置消费组的 ID

## 停止运行程序

# 继续发送消息（注意：发送三条 key 相同的消息）
>a4 101
>a4 202
>a4 303

## 再次运行程序
[KSTREAM-SOURCE-0000000000]: a4 , 101 # key 相同的消息也全部输出
[KSTREAM-SOURCE-0000000000]: a4 , 202
[KSTREAM-SOURCE-0000000000]: a4 , 303
```

**KTable 示例**

```java
package $7_3_1;

import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.StreamsConfig;
import org.apache.kafka.streams.kstream.KStreamBuilder;
import org.apache.kafka.streams.kstream.KTable;

import java.util.Properties;

/**
 * 7.3.1 创建 KTable 更新流并输出数据集到控制台
 */
public class KTableOutputDemo {

    public static void main(String[] args) throws Exception {

        Properties config = new Properties();
        config.put(StreamsConfig.APPLICATION_ID_CONFIG, "KTableOutputDemo");
        config.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, "206.189.144.39:9092");
        config.put(StreamsConfig.KEY_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        config.put(StreamsConfig.VALUE_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        config.put(StreamsConfig.consumerPrefix(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG), "earliest");

        KStreamBuilder builder = new KStreamBuilder();
        KTable<String, String> table = builder.table("dog", "my_store");
        table.print();

        KafkaStreams streams = new KafkaStreams(builder, config);
        streams.start();

        Thread.sleep(Integer.MAX_VALUE);
        // streams.close();
    }
}
```

测试结果
```bash
# 创建主题
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1partitions 1 --topic dog

# 创建一个生产者并发送几条消息（注意：先不要运行程序）
$ kafka-console-producer.sh --broker-list 206.189.144.39:9092 --topic dog --property parse.key=true --property key.separator=" "      
>d1 100 # 消息的 key 相同
>d1 200
>d1 300
>d2 111 # 消息的 key 相同
>d2 222
>d2 333

# 程序输出
[KTABLE-SOURCE-0000000001]: d1 , (300<-null) # key 为 d1 的只输出最后一条消息
[KTABLE-SOURCE-0000000001]: d2 , (333<-null) # 同上

## 停止并重新运行程序

# 连续发送三条消息
>d3 100 # 消息的 key 相同
>d3 20
>d3 56

# 稍等一会儿，只输出 d3 的最后一条消息
[KTABLE-SOURCE-0000000001]: d3 , (56<-null)
```

### 7.3.3 连接操作

Kafka Streams 流连接与 SQL 表连接类比
Kafka Streams | SQL
---|---
join() | INNER JOIN
leftJoin() | LEFT OUTER JOIN
outerJoin() | LEFT OUTER JOIN + RIGHT OUTER JOIN

#### KStream 与 KStream连接

```java
package $7_3_3;

import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.StreamsConfig;
import org.apache.kafka.streams.kstream.JoinWindows;
import org.apache.kafka.streams.kstream.KStream;
import org.apache.kafka.streams.kstream.KStreamBuilder;

import java.util.Properties;
import java.util.concurrent.TimeUnit;

/**
 * 7.3.3 KStream 的连接操作
 */
public class StreamJoinDemo {

    public static void main(String[] args) throws Exception {

        Properties config = new Properties();
        config.put(StreamsConfig.APPLICATION_ID_CONFIG, "StreamJoinDemo"); // "StreamLeftJoinDemo", "StreamOuterJoinDemo"
        config.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        config.put(StreamsConfig.KEY_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        config.put(StreamsConfig.VALUE_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        config.put(StreamsConfig.consumerPrefix(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG), "earliest");

        KStreamBuilder builder = new KStreamBuilder();
        // 将要进行连接操作的两个数据流
        KStream<String, String> leftStream = builder.stream("left-stream");
        KStream<String, String> rightStream = builder.stream("right-stream");

        KafkaStreams streams = new KafkaStreams(builder, config);
        streams.start();

        KStream<String, String> joinedStream = leftStream.join(rightStream, // leftJoin(), outerJoin
                (leftValue, rightValue) -> "[" + leftValue + ", " + rightValue + "]", JoinWindows.of(TimeUnit.MINUTES.toMillis(5)));
        joinedStream.print();

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

**join()**

[预测结果](http://kafka.apache.org/11/javadoc/org/apache/kafka/streams/kstream/KStream.html#join-org.apache.kafka.streams.kstream.KStream-org.apache.kafka.streams.kstream.ValueJoiner-org.apache.kafka.streams.kstream.JoinWindows-)
this | other | result
---|---|---
<K1:A> | - | -
<K2:B> | <K2:b> | <K2:ValueJoiner(B,b)>
- | <K3:c> | -

测试结果
```bash
# 创建两个主题（注意：分区策略要相同，为了简化测试，都只分配一个分区）
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic left-stream
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic right-stream

# 创建两个对应主题的生产者，按预测结果的表格来发送消息。
kafka-console-producer.sh --broker-list localhost:9092 --topic left-stream --property parse.key=true --property key.separator=" "
>K1 A
>K2 B

kafka-console-producer.sh --broker-list localhost:9092 --topic right-stream --property parse.key=true --property key.separator=" "
>K2 b
>K3 c

## 开始运行程序
[KSTREAM-MERGE-0000000006]: K2 , [B, b] # 与预测结果相符
```

**leftJoin()**

[预测结果](http://kafka.apache.org/11/javadoc/org/apache/kafka/streams/kstream/KStream.html#leftJoin-org.apache.kafka.streams.kstream.KStream-org.apache.kafka.streams.kstream.ValueJoiner-org.apache.kafka.streams.kstream.JoinWindows-)
this | other | result
---|---|---
<K1:A> | - | <K1:ValueJoiner(A,null)>
<K2:B> | <K2:b> | <K2:ValueJoiner(B,b)>
- | <K3:c> | -

测试结果
```bash
# 创建两个主题（注意：分区策略要相同，为了简化测试，都只分配一个分区）
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic left-stream
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic right-stream

# 创建两个对应主题的生产者，按预测结果的表格来发送消息（注意：先发送 right-stream 的消息，因为只有 left-stream 有新的数据记录时才会触发连接操作！！！）。
kafka-console-producer.sh --broker-list localhost:9092 --topic left-stream --property parse.key=true --property key.separator=" "
>
kafka-console-producer.sh --broker-list localhost:9092 --topic right-stream --property parse.key=true --property key.separator=" "
>K2 b
>K3 c

## 开始运行程序

# 开始发送消息，观察程序的输出结果。
kafka-console-producer.sh --broker-list localhost:9092 --topic left-stream --property parse.key=true --property key.separator=" "
>K1 A
>K2 B

# 输出结果
[KSTREAM-LEFTJOIN-0000000003]: K1 , [A, null]
[KSTREAM-LEFTJOIN-0000000003]: K2 , [B, b] # 与预测结果相符
```

**outerJoin()**

[预测结果](http://kafka.apache.org/11/javadoc/org/apache/kafka/streams/kstream/KStream.html#outerJoin-org.apache.kafka.streams.kstream.KStream-org.apache.kafka.streams.kstream.ValueJoiner-org.apache.kafka.streams.kstream.JoinWindows-)
this | other | result
---|---|---
<K1:A> | - | <K1:ValueJoiner(A,null)>
<K2:B> | <K2:b> | <K2:ValueJoiner(null,b)>, <K2:ValueJoiner(B,b)>
- | <K3:c> | <K3:ValueJoiner(null,c)>

测试结果
```bash
# 创建两个主题（注意：分区策略要相同，为了简化测试，都只分配一个分区）
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic left-stream
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic right-stream

# 创建两个对应主题的生产者，按预测结果的表格来发送消息（注意：先不要发送消息）。
kafka-console-producer.sh --broker-list localhost:9092 --topic left-stream --property parse.key=true --property key.separator=" "
>
kafka-console-producer.sh --broker-list localhost:9092 --topic right-stream --property parse.key=true --property key.separator=" "
>

## 开始运行程序

# 开始发送消息，观察程序的输出结果。
kafka-console-producer.sh --broker-list localhost:9092 --topic left-stream --property parse.key=true --property key.separator=" "
>K1 A # 1 数字代表发送消息的顺序
>K2 B # 3

kafka-console-producer.sh --broker-list localhost:9092 --topic right-stream --property parse.key=true --property key.separator=" "
>K2 b # 2
>K3 c # 4

# 输出结果（注意：输出的顺序对应上面的发送顺序）
[KSTREAM-MERGE-0000000006]: K1 , [A, null] # 与预测结果相符
[KSTREAM-MERGE-0000000006]: K2 , [null, b]
[KSTREAM-MERGE-0000000006]: K2 , [B, b]
[KSTREAM-MERGE-0000000006]: K3 , [null, c]

# 删除数据重新测试，先发送 left-stream 的消息，可得出如下结果。
[KSTREAM-MERGE-0000000006]: k1 , [A, null]
[KSTREAM-MERGE-0000000006]: K2 , [B, null] # 结论：非空值跟发送消息的顺序相关
[KSTREAM-MERGE-0000000006]: K2 , [B, b]
[KSTREAM-MERGE-0000000006]: K3 , [null, c]
```

#### KTable 与 KTable 连接

```java
package $7_3_3;

import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.StreamsConfig;
import org.apache.kafka.streams.kstream.KStreamBuilder;
import org.apache.kafka.streams.kstream.KTable;

import java.util.Date;
import java.util.Properties;

/**
 * 7.3.3 KTable 的连接
 */
public class TableJoinDemo {

    public static void main(String[] args) throws Exception {

        Properties config = new Properties();
        config.put(StreamsConfig.APPLICATION_ID_CONFIG, "TableJoinDemo");
        config.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        config.put(StreamsConfig.KEY_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        config.put(StreamsConfig.VALUE_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        config.put(StreamsConfig.consumerPrefix(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG), "earliest");

        KStreamBuilder builder = new KStreamBuilder();
        KTable<String, String> leftTable = builder.table("left-table", "my_store_left");
        KTable<String, String> rightTable = builder.table("right-table", "my_store_right");

        KafkaStreams streams = new KafkaStreams(builder, config);
        streams.start();

        KTable<String, String> joinedTable = leftTable.join(rightTable, // leftJoin(), outerJoin
                (leftValue, rightValue) -> "[" + leftValue + ", " + rightValue + "]");
        joinedTable.print();

        // 每 5 秒打印一次时间
        int counter = 1;
        while (true) {
            System.out.println(counter + " " + new Date().toString());
            Thread.sleep(5000L);
            counter++;
            if (counter > 6) {
                System.out.println("---- 我是分隔线 ----");
                counter = 1;
            }
        }
    }
}
```

[预测结果](http://kafka.apache.org/11/javadoc/org/apache/kafka/streams/kstream/KTable.html#join-org.apache.kafka.streams.kstream.KTable-org.apache.kafka.streams.kstream.ValueJoiner-org.apache.kafka.streams.kstream.Materialized-)
thisKTable | thisState | otherKTable | otherState | result updated record
---|---|---|---|---
<K1:A> | <K1:A> | - | - | -
- | <K1:A> | <K1:b> | <K1:b> | <K1:ValueJoiner(A,b)>
<K1:C> | <K1:C> | -| <K1:b> | <K1:ValueJoiner(C,b)>
- | <K1:C> | <K1:null> | - | <K1:null>

测试结果
```bash
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic left-table
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic right-table

# 创建两个对应主题的生产者，按预测结果的表格来发送消息（注意：先不要发送消息）。
kafka-console-producer.sh --broker-list localhost:9092 --topic left-table --property parse.key=true --property key.separator=" "
>
kafka-console-producer.sh --broker-list localhost:9092 --topic right-table --property parse.key=true --property key.separator=" "
>

## 开始运行程序

# 开始发送消息，观察程序的输出结果（注意：30 秒内只发送一条消息）。
kafka-console-producer.sh --broker-list localhost:9092 --topic left-table --property parse.key=true --property key.separator=" "
>K1 A # 1
>K1 C # 3

kafka-console-producer.sh --broker-list localhost:9092 --topic right-table --property parse.key=true --property key.separator=" "
>K1 b # 2
>K1 null # 4 用字符串 null 来代替实际上的 null 对象

# 程序输出（与预测结果相符）
1 Tue May 01 17:19:36 CST 2018
2 Tue May 01 17:19:41 CST 2018
3 Tue May 01 17:19:46 CST 2018
4 Tue May 01 17:19:51 CST 2018
5 Tue May 01 17:19:56 CST 2018
6 Tue May 01 17:20:01 CST 2018
[KTABLE-MERGE-0000000006]: K1 , (null<-null)
---- 我是分隔线 ----
1 Tue May 01 17:20:06 CST 2018
2 Tue May 01 17:20:11 CST 2018
3 Tue May 01 17:20:16 CST 2018
4 Tue May 01 17:20:21 CST 2018
5 Tue May 01 17:20:26 CST 2018
6 Tue May 01 17:20:31 CST 2018
[KTABLE-MERGE-0000000006]: K1 , ([A, b]<-null)
---- 我是分隔线 ----
1 Tue May 01 17:20:36 CST 2018
2 Tue May 01 17:20:41 CST 2018
3 Tue May 01 17:20:46 CST 2018
4 Tue May 01 17:20:51 CST 2018
5 Tue May 01 17:20:56 CST 2018
6 Tue May 01 17:21:01 CST 2018
[KTABLE-MERGE-0000000006]: K1 , ([C, b]<-null)
---- 我是分隔线 ----
1 Tue May 01 17:21:06 CST 2018
2 Tue May 01 17:21:11 CST 2018
3 Tue May 01 17:21:16 CST 2018
4 Tue May 01 17:21:21 CST 2018
5 Tue May 01 17:21:26 CST 2018
6 Tue May 01 17:21:31 CST 2018
[KTABLE-MERGE-0000000006]: K1 , ([C, null]<-null)
```
