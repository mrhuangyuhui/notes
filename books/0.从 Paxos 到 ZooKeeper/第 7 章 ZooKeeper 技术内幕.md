[toc]

# 第 7 章 ZooKeeper 技术内幕

## 7.1 系统模型

### 7.1.5 ACL——保障数据的安全

**清单7-4 对 password 进行编码**
```java
package chapter07.$7_1_5;

import org.apache.zookeeper.server.auth.DigestAuthenticationProvider;

import java.security.NoSuchAlgorithmException;

/**
 * 7.1.5 清单7-4 对 password 进行编码
 */
public class DigestAuthenticationProviderUsage {
    public static void main(String[] args) throws NoSuchAlgorithmException {
        System.out.println(DigestAuthenticationProvider.generateDigest("tom:123456")); // tom:3YvKnq60bERLJOlabQFeB1f+/n0=
    }
}
```
