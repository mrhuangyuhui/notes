# fastjson

<https://github.com/alibaba/fastjson/wiki/Samples-DataBind>

```java
import com.alibaba.fastjson.JSON;

public class Main {
    public static void main(String[] args) {
        Group group = new Group();
        group.setId(0L);
        group.setName("admin");

        User guestUser = new User();
        guestUser.setId(2L);
        guestUser.setName("guest");

        User rootUser = new User();
        rootUser.setId(3L);
        rootUser.setName("root");

        group.addUser(guestUser);
        group.addUser(rootUser);

        String jsonString = JSON.toJSONString(group);

        System.out.println(jsonString); // {"id":0,"name":"admin","users":[{"id":2,"name":"guest"},{"id":3,"name":"root"}]}

        group = JSON.parseObject(jsonString, Group.class);
        System.out.println(group); // Group{id=0, name='admin', users=[User{id=2, name='guest'}, User{id=3, name='root'}]}
    }
}
```

完整代码 <https://gitee.com/mrhuangyuhui/java/tree/master/java-demos/fastjson-demo>