[toc]

# 第 5 章 使用 ZooKeeper

## 5.2 客户端脚本

注意：以下操作的开发环境
- 服务器版本 3.4.3
- 客户端 zkCli 版本 3.4.3

### 5.2.1 创建

```bash
[zk: localhost:2181(CONNECTED) 1] create /zk-book 123
Created /zk-book
```

### 5.2.2 读取

列出所有子节点
```bash
[zk: localhost:2181(CONNECTED) 2] ls /   
[zk-book, zookeeper]
```

读取节点的数据内容和属性
```bash
[zk: localhost:2181(CONNECTED) 3] get /zk-book
123
cZxid = 0x4
ctime = Fri Apr 20 21:07:00 CST 2018
mZxid = 0x4
mtime = Fri Apr 20 21:07:00 CST 2018
pZxid = 0x4
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 3
numChildren = 0
```

### 5.2.3 更新

```bash
[zk: localhost:2181(CONNECTED) 4] set /zk-book 456
cZxid = 0x4
ctime = Fri Apr 20 21:07:00 CST 2018
mZxid = 0x5
mtime = Fri Apr 20 21:10:30 CST 2018
pZxid = 0x4
cversion = 0
dataVersion = 1 # 版本发生了改变
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 3
numChildren = 0

[zk: localhost:2181(CONNECTED) 5] get /zk-book
456 # 新的内容
cZxid = 0x4
ctime = Fri Apr 20 21:07:00 CST 2018
mZxid = 0x5
mtime = Fri Apr 20 21:10:30 CST 2018
pZxid = 0x4
cversion = 0
dataVersion = 1
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 3
numChildren = 0
```

### 5.2.4 删除

```bash
[zk: localhost:2181(CONNECTED) 6] delete /zk-book
[zk: localhost:2181(CONNECTED) 7] ls /
[zookeeper]

# 不能删除有子节点的节点
[zk: localhost:2181(CONNECTED) 8] create /zk-book 123
Created /zk-book
[zk: localhost:2181(CONNECTED) 9] create /zk-book/child 456
Created /zk-book/child
[zk: localhost:2181(CONNECTED) 10] delete /zk-book
Node not empty: /zk-book
```

## 5.3 Java 客户端 API 使用

注意：以下代码的开发环境
- 服务器版本 3.4.3（与作者的保持一致）
- 客户端 zkCli 版本 3.4.3
- 客户端 Java API 版本 3.4.11（使用 3.4.3 版本会出现 Maven 依赖错误）

`pom.xml`
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>demo</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <dependency>
            <groupId>org.apache.zookeeper</groupId>
            <artifactId>zookeeper</artifactId>
            <version>3.4.11</version>
        </dependency>

        <dependency>
            <groupId>org.apache.curator</groupId>
            <artifactId>curator-framework</artifactId>
            <version>2.4.2</version>
        </dependency>
        <dependency>
            <groupId>org.apache.curator</groupId>
            <artifactId>curator-recipes</artifactId>
            <version>2.4.2</version>
        </dependency>
        <dependency>
            <groupId>org.apache.curator</groupId>
            <artifactId>curator-test</artifactId>
            <version>2.4.2</version>
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

### 5.3.1 创建会话

**清单 5-2 创建一个最基本的 ZooKeeper 会话实例**
```java
package chapter05.$5_3_1;

import org.apache.zookeeper.ZooKeeper;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.1 清单 5-2 创建一个最基本的 ZooKeeper 会话实例
 */
public class ZooKeeperConstructorUsageSimple {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);

    public static void main(String[] args) throws Exception {

        ZooKeeper zooKeeper = new ZooKeeper("localhost:2181", 5000,
                event -> {
                    System.out.println("Receive watched event：" + event);
                    // 收到会话连接成功通知
                    if (SyncConnected == event.getState()) {
                        // 解除阻塞
                        connectedSemaphore.countDown();
                    }

                });

        System.out.println(zooKeeper.getState());

        // 阻塞线程，等待会话连接成功。
        connectedSemaphore.await();

        System.out.println("ZooKeeper session established.");
    }
}
```

输出结果
```
CONNECTING
Receive watched event：WatchedEvent state:SyncConnected type:None path:null
ZooKeeper session established.
```

**清单 5-3 复用 sessionId 和 sessionPasswd 来创建一个 ZooKeeper 对象实例**
```java
package chapter05.$5_3_1;

import org.apache.zookeeper.ZooKeeper;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.1 清单 5-3 复用 sessionId 和 sessionPasswd 来创建一个 ZooKeeper 对象实例
 */
public class ZooKeeperConstructorUsageWithSIDPASSWD {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);

    public static void main(String[] args) throws Exception {

        String connectString = "localhost:2181";

        // 会话一
        ZooKeeper zooKeeper = new ZooKeeper(connectString, 5000,
                event -> {
                    System.out.println("会话一 " + event);
                    if (SyncConnected == event.getState()) {
                        connectedSemaphore.countDown();
                    }
                });

        connectedSemaphore.await();

        long sessionId = zooKeeper.getSessionId();
        byte[] passwd = zooKeeper.getSessionPasswd();

        // 会话二，使用错误的会话 ID 和 密码，服务器将返回连接超时事件。
        zooKeeper = new ZooKeeper(connectString, 5000,
                event -> {
                    System.out.println("会话二 " + event);
                    if (SyncConnected == event.getState()) {
                        connectedSemaphore.countDown();
                    }
                }, 1L, "apple".getBytes());

        // 会话三，使用正确的会话 ID 和 密码，服务器将返回连接成功事件。
        zooKeeper = new ZooKeeper(connectString, 5000,
                event -> {
                    System.out.println("会话三 " + event);
                    if (SyncConnected == event.getState()) {
                        connectedSemaphore.countDown();
                    }
                }, sessionId, passwd);

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

输出结果
```
会话一 WatchedEvent state:SyncConnected type:None path:null
会话三 WatchedEvent state:SyncConnected type:None path:null
会话二 WatchedEvent state:Expired type:None path:null
# 会话一和会话三交替出现连接成功和断开连接的情况，因为会话断开后会自动重连。
会话一 WatchedEvent state:Disconnected type:None path:null
会话一 WatchedEvent state:SyncConnected type:None path:null
会话三 WatchedEvent state:Disconnected type:None path:null
会话三 WatchedEvent state:SyncConnected type:None path:null
会话一 WatchedEvent state:Disconnected type:None path:null
会话一 WatchedEvent state:SyncConnected type:None path:null
会话三 WatchedEvent state:Disconnected type:None path:null
会话三 WatchedEvent state:SyncConnected type:None path:null
会话一 WatchedEvent state:Disconnected type:None path:null
...
```

### 5.3.2 创建节点

**清单 5-4 使用同步 API 创建一个节点**
```java
package chapter05.$5_3_2;

import org.apache.zookeeper.ZooKeeper;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.CreateMode.*;
import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;
import static org.apache.zookeeper.ZooDefs.Ids.OPEN_ACL_UNSAFE;

/**
 * 5.3.2 清单 5-4 使用同步 API 创建一个节点
 */
