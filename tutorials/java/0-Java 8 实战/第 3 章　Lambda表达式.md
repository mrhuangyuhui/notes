[toc]

# 第 3 章　Lambda表达式

## 3.1　Lambda管中窥豹

可以把Lambda表达式理解为简洁地表示可传递的匿名函数的一种方式：它没有名称，但它有参数列表、函数主体、返回类型，可能还有一个可以抛出的异常列表。这个定义够大的，让我们慢慢道来。

- 匿名——我们说匿名，是因为它不像普通的方法那样有一个明确的名称：写得少而想得多！

- 函数——我们说它是函数，是因为Lambda函数不像方法那样属于某个特定的类。但和方法一样，Lambda有参数列表、函数主体、返回类型，还可能有可以抛出的异常列表。

- 传递——Lambda表达式可以作为参数传递给方法或存储在变量中。

- 简洁——无需像匿名类那样写很多模板代码。

## 3.2　在哪里以及如何使用Lambda

### 3.2.1　函数式接口

一言以蔽之，函数式接口就是只定义一个抽象方法的接口。

**注意　你将会在第9章中看到，接口现在还可以拥有默认方法（即在类没有对方法进行实现时，其主体为方法提供默认实现的方法）。哪怕有很多默认方法，只要接口只定义了一个抽象方法，它就仍然是一个函数式接口。**

Lambda表达式允许你直接以内联的形式为函数式接口的抽象方法提供实现，并把整个表达式作为函数式接口的实例（具体说来，是函数式接口一个具体实现的实例）。你用匿名内部类也可以完成同样的事情，只不过比较笨拙：需要提供一个实现，然后再直接内联将它实例化。

### 3.2.2　函数描述符

函数式接口的抽象方法的签名基本上就是Lambda表达式的签名。我们将这种抽象方法叫作函数描述符。

## 3.4　使用函数式接口

### 3.4.1　Predicate

