# Java 从控制台读取输入

`next()` 方法读取以空白字符结束的字符串。
```java
import java.util.Scanner;

public class HelloWorld {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter three words separated by spaces: ");
        String s1 = input.next();
        String s2 = input.next();
        String s3 = input.next();
        System.out.println("s1 is " + s1);
        System.out.println("s2 is " + s2);
        System.out.println("s3 is " + s3);
    }
}
```

`nextLine()` 方法读取以按下回车键为结束标志的字符串。
```java
import java.util.Scanner;

public class HelloWorld {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter a line: ");
        String s = input.nextLine();
        System.out.println("The line entered is " + s);
    }
}
```