# [Memcached - Add Data](https://www.tutorialspoint.com/memcached/memcached_add_data.htm)

```java
import net.spy.memcached.MemcachedClient;

import java.net.InetSocketAddress;

public class MemcachedAddDemo {
    public static void main(String[] args) {
        try {
            // Connecting to Memcached server on localhost
            MemcachedClient mcc = new MemcachedClient(new InetSocketAddress("192.168.31.94", 11211));
            System.out.println("Connection to server successful");

            System.out.println("set status: " + mcc.set("tutorialspoint", 900, "memcached").get());
            // 已经存在的 key 再次添加会失败
            System.out.println("add status: " + mcc.add("tutorialspoint", 900, "redis").get()); // add status: false

            System.out.println("add status: " + mcc.add("tp", 900, "redis").get());
            // Get value from cache
            System.out.println("Get from Cache tp:" + mcc.get("tp"));

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
```