- [Interface Predicate<T>](https://docs.oracle.com/javase/8/docs/api/java/util/function/Predicate.html)

### 3.4.2　Consumer

- [Interface Consumer<T>](https://docs.oracle.com/javase/8/docs/api/java/util/function/Consumer.html)

### 3.4.3　Function

- [Interface Function<T,R>](https://docs.oracle.com/javase/8/docs/api/java/util/function/Function.html)


```java
package lambdasinaction.chap3;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

public class Lambdas {
    public static void main(String... args) {
        List<Apple> inventory = Arrays.asList(new Apple(80, "green"), new Apple(155, "green"), new Apple(120, "red"));

        List<Apple> greenApples = filter(inventory, (Apple apple) -> "green".equals(apple.getColor()));
        System.out.println(greenApples);

        Comparator<Apple> comparator = (Apple apple1, Apple apple2) -> apple1.getWeight().compareTo(apple2.getWeight());
        inventory.sort(comparator);
        System.out.println(inventory);
    }

    public static List<Apple> filter(List<Apple> inventory, ApplePredicate predicate) {
        List<Apple> result = new ArrayList<>();
        for (Apple apple :
                inventory) {
            if (predicate.test(apple)) {
                result.add(apple);
            }
        }
        return result;
    }

    public static class Apple {
        private Integer weight = 0;
        private String color = "";

        public Apple(Integer weight, String color) {
            this.weight = weight;
            this.color = color;
        }

        public Integer getWeight() {
            return weight;
        }

        public void setWeight(Integer weight) {
            this.weight = weight;
        }

        public String getColor() {
            return color;
        }

        public void setColor(String color) {
            this.color = color;
        }

        @Override
        public String toString() {
            return "Apple{" +
                    "weight=" + weight +
                    ", color='" + color + '\'' +
                    '}';
        }
    }

    @FunctionalInterface
    interface ApplePredicate {
        public boolean test(Apple apple);
    }
}
```

## 3.6　方法引用

### 3.6.1　管中窥豹

方法引用可以被看作仅仅调用特定方法的Lambda的一种快捷写法。它的基本思想是，如果一个Lambda代表的==只是“直接调用这个方法”==，那最好还是用名称来调用它，而不是去描述如何调用它。事实上，方法引用就是让你根据已有的方法实现来创建Lambda表达式。但是，显式地指明方法的名称，你的代码的可读性会更好。

```java
import java.util.Arrays;
import java.util.List;

public class HelloWorld {
    public static void main(String... args) {
        List<String> list = Arrays.asList("a", "b", "A", "B");
        // list.sort((s1, s2) -> s1.compareToIgnoreCase(s2));
        list.sort(String::compareToIgnoreCase);
        System.out.println(list); // [a, A, b, B]
    }
}
```

方法引用主要有三类。

(1) 指向静态方法的方法引用（例如Integer的parseInt方法，写作Integer::parseInt）。

(2) 指向任意类型实例方法的方法引用（例如String的length方法，写作String::length）。

(3) 指向现有对象的实例方法的方法引用（假设你有一个局部变量expensiveTransaction用于存放Transaction类型的对象，它支持实例方法getValue，那么你就可以写expensiveTransaction::getValue）。

### 3.6.2　构造函数引用

对于一个现有构造函数，你可以利用它的名称和关键字new来创建它的一个引用：ClassName::new。它的功能与指向静态方法的引用类似。

构造函数没有参数
```java
import java.util.function.Supplier;

public class HelloWorld {
    public static void main(String... args) {
        Supplier<Apple> c1 = Apple::new;
        Apple a1 = c1.get();
        // 等价于
        Supplier<Apple> c2 = () -> new Apple();
        Apple a2 = c2.get();
    }

    public static class Apple {

    }
}
```

构造函数有一个参数
```java
import java.util.function.Function;

public class HelloWorld {
    public static void main(String... args) {
        Function<Integer, Apple> c1 = Apple::new;
        Apple a1 = c1.apply(110);
        // 等价于
        Function<Integer, Apple> c2 = (weight) -> new Apple(weight);
        Apple a2 = c2.apply(110);
    }

    public static class Apple {
        private Integer weight = 0;

        public Apple(Integer weight) {
            this.weight = weight;
        }
    }
}
```

```java
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Function;

public class HelloWorld {
    public static void main(String... args) {
        List<Integer> weights = Arrays.asList(7, 3, 4, 10);
        List<Apple> apples = map(weights, Apple::new);
        System.out.println(apples); // [Apple{weight=7}, Apple{weight=3}, Apple{weight=4}, Apple{weight=10}]
    }

    public static List<Apple> map(List<Integer> list,
                                  Function<Integer, Apple> f) {
        List<Apple> result = new ArrayList<>();
        for (Integer e : list) {
            result.add(f.apply(e));
        }
        return result;
    }

    public static class Apple {
        private Integer weight = 0;

        public Apple(Integer weight) {
            this.weight = weight;
        }

        @Override
        public String toString() {
            return "Apple{" +
                    "weight=" + weight +
                    '}';
        }
    }
}
```

构造函数有两个参数
```java
import java.util.function.BiFunction;

public class HelloWorld {
    public static void main(String... args) {
        BiFunction<String, Integer, Apple> c1 = Apple::new;
        Apple a1 = c1.apply("green", 110);
        // 等价于
        BiFunction<String, Integer, Apple> c2 =
                (color, weight) -> new Apple(color, weight);
        Apple a2 = c2.apply("green", 110);
    }

    public static class Apple {
        private String color = "";
        private Integer weight = 0;

        public Apple(String color, Integer weight) {
            this.color = color;
            this.weight = weight;
        }
    }
}
```

```java
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

public class HelloWorld {

    public static void main(String... args) {
        Fruit apple = giveMeFruit("apple", 12);
        System.out.println(apple);
        Fruit orange = giveMeFruit("orange", 10);
        System.out.println(orange);
    }

    static Map<String, Function<Integer, Fruit>> map = new HashMap<>();

    static {
        map.put("apple", Apple::new);
        map.put("orange", Orange::new);
    }

    public static Fruit giveMeFruit(String fruit, Integer weight) {
        return map.get(fruit.toLowerCase())
                .apply(weight);
    }

    public static abstract class Fruit {
        protected Integer weight = 0;

        protected Fruit(Integer weight) {
            this.weight = weight;
        }
    }

    public static class Apple extends Fruit {
        public Apple(Integer weight) {
            super(weight);
        }

        @Override
        public String toString() {
            return "Apple{" +
                    "weight=" + weight +
                    '}';
        }
    }

    public static class Orange extends Fruit {
        public Orange(Integer weight) {
            super(weight);
        }

        @Override
        public String toString() {
            return "Orange{" +
                    "weight=" + weight +
                    '}';
        }
    }
}
```

## 3.7　Lambda和方法引用实战

```java
package lambdasinaction.chap3;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

public class Sorting {

    public static void main(String... args) {
        List<Apple> inventory = new ArrayList<>();
        inventory.addAll(Arrays.asList(new Apple(80, "green"), new Apple(155, "green"), new Apple(120, "red")));

        // 传递代码
        // inventory.sort(new AppleComparator());

        // 匿名类
        /*inventory.sort(new Comparator<Apple>() {
            @Override
            public int compare(Apple o1, Apple o2) {
                return o1.getWeight().compareTo(o2.getWeight());
            }
        });*/

        // Lambda 表达式
        // inventory.sort((a1, a2) -> a1.getWeight().compareTo(a2.getWeight()));

        // 函数引用
        inventory.sort(Comparator.comparing(Apple::getWeight));

        System.out.println(inventory);
    }

    public static class Apple {
        private Integer weight = 0;
        private String color = "";

        public Apple(Integer weight, String color) {
            this.weight = weight;
            this.color = color;
        }

        public Integer getWeight() {
            return weight;
        }

        public void setWeight(Integer weight) {
            this.weight = weight;
        }

        public String getColor() {
            return color;
        }

        public void setColor(String color) {
            this.color = color;
        }

        @Override
        public String toString() {
            return "Apple{" +
                    "weight=" + weight +
                    ", color='" + color + '\'' +
                    '}';
        }
    }

    static class AppleComparator implements Comparator<Apple> {
        @Override
        public int compare(Apple a1, Apple a2) {
            return a1.getWeight().compareTo(a2.getWeight());
        }
    }
}
```

**API**
- [comparing](https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html#comparing-java.util.function.Function-)

## 3.8　复合Lambda表达式的有用方法

```java
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.function.Predicate;

public class HelloWorld {

    public static void main(String... args) {
        List<Apple> inventory = new ArrayList<>();
        inventory.addAll(Arrays.asList(new Apple(80, "green"), new Apple(155, "green"),
                new Apple(120, "red"), new Apple(80, "red"), new Apple(200, "red")));

        // 逆序：按重量递减排序
        /*inventory.sort(Comparator.comparing(Apple::getWeight).reversed());
        System.out.println(inventory);*/

        // 比较器链：两个苹果一样重时，按颜色排序。
        /*inventory.sort(Comparator.comparing(Apple::getWeight).thenComparing(Apple::getColor));
        System.out.println(inventory);*/

        // 谓词复合：negate
        /*Predicate<Apple> redApple = apple -> "red".equals(apple.getColor());
        Predicate<Apple> notRedApple = redApple.negate();
        inventory = filter(inventory, notRedApple);
        System.out.println(inventory);*/

        // 谓词复合：and
        /*Predicate<Apple> redApple = (apple) -> "red".equals(apple.getColor());
        Predicate<Apple> redAndHeavyApple = redApple.and(apple -> apple.getWeight() > 150);
        inventory = filter(inventory, redAndHeavyApple);
        System.out.println(inventory);*/

        // 谓词复合：or
        Predicate<Apple> redApple = (apple) -> "red".equals(apple.getColor());
        Predicate<Apple> redAndHeavyAppleOrGreen = redApple.and(apple -> apple.getWeight() > 150).or(apple -> "green".equals(apple.getColor()));
        inventory = filter(inventory, redAndHeavyAppleOrGreen);
        System.out.println(inventory);
    }

    public static List<Apple> filter(List<Apple> inventory, Predicate<Apple> predicate) {
        List<Apple> result = new ArrayList<>();
        for (Apple apple :
                inventory) {
            if (predicate.test(apple)) {
                result.add(apple);
            }
        }
        return result;
    }

    public static class Apple {
        private Integer weight = 0;
        private String color = "";

        public Apple(Integer weight, String color) {
            this.weight = weight;
            this.color = color;
        }

        public Integer getWeight() {
            return weight;
        }

        public void setWeight(Integer weight) {
            this.weight = weight;
        }

        public String getColor() {
            return color;
        }

        public void setColor(String color) {
            this.color = color;
        }

        @Override
        public String toString() {
            return "Apple{" +
                    "weight=" + weight +
                    ", color='" + color + '\'' +
                    '}';
        }
    }
}
```

```java
import java.util.function.Function;

public class HelloWorld {
    public static void main(String... args) {
        Function<Integer, Integer> f = x -> x + 1;
        Function<Integer, Integer> g = x -> x * 10;
        // Function<Integer, Integer> h = f.andThen(g); // 数学上写作 g(f(x))
        Function<Integer, Integer> h = f.compose(g); // 数学上写作 f(g(x))
        int result = h.apply(1);
        System.out.println(result);
    }
}
```


```java
import java.util.function.Function;

public class HelloWorld {
    public static void main(String... args) {
        Function<String, String> addHeader = Letter::addHeader;
        // 先加上抬头，然后进行拼写检查，最后加上一个落款。
        // Function<String, String> transformationPipeline = addHeader.andThen(Letter::checkSpelling).andThen(Letter::addFooter);
        // 只加抬头、落款，而不做拼写检查。
        Function<String, String> transformationPipeline = addHeader.andThen(Letter::addFooter);
        String result = transformationPipeline.apply("Hello, labda!");
        System.out.println(result);
    }

    public static class Letter {
        public static String addHeader(String text) {
            return "From Raoul, Mario and Alan: " + text;
        }

        public static String addFooter(String text) {
            return text + " Kind regards";
        }

        public static String checkSpelling(String text) {
            return text.replaceAll("labda", "lambda");
        }
    }
}
```

## 3.9　数学中的类似思想

n/a