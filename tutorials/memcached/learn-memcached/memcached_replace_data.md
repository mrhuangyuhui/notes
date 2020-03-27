# [Memcached - Replace Data](https://www.tutorialspoint.com/memcached/memcached_replace_data.htm)

```java
import net.spy.memcached.MemcachedClient;

import java.net.InetSocketAddress;

public class MemcachedReplaceDemo {
    public static void main(String[] args) {
        try {
            // Connecting to Memcached server on localhost
            MemcachedClient mcc = new MemcachedClient(new InetSocketAddress("192.168.31.94", 11211));
            System.out.println("Connection to server sucessfully");

            System.out.println("set status: " + mcc.set("tutorialspoint", 900, "memcached").get());

            // Get value from cache
            System.out.println("Get from Cache: " + mcc.get("tutorialspoint"));

            // Replace the existing data
            System.out.println("Replace cache: " + mcc.replace("tutorialspoint", 900, "redis").get());

            // Get the updated data
            System.out.println("Get from Cache: " + mcc.get("tutorialspoint"));
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
```