public class ZooKeeperCreateAPISyncUsage {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);

    public static void main(String[] args) throws Exception {

        ZooKeeper zookeeper = new ZooKeeper("localhost:2181",
                5000, event -> {
            if (SyncConnected == event.getState()) {
                connectedSemaphore.countDown();
            }
        });

        connectedSemaphore.await();

        // 创建临时节点
        zookeeper.create("/ephemeral", "cat".getBytes(), OPEN_ACL_UNSAFE,
                EPHEMERAL);

        // 创建临时顺序节点
        zookeeper.create("/ephemeral-sequential-", "dog".getBytes(), OPEN_ACL_UNSAFE,
                EPHEMERAL_SEQUENTIAL);

        // 创建持久节点
        zookeeper.create("/persistent", "tiger".getBytes(), OPEN_ACL_UNSAFE,
                PERSISTENT);

        // 创建持久顺序节点
        zookeeper.create("/persistent-sequential-", "pig".getBytes(), OPEN_ACL_UNSAFE,
                PERSISTENT_SEQUENTIAL);

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

验证结果
```bash
[zk: localhost:2181(CONNECTED) 3] ls /
[ephemeral, ephemeral-sequential-0000000003, zookeeper, persistent, persistent-sequential-0000000005]
```

**清单 5-5 使用异步 API 创建一个节点**
```java
package chapter05.$5_3_2;

import org.apache.zookeeper.*;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.CreateMode.EPHEMERAL;
import static org.apache.zookeeper.CreateMode.EPHEMERAL_SEQUENTIAL;
import static org.apache.zookeeper.KeeperException.Code.NODEEXISTS;
import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.2 清单 5-5 使用异步 API 创建一个节点
 */
public class ZooKeeperCreateAPIAsyncUsage {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);

    public static void main(String[] args) throws Exception {

        ZooKeeper zookeeper = new ZooKeeper("localhost:2181",
                5000, event -> {
            if (SyncConnected == event.getState()) {
                connectedSemaphore.countDown();
            }
        });

        connectedSemaphore.await();

        AsyncCallback.StringCallback callback = (rc, path, ctx, name) -> {
            if (rc == KeeperException.Code.OK.intValue()) {
                // 顺序节点的 name 只有创建成功后才确定下来
                System.out.println("节点创建成功 [" + rc + ", " + path + ", "
                        + ctx + ", " + name);
            } else if (rc == NODEEXISTS.intValue()) {
                System.out.println("节点已经存在");
            }
        };

        zookeeper.create("/ephemeral", "cat".getBytes(),
                ZooDefs.Ids.OPEN_ACL_UNSAFE, EPHEMERAL,
                callback, "I am context.");

        // 节点已经存在，将返回一个错误码。
        zookeeper.create("/ephemeral", "dog".getBytes(),
                ZooDefs.Ids.OPEN_ACL_UNSAFE, EPHEMERAL,
                callback, "I am context.");

        // 临时顺序节点
        zookeeper.create("/ephemeral-sequential-", "pig".getBytes(),
                ZooDefs.Ids.OPEN_ACL_UNSAFE, EPHEMERAL_SEQUENTIAL,
                callback, "I am context.");

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

输出结果
```
节点创建成功 [0, /ephemeral, I am context., /ephemeral
节点已经存在
节点创建成功 [0, /ephemeral-sequential-, I am context., /ephemeral-sequential-0000000007
```

验证结果
```bash
[zk: localhost:2181(CONNECTED) 9] ls /
[ephemeral, zookeeper, ephemeral-sequential-0000000007]
```

### 5.3.3 删除节点

**使用同步方式删除节点**
```java
package chapter05.$5_3_3;

import org.apache.zookeeper.ZooKeeper;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.3 使用同步方式删除节点
 */
public class DeleteAPISyncUsage {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);

    public static void main(String[] args) throws Exception {

        ZooKeeper zookeeper = new ZooKeeper("localhost:2181",
                5000, event -> {
            if (SyncConnected == event.getState()) {
                connectedSemaphore.countDown();
            }
        });

        connectedSemaphore.await();

        // 创建测试节点 create -e /fruit apple
        // -1 表示匹配任何版本
        zookeeper.delete("/fruit", -1);

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

验证结果
```bash
[zk: localhost:2181(CONNECTED) 1] create -e /fruit apple
Created /fruit
[zk: localhost:2181(CONNECTED) 2] ls /
[zookeeper, fruit]
[zk: localhost:2181(CONNECTED) 3] ls /
[zookeeper]
```

**使用异步方式删除节点**
```java
package chapter05.$5_3_3;

import org.apache.zookeeper.ZooKeeper;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.3 使用异步方式删除节点
 */
public class DeleteAPIAsyncUsage {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);

    public static void main(String[] args) throws Exception {

        ZooKeeper zookeeper = new ZooKeeper("localhost:2181",
                5000, event -> {
            if (SyncConnected == event.getState()) {
                connectedSemaphore.countDown();
            }
        });

        connectedSemaphore.await();

        // 创建测试节点 create -e /fruit apple
        // -1 表示匹配任何版本
        zookeeper.delete("/fruit", -1,
                (rc, path, ctx) -> System.out.println("删除节点 " + path),
                null);

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

验证结果
```bash
[zk: localhost:2181(CONNECTED) 4] create -e /fruit apple
Created /fruit
[zk: localhost:2181(CONNECTED) 5] ls /
[zookeeper, fruit]
[zk: localhost:2181(CONNECTED) 6] ls /
[zookeeper]
```

### 5.3.4 读取数据

**清单 5-6 使用同步 API 获取子节点列表**
```java
package chapter05.$5_3_4;

import org.apache.zookeeper.ZooKeeper;

import java.util.List;
import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.Watcher.Event.EventType.NodeChildrenChanged;
import static org.apache.zookeeper.Watcher.Event.EventType.None;
import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.4 清单 5-6 使用同步 API 获取子节点列表
 */
public class ZooKeeperGetChildrenAPISyncUsage {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);
    private static ZooKeeper zooKeeper = null;

    public static void main(String[] args) throws Exception {

        zooKeeper = new ZooKeeper("localhost:2181", 5000,
                event -> {

                    System.out.println(event);

                    if (SyncConnected == event.getState()) {
                        // 成功连接服务器
                        if (None == event.getType() && null == event.getPath()) {
                            // 解除阻塞
                            connectedSemaphore.countDown();
                            // 子节点变更
                        } else if (NodeChildrenChanged == event.getType()) {
                            try {
                                // 重新获取子节点
                                System.out.println("重新获取子节点列表 " + zooKeeper.getChildren(event.getPath(), true));
                            } catch (Exception ignored) {
                            }
                        }
                    }
                });

        // 阻塞，成功连接服务器后再解除。
        connectedSemaphore.await();

        /*
        * 创建测试节点 create /fruit fruit
        * 程序运行过程中创建子节点（注意：临时节点不可以创建子节点）
        * create /fruit/apple apple
        * create /fruit/banana banana
        * 观察子节点变更通知
        * */
        String path = "/fruit";
        List<String> childrenList = zooKeeper.getChildren(path, true);
        System.out.println("第一次获取子节点列表 " + childrenList);

        // 阻塞，不要让程序结束，因为要监听事件通知。
        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

测试数据
```bash
[zk: localhost:2181(CONNECTED) 15] create /fruit fruit
Created /fruit
[zk: localhost:2181(CONNECTED) 16] create /fruit/apple apple
Created /fruit/apple
[zk: localhost:2181(CONNECTED) 17] create /fruit/banana banana
Created /fruit/banana
```

输出结果
```
WatchedEvent state:SyncConnected type:None path:null
第一次获取子节点列表 []
WatchedEvent state:SyncConnected type:NodeChildrenChanged path:/fruit
重新获取子节点列表 [apple]
WatchedEvent state:SyncConnected type:NodeChildrenChanged path:/fruit
重新获取子节点列表 [banana, apple]
```

**清单 5-7 使用异步 API 获取子节点列表**
```java
package chapter05.$5_3_4;

import org.apache.zookeeper.ZooKeeper;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.Watcher.Event.EventType.NodeChildrenChanged;
import static org.apache.zookeeper.Watcher.Event.EventType.None;
import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.4 清单 5-7 使用异步 API 获取子节点列表
 */
public class ZooKeeperGetChildrenAPIAsyncUsage {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);
    private static ZooKeeper zooKeeper = null;

    public static void main(String[] args) throws Exception {

        zooKeeper = new ZooKeeper("localhost:2181", 5000,
                event -> {

                    System.out.println(event);

                    if (SyncConnected == event.getState()) {
                        // 成功连接服务器
                        if (None == event.getType() && null == event.getPath()) {
                            // 解除阻塞
                            connectedSemaphore.countDown();
                            // 子节点变更
                        } else if (NodeChildrenChanged == event.getType()) {
                            try {
                                // 重新获取子节点
                                System.out.println("重新获取子节点列表 " + zooKeeper.getChildren(event.getPath(), true));
                            } catch (Exception ignored) {
                            }
                        }
                    }
                });

        // 阻塞，成功连接服务器后再解除。
        connectedSemaphore.await();

        /*
        * 创建测试节点 create /fruit fruit
        * 程序运行过程中创建子节点（注意：临时节点不可以创建子节点）
        * create /fruit/apple apple
        * create /fruit/banana banana
        * 观察子节点变更通知
        * */
        zooKeeper.getChildren("/fruit", true,
                ((rc, path, ctx, children, stat) -> System.out.println("第一次获取子节点列表 [rc: " + rc + ", path: " + path
                        + ", ctx: " + ctx + ", children: " + children + ", stat: " + stat)),
                null);

        // 阻塞，不要让程序结束，因为要监听事件通知。
        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

测试数据
```bash
[zk: localhost:2181(CONNECTED) 22] create /fruit fruit
Created /fruit
[zk: localhost:2181(CONNECTED) 23] ls /
[zookeeper, fruit]
[zk: localhost:2181(CONNECTED) 24] create /fruit/apple apple
Created /fruit/apple
[zk: localhost:2181(CONNECTED) 25] create /fruit/banana banana
Created /fruit/banana
```

输出结果
```
WatchedEvent state:SyncConnected type:None path:null
第一次获取子节点列表 [rc: 0, path: /fruit, ctx: null, children: [], stat: 68,68,1524301474522,1524301474522,0,0,0,0,5,0,68

WatchedEvent state:SyncConnected type:NodeChildrenChanged path:/fruit
重新获取子节点列表 [apple]
WatchedEvent state:SyncConnected type:NodeChildrenChanged path:/fruit
重新获取子节点列表 [banana, apple]
```

**清单 5-8 使用同步 API 获取节点数据内容**
```java
package chapter05.$5_3_4;

import org.apache.zookeeper.ZooKeeper;
import org.apache.zookeeper.data.Stat;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.Watcher.Event.EventType.NodeDataChanged;
import static org.apache.zookeeper.Watcher.Event.EventType.None;
import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.4 清单 5-8 使用同步 API 获取节点数据内容
 */
public class GetDataAPISyncUsage {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);
    private static ZooKeeper zooKeeper = null;
    private static final Stat stat = new Stat();

    public static void main(String[] args) throws Exception {

        zooKeeper = new ZooKeeper("localhost:2181", 5000,
                event -> {

                    System.out.println(event);

                    if (SyncConnected == event.getState()) {
                        // 成功连接服务器
                        if (None == event.getType() && null == event.getPath()) {
                            // 解除阻塞
                            connectedSemaphore.countDown();
                            // 节点数据变更
                        } else if (NodeDataChanged == event.getType()) {
                            try {
                                // 重新读取节点数据
                                byte[] data = zooKeeper.getData(event.getPath(), true, stat);
                                System.out.println("重新读取节点数据 " + new String(data));
                                System.out.println("重新读取节点状态信息 " + stat);
                            } catch (Exception ignored) {
                            }
                        }
                    }
                });

        // 阻塞，成功连接服务器后再解除。
        connectedSemaphore.await();

        /*
        * 创建测试节点 create /animal cat
        * 程序运行过程中修改节点数据
        * set /animal cat
        * set /animal dog
        * 观察子节点变更通知
        * */
        String path = "/animal";
        byte[] data = zooKeeper.getData(path, true, stat);
        System.out.println("第一次读取节点数据 " + new String(data));
        System.out.println("第一次读取节点状态信息 " + stat);

        // 阻塞，不要让程序结束，因为要监听事件通知。
        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

测试数据
```bash
[zk: localhost:2181(CONNECTED) 29] create /animal cat
Created /animal
# 虽然节点的数据没有发生变化，但是数据版本等状态信息会发生，所以仍然会触发通知。
[zk: localhost:2181(CONNECTED) 30] set /animal cat
cZxid = 0x4c
ctime = Sat Apr 21 17:13:18 CST 2018
mZxid = 0x4e
mtime = Sat Apr 21 17:13:52 CST 2018
pZxid = 0x4c
cversion = 0
dataVersion = 1 # 数据版本由 0 变为 1
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 3
numChildren = 0
[zk: localhost:2181(CONNECTED) 31] set /animal dog
cZxid = 0x4c
ctime = Sat Apr 21 17:13:18 CST 2018
mZxid = 0x4f
mtime = Sat Apr 21 17:14:08 CST 2018
pZxid = 0x4c
cversion = 0
dataVersion = 2 # 数据版本由 1 变为 2
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 3
numChildren = 0
```

输出结果
```
WatchedEvent state:SyncConnected type:None path:null
第一次读取节点数据 cat
第一次读取节点状态信息 76,76,1524301998300,1524301998300,0,0,0,0,3,0,76

WatchedEvent state:SyncConnected type:NodeDataChanged path:/animal
重新读取节点数据 cat
重新读取节点状态信息 76,78,1524301998300,1524302032067,1,0,0,0,3,0,76

WatchedEvent state:SyncConnected type:NodeDataChanged path:/animal
重新读取节点数据 dog
重新读取节点状态信息 76,79,1524301998300,1524302048104,2,0,0,0,3,0,76
```

**清单 5-9 使用异步 API 获取节点数据内容**
```java
package chapter05.$5_3_4;

import org.apache.zookeeper.AsyncCallback.DataCallback;
import org.apache.zookeeper.ZooKeeper;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.Watcher.Event.EventType.NodeDataChanged;
import static org.apache.zookeeper.Watcher.Event.EventType.None;
import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.4 清单 5-9 使用异步 API 获取节点数据内容
 */
public class GetDataAPIAsyncUsage {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);
    private static ZooKeeper zooKeeper = null;

    public static void main(String[] args) throws Exception {

        DataCallback callback = (rc, path, ctx, data, stat) -> {
            System.out.println(ctx);
            System.out.println("data: " + rc + ", " + path + ", " + new String(data));
            System.out.println("stat: " + stat);
        };

        String path = "/animal";

        zooKeeper = new ZooKeeper("localhost:2181", 5000,
                event -> {

                    System.out.println(event);

                    if (SyncConnected == event.getState()) {
                        // 成功连接服务器
                        if (None == event.getType() && null == event.getPath()) {
                            // 解除阻塞
                            connectedSemaphore.countDown();
                            // 节点数据变更
                        } else if (NodeDataChanged == event.getType()) {
                            try {
                                // 重新读取节点数据
                                zooKeeper.getData(path, true, callback, "重新读取节点数据");
                            } catch (Exception ignored) {
                            }
                        }
                    }
                });

        // 阻塞，成功连接服务器后再解除。
        connectedSemaphore.await();

        /*
        * 创建测试节点 create /animal cat
        * 程序运行过程中修改节点数据
        * set /animal cat
        * set /animal dog
        * 观察子节点变更通知
        * */
        zooKeeper.getData(path, true, callback, "第一次读取节点数据");

        // 阻塞，不要让程序结束，因为要监听事件通知。
        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

测试节点
```bash
[zk: localhost:2181(CONNECTED) 35] create /animal cat
Created /animal
[zk: localhost:2181(CONNECTED) 36] set /animal cat
cZxid = 0x52
ctime = Sat Apr 21 17:25:03 CST 2018
mZxid = 0x54
mtime = Sat Apr 21 17:25:40 CST 2018
pZxid = 0x52
cversion = 0
dataVersion = 1
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 3
numChildren = 0
[zk: localhost:2181(CONNECTED) 37] set /animal dog
cZxid = 0x52
ctime = Sat Apr 21 17:25:03 CST 2018
mZxid = 0x55
mtime = Sat Apr 21 17:25:46 CST 2018
pZxid = 0x52
cversion = 0
dataVersion = 2
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 3
numChildren = 0
```

输出结果
```
WatchedEvent state:SyncConnected type:None path:null
第一次读取节点数据
data: 0, /animal, cat
stat: 82,82,1524302703452,1524302703452,0,0,0,0,3,0,82

WatchedEvent state:SyncConnected type:NodeDataChanged path:/animal
重新读取节点数据
data: 0, /animal, cat
stat: 82,84,1524302703452,1524302740499,1,0,0,0,3,0,82

WatchedEvent state:SyncConnected type:NodeDataChanged path:/animal
重新读取节点数据
data: 0, /animal, dog
stat: 82,85,1524302703452,1524302746934,2,0,0,0,3,0,82
```

### 5.3.5 更新数据

**清单 5-10 使用同步 API 更新节点数据内容**
```java
package chapter05.$5_3_5;

import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.ZooKeeper;
import org.apache.zookeeper.data.Stat;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.Watcher.Event.EventType.None;
import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.5 清单 5-10 使用同步 API 更新节点数据内容
 */
public class SetDataAPISyncUsage {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);

    public static void main(String[] args) throws Exception {

        ZooKeeper zooKeeper = new ZooKeeper("localhost:2181", 5000,
                event -> {

                    System.out.println(event);

                    if (SyncConnected == event.getState()) {
                        // 成功连接服务器
                        if (None == event.getType() && null == event.getPath()) {
                            // 解除阻塞
                            connectedSemaphore.countDown();
                        }
                    }
                });

        // 阻塞，成功连接服务器后再解除。
        connectedSemaphore.await();

        // 创建测试节点 create /fruit apple
        String path = "/fruit";

        // 第一次更新
        Stat stat1 = zooKeeper.setData(path, "banana".getBytes(), -1);
        System.out.println("第一次更新 " + stat1);

        // 第二次更新，对上次记录的版本进行更新（注意：上一版本未必是最新的版本，因为别的客户端也在更新数据）。
        Stat stat2 = zooKeeper.setData(path, "pear".getBytes(), stat1.getVersion());
        System.out.println("第二次更新 " + stat2);

        // 第二次更新后，数据版本已经发生了变化，下面的更新仍然针对第一次记录的版本，会出现错误。
        try {
            zooKeeper.setData(path, "grape".getBytes(), stat1.getVersion());
        } catch (KeeperException e) {
            System.out.println("第三次更新 " + e);
        }

        // 阻塞，不要让程序结束，因为要监听事件通知。
        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

测试数据
```bash
[zk: localhost:2181(CONNECTED) 16] create /fruit apple
Created /fruit
[zk: localhost:2181(CONNECTED) 17] get /fruit
apple
cZxid = 0x6b
ctime = Sat Apr 21 17:58:11 CST 2018
mZxid = 0x6b
mtime = Sat Apr 21 17:58:11 CST 2018
pZxid = 0x6b
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 5
numChildren = 0
# 两次更新后
[zk: localhost:2181(CONNECTED) 18] get /fruit
pear
cZxid = 0x6b
ctime = Sat Apr 21 17:58:11 CST 2018
mZxid = 0x6e
mtime = Sat Apr 21 17:58:21 CST 2018
pZxid = 0x6b
cversion = 0
dataVersion = 2
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 4
numChildren = 0
```

输出结果
```
WatchedEvent state:SyncConnected type:None path:null
第一次更新 107,109,1524304691124,1524304701307,1,0,0,0,6,0,107

第二次更新 107,110,1524304691124,1524304701313,2,0,0,0,4,0,107

第三次更新 org.apache.zookeeper.KeeperException$BadVersionException: KeeperErrorCode = BadVersion for /fruit
```

**清单 5-11 使用异步 API 更新节点数据内容**
```java
package chapter05.$5_3_5;

import org.apache.zookeeper.ZooKeeper;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.KeeperException.Code.OK;
import static org.apache.zookeeper.Watcher.Event.EventType.None;
import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.5 清单 5-11 使用异步 API 更新节点数据内容
 */
public class SetDataAPIAsyncUsage {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);

    public static void main(String[] args) throws Exception {

        ZooKeeper zooKeeper = new ZooKeeper("localhost:2181", 5000,
                event -> {

                    System.out.println(event);

                    if (SyncConnected == event.getState()) {
                        // 成功连接服务器
                        if (None == event.getType() && null == event.getPath()) {
                            // 解除阻塞
                            connectedSemaphore.countDown();
                        }
                    }
                });

        // 阻塞，成功连接服务器后再解除。
        connectedSemaphore.await();

        // 创建测试节点 create /fruit apple
        zooKeeper.setData("/fruit", "banana".getBytes(), -1,
                (rc, path, ctx, stat) -> {
                    if (OK.intValue() == rc) {
                        System.out.println(stat);
                    }
                }, null);


        // 阻塞，不要让程序结束，因为要监听事件通知。
        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

测试数据
```bash
[zk: localhost:2181(CONNECTED) 11] create /fruit apple
Created /fruit
[zk: localhost:2181(CONNECTED) 12] get /fruit
apple
cZxid = 0x65
ctime = Sat Apr 21 17:55:58 CST 2018
mZxid = 0x65
mtime = Sat Apr 21 17:55:58 CST 2018
pZxid = 0x65
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 5
numChildren = 0
# 更新后
[zk: localhost:2181(CONNECTED) 13] get /fruit
banana
cZxid = 0x65
ctime = Sat Apr 21 17:55:58 CST 2018
mZxid = 0x67
mtime = Sat Apr 21 17:56:08 CST 2018
pZxid = 0x65
cversion = 0
dataVersion = 1
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 6
numChildren = 0
```

输出结果
```
WatchedEvent state:SyncConnected type:None path:null
101,103,1524304558303,1524304568876,1,0,0,0,6,0,101
```

### 5.3.6 检测节点是否存在

**清单 5-12 使用同步 API 检测节点是否存在**
```java
package chapter05.$5_3_6;

import org.apache.zookeeper.ZooKeeper;
import org.apache.zookeeper.data.Stat;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.Watcher.Event.EventType.*;
import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.6 清单 5-12 使用同步 API 检测节点是否存在
 */
public class ExistAPISyncUsage {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);
    private static ZooKeeper zooKeeper = null;

    public static void main(String[] args) throws Exception {

        zooKeeper = new ZooKeeper("localhost:2181", 5000,
                event -> {

                    System.out.println(event);

                    try {
                        if (SyncConnected == event.getState()) {
                            // 成功连接服务器
                            if (None == event.getType() && null == event.getPath()) {
                                // 解除阻塞
                                connectedSemaphore.countDown();
                                // 节点创建
                            } else if (NodeCreated == event.getType()) {
                                System.out.println("Node " + event.getPath() + " Created");
                                zooKeeper.exists(event.getPath(), true);
                                // 节点删除
                            } else if (NodeDeleted == event.getType()) {
                                System.out.println("Node " + event.getPath() + " Deleted");
                                zooKeeper.exists(event.getPath(), true);
                                // 节点更新
                            } else if (NodeDataChanged == event.getType()) {
                                System.out.println("Node " + event.getPath() + " DataChanged");
                                zooKeeper.exists(event.getPath(), true);
                            }
                        }
                    } catch (Exception ignored) {

                    }
                });

        // 阻塞，成功连接服务器后再解除。
        connectedSemaphore.await();

        /*
          开始时，服务器上是没有测试节点的 ls /fruit Node does not exist: /fruit
          观察以下事件通知
          创建节点 create /fruit apple
          更新节点 set /fruit banana
          删除节点 delete /fruit
         */
        String path = "/fruit";
        Stat stat = zooKeeper.exists(path, true);
        System.out.println(stat);

        // 阻塞，不要让程序结束，因为要监听事件通知。
        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

测试数据
```bash
[zk: localhost:2181(CONNECTED) 21] create /fruit apple
Created /fruit
[zk: localhost:2181(CONNECTED) 22] set /fruit banana
cZxid = 0x73
ctime = Sat Apr 21 18:05:27 CST 2018
mZxid = 0x74
mtime = Sat Apr 21 18:05:33 CST 2018
pZxid = 0x73
cversion = 0
dataVersion = 1
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 6
numChildren = 0
[zk: localhost:2181(CONNECTED) 23] delete /fruit
```

输出结果
```
WatchedEvent state:SyncConnected type:None path:null
null
WatchedEvent state:SyncConnected type:NodeCreated path:/fruit
Node /fruit Created
WatchedEvent state:SyncConnected type:NodeDataChanged path:/fruit
Node /fruit DataChanged
WatchedEvent state:SyncConnected type:NodeDeleted path:/fruit
Node /fruit Deleted
```

**使用异步 API 检测节点是否存在**
```java
package chapter05.$5_3_6;

import org.apache.zookeeper.ZooKeeper;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.Watcher.Event.EventType.*;
import static org.apache.zookeeper.Watcher.Event.KeeperState.SyncConnected;

/**
 * 5.3.6 使用异步 API 检测节点是否存在
 */
public class ExistAPIAsyncUsage {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);
    private static ZooKeeper zooKeeper = null;

    public static void main(String[] args) throws Exception {

        zooKeeper = new ZooKeeper("localhost:2181", 5000,
                event -> {

                    System.out.println(event);

                    try {
                        if (SyncConnected == event.getState()) {
                            // 成功连接服务器
                            if (None == event.getType() && null == event.getPath()) {
                                // 解除阻塞
                                connectedSemaphore.countDown();
                                // 节点创建
                            } else if (NodeCreated == event.getType()) {
                                System.out.println("Node " + event.getPath() + " Created");
                                // 需要重复监听
                                zooKeeper.exists(event.getPath(), true);
                                // 节点删除
                            } else if (NodeDeleted == event.getType()) {
                                System.out.println("Node " + event.getPath() + " Deleted");
                                zooKeeper.exists(event.getPath(), true);
                                // 节点更新
                            } else if (NodeDataChanged == event.getType()) {
                                System.out.println("Node " + event.getPath() + " DataChanged");
                                zooKeeper.exists(event.getPath(), true);
                            }
                        }
                    } catch (Exception ignored) {

                    }
                });

        // 阻塞，成功连接服务器后再解除。
        connectedSemaphore.await();

        /*
          开始时，服务器上是没有测试节点的 ls /fruit Node does not exist: /fruit
          观察以下事件通知
          创建节点 create /fruit apple
          更新节点 set /fruit banana
          删除节点 delete /fruit
         */
        zooKeeper.exists("/fruit", true, (rc, path, ctx, stat) -> System.out.println("rc: " + rc + ", path: " + path + ", stat: " + stat), null);

        // 阻塞，不要让程序结束，因为要监听事件通知。
        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

测试数据
```bash
[zk: localhost:2181(CONNECTED) 32] create /fruit apple
Created /fruit
[zk: localhost:2181(CONNECTED) 33] set /fruit banana
cZxid = 0x82
ctime = Sat Apr 21 18:19:57 CST 2018
mZxid = 0x83
mtime = Sat Apr 21 18:20:01 CST 2018
pZxid = 0x82
cversion = 0
dataVersion = 1
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 6
numChildren = 0
[zk: localhost:2181(CONNECTED) 34] delete /fruit
```

输出结果
```
WatchedEvent state:SyncConnected type:None path:null
rc: -101, path: /fruit, stat: null
WatchedEvent state:SyncConnected type:NodeCreated path:/fruit
Node /fruit Created
WatchedEvent state:SyncConnected type:NodeDataChanged path:/fruit
Node /fruit DataChanged
WatchedEvent state:SyncConnected type:NodeDeleted path:/fruit
Node /fruit Deleted
```

### 5.3.7 权限控制

ACL 的注意点参考笔记：http://note.youdao.com/noteshare?id=db92669bcb1add78a8ca0886798d8f95

**清单 5-13 使用包含权限信息的 ZooKeeper 会话创建数据节点**
```java
package chapter05.$5_3_7;

import org.apache.zookeeper.ZooKeeper;

import static org.apache.zookeeper.CreateMode.EPHEMERAL;
import static org.apache.zookeeper.ZooDefs.Ids.CREATOR_ALL_ACL;

/**
 * 5.3.7 清单 5-13 使用包含权限信息的 ZooKeeper 会话创建数据节点
 */
public class AuthSample {

    private final static String PATH = "/fruit";

    public static void main(String[] args) throws Exception {

        ZooKeeper zookeeper = new ZooKeeper("localhost:2181", 5000,
                System.out::println);

        // 添加认证信息，ID 是 tom，密码是 123456。
        zookeeper.addAuthInfo("digest", "tom:123456".getBytes());

        // 在 Java API 上添加了认证信息后，后续对节点的 ACL 操作会使用这些认证信息。
        // 创建临时节点并设置 ACL 为 CREATOR_ALL_ACL（表示创建者 tom 有全部权限）。
        zookeeper.create(PATH, "apple".getBytes(), CREATOR_ALL_ACL, EPHEMERAL);

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

执行上面的程序，并在 zkCli 上验证结果。
```bash
[zk: localhost:2181(CONNECTED) 0] getAcl /fruit
'digest,'tom:3YvKnq60bERLJOlabQFeB1f+/n0=
: cdrwa
# 认证不通过，出现异常退出。
[zk: localhost:2181(CONNECTED) 1] get /fruit
Exception in thread "main" org.apache.zookeeper.KeeperException$NoAuthException: KeeperErrorCode = NoAuth for /fruit

# 重新进入客户端
# 认证通过
[zk: localhost:2181(CONNECTED) 0] addauth digest tom:123456
[zk: localhost:2181(CONNECTED) 1] get /fruit
apple
cZxid = 0x9a
ctime = Sat Apr 21 21:49:02 CST 2018
mZxid = 0x9a
mtime = Sat Apr 21 21:49:02 CST 2018
pZxid = 0x9a
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x162e850b00f0007
dataLength = 5
numChildren = 0
```

**访问含权限信息的数据节点**
```java
package chapter05.$5_3_7;

import org.apache.zookeeper.ZooKeeper;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.CreateMode.EPHEMERAL;
import static org.apache.zookeeper.ZooDefs.Ids.CREATOR_ALL_ACL;

/**
 * 5.3.7 访问含权限信息的数据节点
 */
public class AuthSampleGet {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);
    private final static String PATH = "/fruit";
    private final static String connectString = "localhost:2181";

    public static void main(String[] args) throws Exception {

        // 创建第一个会话
        ZooKeeper zookeeper1 = new ZooKeeper(connectString, 5000,
                event -> {
                    System.out.println("zookeeper1: " + event);
                    connectedSemaphore.countDown();
                });

        connectedSemaphore.await();

        // 添加认证信息
        zookeeper1.addAuthInfo("digest", "tom:123456".getBytes());
        // 创建一个带 ACL 的临时节点
        zookeeper1.create(PATH, "apple".getBytes(), CREATOR_ALL_ACL, EPHEMERAL);

        // 创建第二个会话，不添加认证信息。
        ZooKeeper zookeeper2 = new ZooKeeper(connectString, 5000,
                event -> {
                    System.out.println("zookeeper2: " + event);
                    connectedSemaphore.countDown();
                });

        connectedSemaphore.await();

        try {
            zookeeper2.getData(PATH, false, null);
        } catch (Exception e) { // 认证不通过，抛出异常。
            System.out.println("不添加认证信息 " + e); // NoAuthException: KeeperErrorCode = NoAuth for /fruit
        }

        // 创建第三个会话，添加错误的认证信息。
        ZooKeeper zookeeper3 = new ZooKeeper(connectString, 5000,
                event -> {
                    System.out.println("zookeeper3: " + event);
                    connectedSemaphore.countDown();
                });

        connectedSemaphore.await();

        zookeeper3.addAuthInfo("digest", "tom:654321".getBytes());

        try {
            zookeeper3.getData(PATH, false, null);
        } catch (Exception e) { // 认证不通过，抛出异常。
            System.out.println("添加错误的认证信息 " + e); // NoAuthException: KeeperErrorCode = NoAuth for /fruit
        }

        // 创建第四个会话，添加正确的认证信息。
        ZooKeeper zookeeper4 = new ZooKeeper(connectString, 5000,
                event -> {
                    System.out.println("zookeeper4: " + event);
                    connectedSemaphore.countDown();
                });

        connectedSemaphore.await();

        zookeeper4.addAuthInfo("digest", "tom:123456".getBytes());

        try {
            System.out.println("添加正确的认证信息 " + new String(zookeeper4.getData(PATH, false, null))); // apple
        } catch (Exception e) {
            System.out.println(e);
        }

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

输出结果
```
zookeeper1: WatchedEvent state:SyncConnected type:None path:null
zookeeper2: WatchedEvent state:SyncConnected type:None path:null
不添加认证信息 org.apache.zookeeper.KeeperException$NoAuthException: KeeperErrorCode = NoAuth for /fruit
zookeeper3: WatchedEvent state:SyncConnected type:None path:null
添加错误的认证信息 org.apache.zookeeper.KeeperException$NoAuthException: KeeperErrorCode = NoAuth for /fruit
zookeeper4: WatchedEvent state:SyncConnected type:None path:null
添加正确的认证信息 apple
```

**清单 5-16 删除节点接口的权限控制**
```java
package chapter05.$5_3_7;

import org.apache.zookeeper.ZooKeeper;

import java.util.concurrent.CountDownLatch;

import static org.apache.zookeeper.CreateMode.EPHEMERAL;
import static org.apache.zookeeper.CreateMode.PERSISTENT;
import static org.apache.zookeeper.ZooDefs.Ids.CREATOR_ALL_ACL;

/**
 * 5.3.7 清单 5-16 删除节点接口的权限控制
 */
public class AuthSampleDelete {

    private static final CountDownLatch connectedSemaphore = new CountDownLatch(1);
    private final static String connectString = "localhost:2181";
    private final static String FRUIT = "/fruit";
    private final static String FRUIT_APPLE = "/fruit/apple";

    public static void main(String[] args) throws Exception {

        ZooKeeper zookeeper1 = new ZooKeeper(connectString, 5000, event -> {
            System.out.println("zookeeper1: " + event);
            connectedSemaphore.countDown();
        });
        connectedSemaphore.await();
        zookeeper1.addAuthInfo("digest", "tom:123456".getBytes());
        // 创建父节点
        zookeeper1.create(FRUIT, "fruit".getBytes(), CREATOR_ALL_ACL, PERSISTENT);
        // 创建子节点
        zookeeper1.create(FRUIT_APPLE, "apple".getBytes(), CREATOR_ALL_ACL, EPHEMERAL);

        // 未添加认证信息，删除子节点失败。
        ZooKeeper zookeeper2 = new ZooKeeper(connectString, 5000, event -> {
            System.out.println("zookeeper2: " + event);
            connectedSemaphore.countDown();
        });
        connectedSemaphore.await();
        try {
            zookeeper2.delete(FRUIT_APPLE, -1);
        } catch (Exception e) {
            System.out.println("删除【子】节点失败（未添加认证信息）" + e);
        }

        // 添加正确的认证信息，删除子节点成功。
        ZooKeeper zookeeper3 = new ZooKeeper(connectString, 5000, event -> {
            System.out.println("zookeeper3: " + event);
            connectedSemaphore.countDown();
        });
        connectedSemaphore.await();
        zookeeper3.addAuthInfo("digest", "tom:123456".getBytes());
        zookeeper3.delete(FRUIT_APPLE, -1);
        System.out.println("成功删除【子】节点（添加正确的认证信息）" + FRUIT_APPLE);

        // 删除父节点不需要认证
        ZooKeeper zookeeper4 = new ZooKeeper(connectString, 5000, event -> {
            System.out.println("zookeeper4: " + event);
            connectedSemaphore.countDown();
        });
        connectedSemaphore.await();
        zookeeper4.delete(FRUIT, -1);
        System.out.println("成功删除【父】节点（未添加认证信息）" + FRUIT);

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

输出结果
```
zookeeper1: WatchedEvent state:SyncConnected type:None path:null
zookeeper2: WatchedEvent state:SyncConnected type:None path:null
删除【子】节点失败（未添加认证信息）org.apache.zookeeper.KeeperException$NoAuthException: KeeperErrorCode = NoAuth for /fruit/apple
zookeeper3: WatchedEvent state:SyncConnected type:None path:null
成功删除【子】节点（添加正确的认证信息）/fruit/apple
zookeeper4: WatchedEvent state:SyncConnected type:None path:null
成功删除【父】节点（未添加认证信息）/fruit
```

**注意：当客户端对一个数据节点（例如 `/fruit`）添加了权限信息后，对于删除操作而言，其作用范围是其子节点，也就是说，可以自由地删除父节点（`/fruit`），但是要删除子节点（`/fruit/apple`），必须要有相应的权限信息才可以。**

## 5.4 开源客户端

### 5.4.2 Curator

**使用 Curator 创建会话**

清单 5-21 使用 Curator 创建会话
```java
package chapter05.$5_4_2;

import org.apache.curator.RetryPolicy;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;

/**
 * 5.4.2 清单 5-21 使用 Curator 创建会话
 */
public class CreateSessionSample {

    public static void main(String[] args) throws Exception {
        RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 3);
        CuratorFramework client = CuratorFrameworkFactory.newClient("localhost:2181", 5000,
                3000, retryPolicy);
        client.start();
        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

验证结果
```bash
$ echo cons | nc localhost 2181
 /0:0:0:0:0:0:0:1:60191[0](queued=0,recved=1,sent=0)
 /0:0:0:0:0:0:0:1:60183[1](queued=0,recved=9,sent=9,sid=0x162ec2a9ea60006,lop=PING,est=1524383417749,to=5000,lcxid=0x0,lzxid=0xe2,lresp=1524383431135,llat=0,minlat=0,avglat=0,maxlat=2)
```

**使用 Fluent 风格的 API 接口创建会话**

清单 5-22 使用 Fluent 风格的 API 接口创建会话
```java
package chapter05.$5_4_2;

import org.apache.curator.RetryPolicy;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;

/**
 * 5.4.2 清单 5-22 使用 Fluent 风格的 API 接口创建会话
 */
public class CreateSessionSampleFluent {
    public static void main(String[] args) throws Exception {
        RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 3);
        CuratorFramework client = CuratorFrameworkFactory.builder()
                .connectString("localhost:2181")
                .sessionTimeoutMs(5000)
                .retryPolicy(retryPolicy)
                .build();
        client.start();
        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

验证结果
```bash
$ echo cons | nc localhost 2181
 /0:0:0:0:0:0:0:1:60234[1](queued=0,recved=2,sent=2,sid=0x162ec2a9ea60007,lop=PING,est=1524383496907,to=5000,lcxid=0x0,lzxid=0xe4,lresp=1524383498594,llat=0,minlat=0,avglat=0,maxlat=1)
 /0:0:0:0:0:0:0:1:60237[0](queued=0,recved=1,sent=0)
```

**使用 Curator 创建含隔离命名空间的会话**

```java
package chapter05.$5_4_2;

import org.apache.curator.RetryPolicy;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;

/**
 * 5.4.2 使用 Curator 创建含隔离命名空间的会话
 */
public class CreateSessionSampleWithNamespace {
    public static void main(String[] args) throws Exception {
        RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 3);
        CuratorFramework client = CuratorFrameworkFactory.builder()
                .connectString("localhost:2181")
                .sessionTimeoutMs(5000)
                .retryPolicy(retryPolicy)
                .namespace("base")
                .build();
        client.start();
        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

验证结果
```bash
$ echo cons | nc localhost 2181
 /127.0.0.1:60277[1](queued=0,recved=3,sent=3,sid=0x162ec2a9ea60008,lop=PING,est=1524383542224,to=5000,lcxid=0x0,lzxid=0xe6,lresp=1524383545580,llat=0,minlat=0,avglat=0,maxlat=1)
 /0:0:0:0:0:0:0:1:60283[0](queued=0,recved=1,sent=0)
```

**创建节点**

清单 5-24 Curator 创建节点 API 示例
```java
package chapter05.$5_4_2;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;

import static org.apache.zookeeper.CreateMode.EPHEMERAL;

/**
 * 5.4.2 清单 5-24 Curator 创建节点 API 示例
 */
public class CreateNodeSample {

    private static final CuratorFramework client = CuratorFrameworkFactory.builder()
            .connectString("localhost:2181")
            .sessionTimeoutMs(5000)
            .retryPolicy(new ExponentialBackoffRetry(1000, 3))
            .build();

    public static void main(String[] args) throws Exception {

        client.start();
        client.create()
                .creatingParentsIfNeeded() // 自动创建父节点
                .withMode(EPHEMERAL)
                .forPath("/fruit/apple", "apple".getBytes());

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

验证结果
```bash
[zk: localhost:2181(CONNECTED) 1] ls /
[zookeeper, fruit]
[zk: localhost:2181(CONNECTED) 2] ls /fruit
[apple]
[zk: localhost:2181(CONNECTED) 3] get /fruit/apple
apple
cZxid = 0xec
ctime = Sun Apr 22 15:55:26 CST 2018
mZxid = 0xec
mtime = Sun Apr 22 15:55:26 CST 2018
pZxid = 0xec
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x162ec2a9ea6000a
dataLength = 5
numChildren = 0
```

**删除节点**

清单 5-26 Curator 删除节点 API 示例
```java
package chapter05.$5_4_2;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;

/**
 * 5.4.2 清单 5-26 Curator 删除节点 API 示例
 */
public class DelDataSample {

    private static final CuratorFramework client = CuratorFrameworkFactory.builder()
            .connectString("localhost:2181")
            .sessionTimeoutMs(5000)
            .retryPolicy(new ExponentialBackoffRetry(1000, 3))
            .build();

    public static void main(String[] args) throws Exception {

        client.start();
        /*
          创建测试节点
          create /fruit fruit
          create /fruit/apple apple
         */
        client.delete().deletingChildrenIfNeeded().forPath("/fruit/apple");

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

验证结果
```bash
# 创建测试节点
[zk: localhost:2181(CONNECTED) 2] ls /
[zookeeper]
[zk: localhost:2181(CONNECTED) 3] create /fruit fruit
Created /fruit
[zk: localhost:2181(CONNECTED) 4] create /fruit/apple apple
Created /fruit/apple
[zk: localhost:2181(CONNECTED) 5] ls /fruit
[apple]
[zk: localhost:2181(CONNECTED) 6] get /fruit/apple
apple
cZxid = 0xf4
ctime = Sun Apr 22 16:27:15 CST 2018
mZxid = 0xf4
mtime = Sun Apr 22 16:27:15 CST 2018
pZxid = 0xf4
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 5
numChildren = 0
# 程序运行后
[zk: localhost:2181(CONNECTED) 7] ls /
[zookeeper, fruit]
[zk: localhost:2181(CONNECTED) 10] ls /fruit
[]
```

**读取数据**

清单 5-28 Curator 读取数据 API 示例
```java
package chapter05.$5_4_2;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;
import org.apache.zookeeper.data.Stat;

/**
 * 5.4.2 清单 5-28 Curator 读取数据 API 示例
 */
public class GetDataSample {

    static String path = "/zk-book/c1";

    static CuratorFramework client = CuratorFrameworkFactory.builder()
            .connectString("localhost:2181")
            .sessionTimeoutMs(5000)
            .retryPolicy(new ExponentialBackoffRetry(1000, 3))
            .build();

    public static void main(String[] args) throws Exception {

        /**
         * 创建测试节点
         * create /zk-book hello
         * create /zk-book/c1 world
         */
        client.start();
        Stat stat = new Stat();
        byte[] data = client.getData().storingStatIn(stat).forPath(path);
        System.out.println("data: " + new String(data));
        System.out.println("stat: " + stat);

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

输出结果
```
data: orange
stat: 248,248,1524386526299,1524386526299,0,0,0,0,6,0,248
```

测试数据
```bash
[zk: localhost:2181(CONNECTED) 14] create /fruit orange
Created /fruit
[zk: localhost:2181(CONNECTED) 15] ls /fruit
[]
[zk: localhost:2181(CONNECTED) 16] get /fruit
orange
cZxid = 0xf8
ctime = Sun Apr 22 16:42:06 CST 2018
mZxid = 0xf8
mtime = Sun Apr 22 16:42:06 CST 2018
pZxid = 0xf8
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 6
numChildren = 0
```

**更新数据**

清单 5-30 Curator 更新数据 API 示例
```java
package chapter05.$5_4_2;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;
import org.apache.zookeeper.data.Stat;

/**
 * 5.4.2 清单 5-30 Curator 更新数据 API 示例
 */
public class SetDataSample {

    private static final CuratorFramework client = CuratorFrameworkFactory.builder()
            .connectString("localhost:2181")
            .sessionTimeoutMs(5000)
            .retryPolicy(new ExponentialBackoffRetry(1000, 3))
            .build();

    public static void main(String[] args) throws Exception {

        /*
          创建测试节点
          create /fruit pear
         */
        client.start();

        // 获取当前数据版本，后面测试异常情况要用到。
        Stat stat = new Stat();
        String path = "/fruit";
        client.getData().storingStatIn(stat).forPath(path);

        // 更新获取到的版本的数据，成功后数据版本将发生改变。
        client.setData().withVersion(stat.getVersion()).forPath(path, "apple".getBytes());

        try {
            // 更新已过期的版本的数据，将出现异常。
            client.setData().withVersion(stat.getVersion()).forPath(path, "banana".getBytes());
        } catch (Exception e) {
            System.out.println(e); // BadVersionException: KeeperErrorCode = BadVersion for /fruit
        }

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

验证结果
```bash
[zk: localhost:2181(CONNECTED) 19] create /fruit pear
Created /fruit
[zk: localhost:2181(CONNECTED) 20] ls /fruit
[]
[zk: localhost:2181(CONNECTED) 21] get /fruit
pear
cZxid = 0xfb
ctime = Sun Apr 22 16:48:21 CST 2018
mZxid = 0xfb
mtime = Sun Apr 22 16:48:21 CST 2018
pZxid = 0xfb
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 4
numChildren = 0
[zk: localhost:2181(CONNECTED) 22] get /fruit
apple # 更新成功
cZxid = 0xfb
ctime = Sun Apr 22 16:48:21 CST 2018
mZxid = 0xfd
mtime = Sun Apr 22 16:48:37 CST 2018
pZxid = 0xfb
cversion = 0
dataVersion = 1 # 数据版本发生了变化
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 5
numChildren = 0
```

**异步接口**

清单 5-33 Curator 异步 API 使用示例
```java
package chapter05.$5_4_2;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import static org.apache.zookeeper.CreateMode.PERSISTENT;

/**
 * 5.4.2 清单 5-33 Curator 异步 API 使用示例
 */
public class CreateNodeBackgroundSample {

    private static final CuratorFramework client = CuratorFrameworkFactory.builder()
            .connectString("localhost:2181")
            .sessionTimeoutMs(5000)
            .retryPolicy(new ExponentialBackoffRetry(1000, 3))
            .build();

    private static final CountDownLatch semaphore = new CountDownLatch(2);
    private static final ExecutorService threadPool = Executors.newFixedThreadPool(2);

    public static void main(String[] args) throws Exception {

        client.start();
        System.out.println("Main thread: " + Thread.currentThread().getName());

        // 传入自定义的 Executor
        String apple = "/apple";
        client.create().creatingParentsIfNeeded().withMode(PERSISTENT)
                .inBackground((client, event) -> {
                    System.out.println("path: " + apple + " event[code: " + event.getResultCode() + ", type: " + event.getType() + "]");
                    System.out.println("path: " + apple + " Thread of processResult: " + Thread.currentThread().getName());
                    semaphore.countDown();
                }, threadPool).forPath(apple, "apple".getBytes());


        // 没有传入自定义的 Executor
        String banana = "/banana";
        client.create().creatingParentsIfNeeded().withMode(PERSISTENT)
                .inBackground((client, event) -> {
                    System.out.println("path: " + banana + " event[code: " + event.getResultCode() + ", type: " + event.getType() + "]");
                    System.out.println("path: " + banana + " Thread of processResult: " + Thread.currentThread().getName());
                    semaphore.countDown();
                }).forPath("/banana", "banana".getBytes());

        semaphore.await();

        threadPool.shutdown();
    }
}
```

输出结果
```
Main thread: main
path: /banana event[code: 0, type: CREATE]
path: /banana Thread of processResult: main-EventThread
path: /apple event[code: 0, type: CREATE]
path: /apple Thread of processResult: pool-3-thread-1
```

验证结果
```bash
[zk: localhost:2181(CONNECTED) 31] ls /
[banana, apple, zookeeper]
```

**典型使用场景**

**事件监听**

清单 5-35 NodeCache 使用示例
```java
package chapter05.$5_4_2;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.cache.NodeCache;
import org.apache.curator.retry.ExponentialBackoffRetry;

/**
 * 5.4.2 清单 5-35 NodeCache 使用示例
 */
public class NodeCacheSample {

    private static final CuratorFramework client = CuratorFrameworkFactory.builder()
            .connectString("localhost:2181")
            .sessionTimeoutMs(5000)
            .retryPolicy(new ExponentialBackoffRetry(1000, 3))
            .build();

    public static void main(String[] args) throws Exception {

        client.start();

        /*
          程序运行过程中
          创建节点 create /pet dog
          更新数据 set /pet cat
          更新数据 set /pet pig
          删除节点 delete /pet
          注意观察事件通知
         */
        final NodeCache cache = new NodeCache(client, "/pet", false);
        // true 表示第一次启动时立即读取节点的数据，并保存在 Cache 中。
        cache.start(true);
        // 注册监听器
        cache.getListenable().addListener(() -> {
            // 数据变更通知
            System.out.println("new data: " +
                    new String(cache.getCurrentData().getData()));
        });

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

验证结果
```bash
# 以下操作都是在程序运行过程中进行
# 创建节点
[zk: localhost:2181(CONNECTED) 40] create /pet dog
Created /pet
# 更新数据
[zk: localhost:2181(CONNECTED) 41] set /pet cat
cZxid = 0x117
ctime = Sun Apr 22 17:24:33 CST 2018
mZxid = 0x118
mtime = Sun Apr 22 17:24:43 CST 2018
pZxid = 0x117
cversion = 0
dataVersion = 1
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 3
numChildren = 0
# 更新数据
[zk: localhost:2181(CONNECTED) 42] set /pet pig
cZxid = 0x117
ctime = Sun Apr 22 17:24:33 CST 2018
mZxid = 0x119
mtime = Sun Apr 22 17:24:48 CST 2018
pZxid = 0x117
cversion = 0
dataVersion = 2
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 3
numChildren = 0
# 删除节点
[zk: localhost:2181(CONNECTED) 43] delete /pet
[zk: localhost:2181(CONNECTED) 44] ls /pet
Node does not exist: /pet
```

输出结果
```
new data: dog # 创建节点的通知
new data: cat # 更新数据的通知
new data: pig # 更新数据的通知
# 删除节点没有通知
```

清单 5-37 PathChildrenCache 使用示例
```java
package chapter05.$5_4_2;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.cache.PathChildrenCache;
import org.apache.curator.retry.ExponentialBackoffRetry;

import static org.apache.curator.framework.recipes.cache.PathChildrenCache.StartMode.POST_INITIALIZED_EVENT;

/**
 * 5.4.2 清单 5-37 PathChildrenCache 使用示例
 */
public class PathChildrenCacheSample {

    private static final CuratorFramework client = CuratorFrameworkFactory.builder()
            .connectString("localhost:2181")
            .sessionTimeoutMs(5000)
            .retryPolicy(new ExponentialBackoffRetry(1000, 3))
            .build();

    public static void main(String[] args) throws Exception {

        client.start();

        /*
          创建测试节点 create /fruit fruit
          程序运行过程中
          创建子节点 create /fruit/apple apple
          更新子节点 set /fruit/apple apple2
          删除子节点 delete /fruit/apple
          更新节点本身的数据 set /fruit fruit2
          创建二级子节点
          create /fruit/banana banana
          create /fruit/banana/japan_banana japan_banana
          注意观察事件通知
         */
        PathChildrenCache cache = new PathChildrenCache(client, "/fruit", true);
        cache.start(POST_INITIALIZED_EVENT);
        cache.getListenable().addListener((client, event) -> {
            switch (event.getType()) {
                case CHILD_ADDED:
                    System.out.println("CHILD_ADDED path: " + event.getData().getPath() + " data: " + new String(event.getData().getData()));
                    break;
                case CHILD_UPDATED:
                    System.out.println("CHILD_UPDATED path: " + event.getData().getPath() + " data: " + new String(event.getData().getData()));
                    break;
                case CHILD_REMOVED:
                    System.out.println("CHILD_REMOVED path: " + event.getData().getPath() + " data: " + new String(event.getData().getData()));
                    break;
                default:
                    break;
            }
        });

        Thread.sleep(Integer.MAX_VALUE);
    }
}
```

验证结果
```bash
[zk: localhost:2181(CONNECTED) 39] create /fruit fruit
Created /fruit
[zk: localhost:2181(CONNECTED) 40] create /fruit/apple apple
Created /fruit/apple
[zk: localhost:2181(CONNECTED) 41] set /fruit/apple apple2
cZxid = 0x14a
ctime = Sun Apr 22 20:46:43 CST 2018
mZxid = 0x14b
mtime = Sun Apr 22 20:46:50 CST 2018
pZxid = 0x14a
cversion = 0
dataVersion = 1
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 6
numChildren = 0
[zk: localhost:2181(CONNECTED) 42] delete /fruit/apple
[zk: localhost:2181(CONNECTED) 43] set /fruit fruit2
cZxid = 0x148
ctime = Sun Apr 22 20:46:32 CST 2018
mZxid = 0x14d
mtime = Sun Apr 22 20:47:04 CST 2018
pZxid = 0x14c
cversion = 2
dataVersion = 1
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 6
numChildren = 0
[zk: localhost:2181(CONNECTED) 46] create /fruit/banana/japan_banana japan_banana
Created /fruit/banana/japan_banana
```

输出结果
```
CHILD_ADDED path: /fruit/apple data: apple
CHILD_UPDATED path: /fruit/apple data: apple2
CHILD_REMOVED path: /fruit/apple data: apple2
CHILD_ADDED path: /fruit/banana data: banana
# 更新节点本身的数据和对二级子节点的操作都不会收到通知
```

