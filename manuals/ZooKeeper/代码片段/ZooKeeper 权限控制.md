# ZooKeeper 权限控制

ACL 的示例代码参考笔记 http://note.youdao.com/noteshare?id=48d62459716bddc7737588a9bc0d42d9

对 `digest` 权限模式下的 `id:password` 进行编码
```java
import org.apache.zookeeper.server.auth.DigestAuthenticationProvider;
import java.security.NoSuchAlgorithmException;

public class DigestAuthenticationProviderUsage {
    public static void main(String[] args) throws NoSuchAlgorithmException {
        System.out.println(DigestAuthenticationProvider.generateDigest("tom:123456")); // tom:3YvKnq60bERLJOlabQFeB1f+/n0=
    }
}
```

- 不管是在新建的节点还是已有的节点上添加 ACL 权限控制，认证信息使用密文，如 `ccreate /fruit apple digest:tom:3YvKnq60bERLJOlabQFeB1f+/n0=:cdwra` 和 `setAcl /fruit digest:tom:3YvKnq60bERLJOlabQFeB1f+/n0=:cdwra`。
- 在客户端上添加认证信息使用明文，如 `addauth digest tom:123456`。

测试：创建节点的同时添加 ACL
```bash
# ZooKeeper 3.4.3
# 创建一个带 ACL 的节点，id:password 必须使用密文（tom:123456 加密后是 tom:3YvKnq60bERLJOlabQFeB1f+/n0=）
[zk: localhost:2181(CONNECTED) 1] create -e /fruit apple digest:tom:3YvKnq60bERLJOlabQFeB1f+/n0=:cdwra
Created /fruit
[zk: localhost:2181(CONNECTED) 2] getAcl /fruit
'digest,'tom:3YvKnq60bERLJOlabQFeB1f+/n0=
: cdrwa
# 未获取认证授权，出现异常并退出客户端。
[zk: localhost:2181(CONNECTED) 3] get /fruit
Exception in thread "main" org.apache.zookeeper.KeeperException$NoAuthException: KeeperErrorCode = NoAuth for /fruit

# 以下操作在另一个客户端进行
[zk: localhost:2181(CONNECTED) 1] create -e /fruit apple digest:tom:3YvKnq60bERLJOlabQFeB1f+/n0=:cdwra
Created /fruit
# 获取认证授权，id:password 使用明文。
[zk: localhost:2181(CONNECTED) 2] addauth digest tom:123456
[zk: localhost:2181(CONNECTED) 3] get /fruit
apple
cZxid = 0x8a
ctime = Sat Apr 21 21:12:59 CST 2018
mZxid = 0x8a
mtime = Sat Apr 21 21:12:59 CST 2018
pZxid = 0x8a
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x162e850b00f0001
dataLength = 5
numChildren = 0

# 以下操作在另一个客户端进行
# 未获取认证授权，出现异常并退出客户端。
[zk: localhost:2181(CONNECTED) 0] get /fruit
Exception in thread "main" org.apache.zookeeper.KeeperException$NoAuthException: KeeperErrorCode = NoAuth for /fruit

# 以下操作在另一个客户端进行
[zk: localhost:2181(CONNECTED) 0] getAcl /fruit
'digest,'tom:3YvKnq60bERLJOlabQFeB1f+/n0=
: cdrwa
# 认证授权通过
[zk: localhost:2181(CONNECTED) 1] addauth digest tom:123456
[zk: localhost:2181(CONNECTED) 2] get /fruit
apple
cZxid = 0x8a
ctime = Sat Apr 21 21:12:59 CST 2018
mZxid = 0x8a
mtime = Sat Apr 21 21:12:59 CST 2018
pZxid = 0x8a
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x162e850b00f0001
dataLength = 5
numChildren = 0
```

测试：在已有的节点上添加 ACL
```bash
# ZooKeeper 3.4.3

# 创建一个节点，不带 ACL，然后退出。
[zk: localhost:2181(CONNECTED) 0] create /fruit apple
Created /fruit
[zk: localhost:2181(CONNECTED) 1] quit
Quitting...
2018-04-21 21:23:24,913 [myid:] - INFO  [main:ZooKeeper@679] - Session: 0x162e850b00f0004 closed
2018-04-21 21:23:24,916 [myid:] - INFO  [main-EventThread:ClientCnxn$EventThread@511] - EventThread shut down

# 重新进入客户端
[zk: localhost:2181(CONNECTED) 0] getAcl /fruit
'world,'anyone
: cdrwa
[zk: localhost:2181(CONNECTED) 1] get /fruit
apple
cZxid = 0x91
ctime = Sat Apr 21 21:23:23 CST 2018
mZxid = 0x91
mtime = Sat Apr 21 21:23:23 CST 2018
pZxid = 0x91
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 5
numChildren = 0
# 设置 ACL 权限控制
[zk: localhost:2181(CONNECTED) 2] setAcl /fruit digest:tom:3YvKnq60bERLJOlabQFeB1f+/n0=:cdwra
cZxid = 0x91
ctime = Sat Apr 21 21:23:23 CST 2018
mZxid = 0x91
mtime = Sat Apr 21 21:23:23 CST 2018
pZxid = 0x91
cversion = 0
dataVersion = 0
aclVersion = 1
ephemeralOwner = 0x0
dataLength = 5
numChildren = 0
[zk: localhost:2181(CONNECTED) 3] getAcl /fruit
'digest,'tom:3YvKnq60bERLJOlabQFeB1f+/n0=
: cdrwa
# 读取数据，由于未获取认证授权，出现异常退出。
[zk: localhost:2181(CONNECTED) 4] get /fruit
Exception in thread "main" org.apache.zookeeper.KeeperException$NoAuthException: KeeperErrorCode = NoAuth for /fruit

# 重新进入客户端
# 认证通过
[zk: localhost:2181(CONNECTED) 0] addauth digest tom:123456
[zk: localhost:2181(CONNECTED) 1] get /fruit
apple
cZxid = 0x91
ctime = Sat Apr 21 21:23:23 CST 2018
mZxid = 0x91
mtime = Sat Apr 21 21:23:23 CST 2018
pZxid = 0x91
cversion = 0
dataVersion = 0
aclVersion = 1
ephemeralOwner = 0x0
dataLength = 5
numChildren = 0
```
