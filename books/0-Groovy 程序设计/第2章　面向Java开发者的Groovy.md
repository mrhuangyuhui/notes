[toc]

# 第2章　面向Java开发者的Groovy

因为Groovy支持Java语法，并且保留了Java语义，所以我们尽可以随心所欲地混用两种语言风格。

## 2.1　从Java到Groovy

### 2.1.1　Hello，Groovy

```groovy
// LightGreetings.groovy

for(int i = 0; i < 3; i++) {
  System.out.print("ho ")
}

System.out.println("Merry Groovy!")
```

输出结果：
```bash
$ groovy LightGreetings.groovy
ho ho ho Merry Groovy!
```

```groovy
// LighterGreetings.groovy

for(i in 0..2) { print 'ho ' }

println	'Merry Groovy!'
```

输出结果：
```bash
$ groovy LighterGreetings.groovy
ho ho ho Merry Groovy!
```

> 默认导入 \
> Groovy自动导入下列包：java.lang 、java.util 、java.io 和java.net 。它也会导入java.math.BigDecimal 和java.math.BigInteger 两个类。此外，它还导入了groovy.lang 和groovy.util 这些Groovy包。

### 2.1.2 实现循环的方式

```groovy
println "//" + "START:FOR_OUTPUT"
for(i in 0..2) {
  print "$i "
}
println "\n//" + "END:FOR_OUTPUT"

/***
 * upto() 是 Groovy 向 java.lang.Integer 类中添加的一个实例方法，可用于迭代。upto() 方法接受一个闭包作为参数。
 * 如果闭包只需要一个参数，在 Groovy 中则可以使用默认的名字 it 来表示该参数。
 * 使用 $ 符号，可以在字符串内嵌入一个表达式。
***/
println "//" + "START:UPTO_OUTPUT"
0.upto(2) { print "$it "}
println "\n//" + "END:UPTO_OUTPUT"

println "//" + "START:TIMES_OUTPUT"
3.times { print "$it "}
println "\n//" + "END:TIMES_OUTPUT"

println "//" + "START:STEP_OUTPUT"
0.step(10, 2) { print "$it "}
println "\n//" + "END:STEP_OUTPUT"

println "//" + "START:REDUCED_OUTPUT"
3.times { print 'ho ' }
println 'Merry Groovy!'
println "//" + "END:REDUCED_OUTPUT"
```

输出结果：
```bash
$ groovy WaysToLoop.groovy 
//START:FOR_OUTPUT
0 1 2 
//END:FOR_OUTPUT
//START:UPTO_OUTPUT
0 1 2 
//END:UPTO_OUTPUT
//START:TIMES_OUTPUT
0 1 2 
//END:TIMES_OUTPUT
//START:STEP_OUTPUT
0 2 4 6 8 
//END:STEP_OUTPUT
//START:REDUCED_OUTPUT
ho ho ho Merry Groovy!
//END:REDUCED_OUTPUT
```

### 2.1.3　GDK一瞥

Java 平台的核心优势之一就是其 Java 开发包（JDK）。Groovy 并没有强迫我们学习一组新的类和库。通过向 JDK 的各种类中添加便捷方法，Groovy 扩展了强大的 JDK。这些扩展可以在称作 GDK 的库中获得。

当在String 实例上调用execute() 方法时，Groovy创建了一个扩展了java.lang.Process 的类的实例，就像Java代码中Runtime 类的exec() 方法所做的那样。
```groovy
groovy:000> println 'groovy -v'.execute().getClass().name
java.lang.UNIXProcess
===> null
```

当调用text 时，我们是在调用Groovy在Process 类上添加的getText() 方法，其功能是将该进程的整个标准输出读到一个String 对象中。
```groovy
groovy:000> println 'groovy -v'.execute().text
Groovy Version: 2.1.1 JVM: 1.7.0_141 Vendor: Azul Systems, Inc. OS: Mac OS X

===> null
```

### 2.1.4　安全导航操作符

?. 操作符只有在引用不为null 时才会调用指定的方法或属性。
```groovy
def foo(str) {
    str?.reverse()
}

println foo('evil')
println foo(null)
```

输出结果：
```
live
null
```

使用?. 在空引用上调用reverse() ，其结果是产生了一个null ，而没有抛出空指针异常（NullPointerException ），这是Groovy减少噪音、节省开发者力气的另一手段。

### 2.1.5　异常处理

与Java相比，Groovy少了很多繁文缛节。这一点在异常处理上极其明显。Java强制我们处理所有受检查异常（Checked Exception）。

对于那些我们不想处理，或者不适合在代码的当前层次处理的异常，Groovy并不强制我们处理。我们不处理的任何异常都会被自动传递给更高一层。

```groovy
// 没有处理 FileNotFoundException 异常，传递给调用代码处理。
def openFile(fileName) {
    new FileInputStream(fileName)
}

// 在这里处理
try {
    openFile('nonexistenfile')
} catch(FileNotFoundException ex) {
    println 'Oops: ' + ex
}

try {
    openFile('nonexistenfile')
} catch(ex) { // 变量 ex 前面没有任何类型，可以捕获任何异常，但是不能捕获 Exception 之外的 Error 或 Throwable。要捕获所有这些，请使用 catch(Throwable throwable)。
    println 'Oops: ' + ex
}
```

输出结果：
```
Oops: java.io.FileNotFoundException: nonexistenfile (No such file or directory)
Oops: java.io.FileNotFoundException: nonexistenfile (No such file or directory)
```

### 2.1.6　Groovy是轻量级的Java

Groovy还有其他一些使这门语言更为轻量级、更为易用的特性，试举几例如下。
- return 语句几乎总是可选的（参见2.11.1节）。
- 尽管可以使用分号分隔语句，但它几乎总是可选的（参见2.11.6节）。
- 方法和类默认是公开（public ）的。
- ?. 操作符只有对象引用不为空时才会分派调用。
- 可以使用具名参数初始化JavaBean（参见2.2节）。
- Groovy不强迫我们捕获自己不关心的异常，这些异常会被传递给代码的调用者。
- 静态方法内可以使用this 来引用Class 对象。

## 2.2　JavaBean

Groovy 会自动为属性创建一个访问器和更改器。
```groovy
class Car {
    // 用 def 声明属性，还可以像 int miles 或 int miles = 0 这样给出类型。
    // Groovy 会自动为属性创建一个访问器和更改器。
    def miles = 0
    // 用 final 声明属性，Groovy 只会为其创建访问器，不会创建更改器。
    final year

    Car(theYear) { year = theYear }
}

Car car = new Car(2008)

println "Year: $car.year" // 调用属性的访问器
println "Miles: $car.miles"
println 'Setting miles'
car.miles = 25 // 调用属性的更改器
println "Miles: $car.miles"
```

输出结果：
```
Year: 2008
Miles: 0
Setting miles
Miles: 25
```

Groovy 的实现不区分 `public`、`private` 和 `protected`，如果想把变量设置为私有的，必须实现一个拒绝任何修改的更改器。
```groovy
class Car {
    final year
    private miles = 0

    Car(theYear) { year = theYear }

    def getMiles() {
        println 'getMiles called.'
        miles
    }

    // Groovy 的实现不区分 public、private 和 protected，如果想把变量设置为私有的，必须实现一个拒绝任何修改的更改器。
    private void setMiles(theMiles) {
        throw new IllegalAccessException("You're not allowed to change miles.")
    }

    def drive(dist) {
        if (dist > 0) {
            // 无法修改 year，但可以修改 miles。
            miles += dist
        }
    }
}

def car = new Car(2012)

println "Year: $car.year"
println "Miles: $car.miles"
println 'Driving'
car.drive(10)
println "Miles: $car.miles"

try {
    print 'Can I see the year? '
    car.year = 1900
} catch(groovy.lang.ReadOnlyPropertyException ex) {
    println ex.message
}

try {
    print 'Can I see the miles? '
    // miles 的更改器不允许在类的外部对该属性进行任何修改
    car.miles = 12
} catch(IllegalAccessException ex) {
    println ex.message
}
```

输出结果：
```
Year: 2012
getMiles called.
Miles: 0
Driving
getMiles called.
Miles: 10
Can I see the year? Cannot set readonly property: year for class: Car
Can I see the miles? You're not allowed to change miles.
```

## 2.3　灵活初始化与具名参数

在构造对象时，可以简单地以逗号分隔的名值对来给属性赋值。

```groovy
class Robot {
    def type, height, width
}

robot = new Robot(type: 'arm', width: 10, height: 40)
println "$robot.type, $robot.height, $robot.width"
```

输出结果：
```
arm, 40, 10
```

如果自己定义了无参构造器，则会先调用自己的无参构造器，然后再给属性赋值。
```groovy
class Robot {
    def type, height, width
    Robot() { println 'Constructor with no parameters.' }
}

robot = new Robot(type: 'arm', width: 10, height: 40)
println "$robot.type, $robot.height, $robot.width"
```

输出结果：
```
Constructor with no parameters.
arm, 40, 10
```

如果自己定义了带参数的构造器，不管自己有没有定义无参构造器，具名参数的赋值都不会生效。
```groovy
class Robot {
    def type, height, width

    Robot() { println 'Constructor with no parameters.' }
    
    Robot(theType) {
        type = theType
    }
}

// [type: 'arm', width: 10, height: 40] 将会整个赋值给 type， 而 height 和 width 则为 null。
robot = new Robot(type: 'arm', width: 10, height: 40)
println "$robot.type, $robot.height, $robot.width"
```

输出结果：
```
[type:arm, width:10, height:40], null, null
```

如果想使用具名参数，那最好只接受一个Map形参，而不要混用不同的形参。
```groovy
class Robot {
    def type, height, width
    // 显式地将第一个形参指定为 Map，可以避免给人带来困惑。
    def access(Map location, weight, fragile) {
        println "Received fragile? $fragile, weight: $weight, loc: $location"
    }

    // 这种方式容易给人带来困惑
    // def access(location, weight, fragile) {
    //     println "Received fragile? $fragile, weight: $weight, loc: $location"
    // }
}

robot = new Robot(type: 'arm', width: 10, height: 40)
println "$robot.type, $robot.height, $robot.width"

robot.access(x: 30, y: 20, z: 10, 50, true)

// 如果发送的实参的个数多于方法的形参的个数，而且多出的实参是
// 名值对，那么 Groovy 会假设方法的第一个形参是一个 Map ，然后
// 将实参列表中的所有名值对组织到一起，作为第一个形参的值。之
// 后，再将剩下的实参按照给出的顺序赋给其余形参。
robot.access(50, true, x: 30, y: 20, z: 10)
```

输出结果：
```
arm, 40, 10
Received fragile? true, weight: 50, loc: [x:30, y:20, z:10]
Received fragile? true, weight: 50, loc: [x:30, y:20, z:10]
```

## 2.4　可选形参

Groovy中可以把方法和构造器的形参设为可选的。实际上，我们想设置多少就可以设置多少，但这些形参必须位于形参列表的末尾。

要定义可选形参，只需要在形参列表中给它赋上一个值。

```groovy
// 如果调用时不提供相应实参，则 Groovy 会假定其值为 10.
def log(x, base=10) {
    Math.log(x) / Math.log(base)
}

println log(1024)
println log(1024, 10)
println log(1024, 2)
```

输出结果：
```
3.0102999566398116
3.0102999566398116
10.0
```

Groovy还会把末尾的数组形参视作可选的。

```groovy
def task(name, String[] details) {
    println "$name - $details"
}

task 'Call', '123-456-7890'
task 'Call', '123-456-7890', '231-546-0987'
task 'Check Mail'
```

输出结果：
```
Call - [123-456-7890]
Call - [123-456-7890, 231-546-0987]
Check Mail - []
```

## 2.5　使用多赋值

要想从方法返回多个结果，并将它们一次性赋给多个变量，我们可以返回一个数组，然后将多个变量以逗号分隔，放在圆括号中，置于赋值表达式左侧即可。

```groovy
def splitName(fullName) { fullName.split(' ') }

def (firstName, lastName) = splitName('James Bond')

println "$lastName, $firstName $lastName"
```

输出结果：
```
Bond, James Bond
```

还可以使用该特性来交换变量，无需创建中间变量来保存被交换的值，只需将欲交换的变量放在圆括号内，置于赋值表达式左侧，同时将它们以相反顺序放于方括号内，置于右侧即可。
```groovy
def name1 = "Thomson"
def name2 = "Thompson"

println "$name1 and $name2"

(name1, name2) = [name2, name1]

println "$name1 and $name2"
```

输出结果：
```
Thomson and Thompson
Thompson and Thomson
```

当变量与值的数目不匹配时，Groovy也可以优雅地处理。如果有多余的变量，Groovy会将它们设置为null ，多余的值则会被丢弃。
```groovy
def (String cat, String mouse) = ['Tom', 'Jerry', 'Spike', 'Tyke']
println "$cat and $mouse"
```

输出结果：
```
Tom and Jerry
```

```groovy
def (first, second, third) = ['Tom', 'Jerry']
println "$first, $second, and $third"
```

输出结果：
```
Tom, Jerry, and null
```

如果多余的变量是不能设置为null 的基本类型，Groovy将抛出一个异常。

## 2.6　实现接口

在Groovy中，可以把一个映射【注：也就是 Map】或一个代码块转化为接口，因此可以快速实现带有多个方法的接口。

- 实现接口的一个方法
```groovy
button.addActionListener(
  { JOptionPane.showMessageDialog(frame, "You clicked!") } as ActionListener
)
```

- 多个接口，实现相同，用一个变量来装代码块。
```groovy
displayMouseLocation = { positionLabel.setText("$it.x, $it.y") }
frame.addMouseListener(displayMouseLocation as MouseListener)
frame.addMouseMotionListener(displayMouseLocation as MouseMotionListener)
```

- 实现接口的多个方法
```groovy
handleFocus = [
  focusGained : { msgLabel.setText("Good to see you!") },
  focusLost : { msgLabel.setText("Come back soon!") }
]
button.addFocusListener(handleFocus as FocusListener)
```

- 接口类型是动态的
```groovy
events = ['WindowListener', 'ComponentListener'] 
// Above list may be dynamic and may come from some input
handler = { msgLabel.setText("$it") }
for (event in events) {
  handlerImpl = handler.asType(Class.forName("java.awt.event.${event}"))
  frame."add${event}"(handlerImpl)
}
```

## 2.7　布尔求值

Groovy中的布尔求值与Java不同。根据上下文，Groovy会自动把表达式计算为布尔值。

**类型与布尔求值对它们的特殊处理**
类型 | 为真的条件
--- | ---
Boolean | 值为true
Collection | 集合不为空
Character | 值不为0
CharSequence | 长度大于0
Enumeration | hasMoreElements() 为true
Iterator | hasNext() 为true
Number | Double值不为0
Map | 该映射不为空
Matcher | 至少有一个匹配
Object[] | 长度大于0
其他任何类型 | 引用不为null

除了使用Groovy内建的布尔求值约定，在自己的类中，还可以通过实现asBoolean() 方法来编写自己的布尔转换。

## 2.8　操作符重载

Groovy支持操作符重载，可以巧妙地应用这一点来创建DSL（领域特定语言，参见第19章）。Java是不支持操作符重载的，那Groovy又是如何做到的呢？其实很简单：每个操作符都会映射到一个标准的方法 。在Java中，可以使用那些方法；而在Groovy中，既可以使用操作符，也可以使用与之对应的方法。

我们通过++操作符实现了从字符a到c的循环。该操作符映射的是String类的next()方法。
```groovy
for (ch = 'a'; ch < 'd'; ch++) {
    println ch
}
```

Groovy中还可以使用简洁的for-each语法，不过两种实现都用到了String类的next()方法。
```groovy
for (ch in 'a'..'c') {
    println ch
}
```

要向集合中添加元素，可以使用<<操作符，该操作符会被转换为Groovy在Collection上添加的leftShift()方法。
```groovy
lst = ['hello']
lst << 'there'
println lst
```

通过添加映射方法，我们可以为自己的类提供操作符，比如为+操作符添加plus()方法。
```groovy
class ComplexNumber {
    def real, imaginary

    def plus(other) {
        new ComplexNumber(real: real + other.real,
                imaginary: imaginary + other.imaginary)
    }

    String toString() { "$real ${imaginary > 0 ? '+' : ''} ${imaginary}i" }
}

c1 = new ComplexNumber(real: 1, imaginary: 2)
c2 = new ComplexNumber(real: 4, imaginary: 1)
println c1 + c2
```

在重载时，必须保留预期的语义。例如，+操作符不可以修改操作中的任何一个操作数。如果操作符必须是可交换的、对称的或传递的，则必须确保重载的方法遵循这些特性。

## 2.9　对Java 5特性的支持

### 2.9.1　自动装箱

因为Groovy具有动态类型特性，所以它从一开始就支持自动装箱。实际上，必要时Groovy会自动将基本类型视作对象。
```groovy
int val = 5

println val.getClass().name
```

输出结果：
```
java.lang.Integer
```

Groovy在对自动装箱的处理上要比Java略胜一筹。在Java中，自动装箱和自动拆箱会涉及类型之间的转换。而另一方面，Groovy就简单地将其当作对象，所以不需要反复地转换类型。

在2.0版本之前，Groovy中所有基本类型都被看作对象。为了改进性能，也为了能在基本类型的操作上使用更为直接的字节码，从2.0版本起，Groovy做了一些优化。基本类型只在必要时才会被看作对象，比如，在其上调用了方法，或者将其传给了对象引用。否则，Groovy会在字节码级别将其保留为基本类型。

### 2.9.2　for-each

在Java风格的for-each循环中，Groovy要求指明类型（即前面例子中的String）， 或者使用def 。如果不想指定类型，则要使用in关键字代替冒号（:）。

```groovy
String[] greetings = ["Hello", "Hi", "Howdy"]
for (String greet : greetings) {
    println greet
}

for (greet in greetings) {
    println greet
}
```

### 2.9.3　enum

```groovy
enum CoffeeSize {
    SHORT, SMALL, MEDIUM, LARGE, MUG
}

def orderCoffee(size) {
    print "Coffee order received for size $size: "
    switch (size) {
        // 一组值的列表
        case [CoffeeSize.SHORT, CoffeeSize.SMALL]:
            println "you're health conscious"
            break
        // 值的一个区间
        case CoffeeSize.MEDIUM..CoffeeSize.LARGE:
            println "you gotta be a programmer"
            break
        // 一个值
        case CoffeeSize.MUG:
            println "you should try Caffeine IV"
            break
    }
}

orderCoffee(CoffeeSize.SMALL)
orderCoffee(CoffeeSize.LARGE)
orderCoffee(CoffeeSize.MUG)

print 'Available sizes are: '
for (size in CoffeeSize.values()) {
    print "$size "
}
```

输出结果：
```
Coffee order received for size SMALL: you're health conscious
Coffee order received for size LARGE: you gotta be a programmer
Coffee order received for size MUG: you should try Caffeine IV
Available sizes are: SHORT SMALL MEDIUM LARGE MUG
```

可以在case语句中使用枚举值。特别地，我们可以使用一个值、一组值的列表或者值的一个区间。前面的代码囊括了上述这些用法。

Groovy也支持为Java 5的enum定义构造器和方法。
```groovy
enum Methodologies {
    Evo(5),
    XP(21),
    Scrum(30);

    final int daysInIteration

    Methodologies(days) { daysInIteration = days }

    def iterationDetails() {
        println "${this} recommends $daysInIteration days for iteration"
    }
}

for (methodology in Methodologies.values()) {
    methodology.iterationDetails()
}
```

输出结果：
```
Evo recommends 5 days for iteration
XP recommends 21 days for iteration
Scrum recommends 30 days for iteration
```

【注：枚举可以看成是一种特殊的类，这种类只有几个固定的实例。】

### 2.9.4　变长参数

Groovy以两种方式支持Java 5的变长参数特性，除了支持使用省略符号标记形参，对于以数组作为末尾形参的方法，也可以向其传递数目不等的参数。

```groovy
def receiveVarArgs(int a, int ... b) {
    println "You passed $a and $b"
}

def receiveArray(int a, int[] b) {
    println "You passed $a and $b"
}

receiveVarArgs(1, 2, 3, 4, 5)
receiveArray(1, 2, 3, 4, 5)
```

对于接受变长参数或者以数组作为末尾形参的方法，可以向其发送数组或离散的值，Groovy知道该做什么。

在发送数组而非离散值时，请务必谨慎。Groovy会将包围在方括号中的值看作ArrayList的一个实例，而不是纯数组。所以如果简单地发送如[2, 3, 4, 5] 这样的值，将出现MethodMissingException。要发送数组，可以定义一个指向该数组的引用，或使用as操作符。

```groovy
def receiveVarArgs(int a, int ... b) {
    println "You passed $a and $b"
}

def receiveArray(int a, int[] b) {
    println "You passed $a and $b"
}

int[] values = [2, 3, 4, 5]
receiveVarArgs(1, values)
receiveVarArgs(1, [2, 3, 4, 5] as int[])

receiveArray(1, values)
receiveArray(1, [2, 3, 4, 5] as int[])
```

```groovy
def receiveVarArgs(int a, int ... b) {
    println "You passed $a and $b"
}

def receiveArray(int a, int[] b) {
    println "You passed $a and $b"
}

try {
    receiveVarArgs(1, [2, 3, 4, 5])
} catch (ex) {
    println ex.getClass()
}

try {
    receiveArray(1, [2, 3, 4, 5])
} catch (ex) {
    println ex.getClass()
}
```

输出结果：
```
class groovy.lang.MissingMethodException
class groovy.lang.MissingMethodException
```

### 2.9.5　注解

Groovy中也可以定义和使用注解，而且定义注解的语法与Java相同。

对于Java中与编译相关的注解，Groovy的处理方式有所不同。例如，groovyc会忽略@Override 。

### 2.9.6　静态导入

```groovy
import static Math.random;

double val = random();
println(val)
```

在Groovy中可以为静态方法和类名定义别名。要定义别名，需要在import语句中使用as操作符。

```groovy
import static Math.random as rand
import groovy.lang.ExpandoMetaClass as EMC

double value = rand()
println value

def metaClass = new EMC(Integer)
println metaClass.getClass().name
```

输出结果：
```
0.2807502273565813
groovy.lang.ExpandoMetaClass
```

### 2.9.7　泛型

Groovy是支持可选类型的动态类型语言，作为Java的超集，它也支持泛型。然而，Groovy编译器不会像Java编译器那样执行类型检查（参见2.11.2节），不要期望Groovy编译器会像Java编译器那样一开始就拒绝违规的代码。

用 Java 编译器编译会出现错误
```java
import java.util.ArrayList;

public class Generics {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<Integer>();
        list.add(1);
        list.add(2.0); // 编译错误
        list.add("hello"); // 编译错误

        System.out.println("List populated");
        for (int element : list) {
            System.out.println(element);
        }
    }
}
```

用 Groovy 编译器编译不会出现错误，但运行时会出现错误。
```groovy
import java.util.ArrayList;

public class Generics {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<Integer>();
        list.add(1);
        list.add(2.0);
        list.add("hello"); // 运行时错误 org.codehaus.groovy.runtime.typehandling.GroovyCastException: Cannot cast object 'hello' with class 'java.lang.String' to class 'int'

        System.out.println("List populated");
        for (int element : list) {
            System.out.println(element);
        }
    }
}
```

## 2.10　使用Groovy代码生成变换

Groovy在groovy.transform包和其他一些包中提供了很多代码生成注解。

### 2.10.1　使用@Canonical

如果要编写的toString()方法只是简单地显示以逗号分隔的字段值，则可以使用@Canonical变换让Grooovy编译器帮来干这个活。默认情况下，它生成的代码会包含所有字段。不过可以让它仅包含特定字段，而去掉其他字段。

```groovy
import groovy.transform.*

@Canonical(excludes = "lastName, age")
class Person {
    String firstName
    String lastName
    int age
}

def sara = new Person(firstName: "Sara", lastName: "Walker", age: 49)
println sara
```

输出结果：
```
Person(Sara)
```

### 2.10.2　使用@Delegate

```groovy
class Worker {
    def work() { println 'get work done' }

    def analyze() { println 'analyze...' }

    def writeReport() { println 'get report written' }
}

class Expert {
    def analyze() { println "expert analysis..." }
}

class Manager {
    @Delegate
    Expert expert = new Expert()
    @Delegate
    Worker worker = new Worker()
}

def bernie = new Manager()
bernie.analyze()
bernie.work()
bernie.writeReport()
```

输出结果：
```
expert analysis...
get work done
get report written
```

### 2.10.3　使用@Immutable

不可变对象天生是线程安全的，将其字段标记为final是很好的实践选择。如果用@Immutable注解标记一个类，Groovy会将其字段标记为final的。

```groovy
import groovy.transform.Immutable

@Immutable
class CreditCard {
    String cardNumber
    int creditLimit
}

def card = new CreditCard("4000-1111-2222-3333", 1000)
println card

card.creditLimit = 2000 // groovy.lang.ReadOnlyPropertyException: Cannot set readonly property: creditLimit for class: CreditCard
println card
```

输出结果：
```
CreditCard(4000-1111-2222-3333, 1000)
Caught: groovy.lang.ReadOnlyPropertyException: Cannot set readonly property: creditLimit for class: CreditCard
```

### 2.10.4　使用@Lazy

下面的例子将推迟创建Heavy实例，直到真正需要它时。既可以在声明的地方直接初始化实例，也可以将创建逻辑包在一个闭包中。

```groovy
class Heavy {
    def size = 10

    Heavy() { println "Creating Heavy with $size" }
}

class AsNeeded {
    def value

    @Lazy
    Heavy heavy1 = new Heavy()
    @Lazy
    Heavy heavy2 = { new Heavy(size: value) }()

    AsNeeded() { println "Created AsNeeded" }
}

def asNeeded = new AsNeeded(value: 1000)
println "---- 1"
println asNeeded.heavy1.size
println "---- 2"
println asNeeded.heavy1.size
println "---- 3"
println asNeeded.heavy2.size
```

输出结果：
```
Created AsNeeded
---- 1
Creating Heavy with 10
10
---- 2
10
---- 3
Creating Heavy with 10
1000
```


```groovy
class Heavy {
    def size = 10

    Heavy() { println "Creating Heavy with $size" }
}

class AsNeeded {
    def value

    // @Lazy
    Heavy heavy1 = new Heavy()
    // @Lazy
    Heavy heavy2 = { new Heavy(size: value) }()

    AsNeeded() { println "Created AsNeeded" }
}

def asNeeded = new AsNeeded(value: 1000)
println "---- 1"
println asNeeded.heavy1.size
println "---- 2"
println asNeeded.heavy1.size
println "---- 3"
println asNeeded.heavy2.size
```

输出结果：
```
Creating Heavy with 10
Creating Heavy with 10
Created AsNeeded
---- 1
10
---- 2
10
---- 3
null
```

Groovy不仅推迟了创建，还将字段标记为volatile，并确保创建期间是线程安全的。实例会在第一次访问这些字段的时候被创建。

另一个好处是，@Lazy注解提供了一种轻松实现线程安全的虚拟代理模式（virtual proxy pattern）的方式。【注：什么是虚拟代理模式？】

### 2.10.5　使用@Newify

在Groovy中，经常会按照传统的Java语法，使用new来创建实例。然而，在创建DSL时，去掉这个关键字，表达会更流畅。@Newify注解可以帮助创建类似Ruby的构造器，在这里，new是该类的一个方法。该注解还可以用来创建类似Python的构造器，这里可以完全去掉new。要创建类似Python的构造器，必须向@Newify注解指明类型列表。只有将auto=false这个值作为一个参数设置给@Newify，Groovy才会创建Ruby风格的构造器。【注：auto 的设置后面要去了解。】

可以在不同的作用域中使用@Newify注解，比如类或方法。

```groovy
import groovy.transform.*

@Canonical(excludes = "lastName, age")
class Person {
    String firstName
    String lastName
    int age
}

@Immutable
class CreditCard {
    String cardNumber
    int creditLimit
}

@Newify([Person, CreditCard])
def fluentCreate() {
    println Person.new(firstName: "John", lastName: "Doe", age: 20)
    println Person(firstName: "John", lastName: "Doe", age: 20)
    println CreditCard("1234-5678-1234-5678", 2000)
}

fluentCreate()
```

输出结果：
```
Person(John)
Person(John)
CreditCard(1234-5678-1234-5678, 2000)
```

### 2.10.6　使用@Singleton

```groovy
@Singleton(lazy = true)
class TheUnique {
    private TheUnique() { println 'Instance created' } // 单例不应该给出构造函数
}

println TheUnique.instance
println TheUnique.instance

def theUnique = new TheUnique()
println theUnique
```

输出结果：
```
Instance created
TheUnique@5db250b4
TheUnique@5db250b4
Instance created
TheUnique@223f3642
```

警告：使用@Singleton注解，会使目标类的构造器成为私有的，这在我们意料之中，不过因为Groovy实现并不区分公开还是私有，所以在Groovy内仍可使用new关键字来创建实例。但是，必须谨慎恰当地使用这个类，并留心代码分析工具和集成开发环境给出的警告。

```groovy
@Singleton(lazy = true)
class TheUnique {
}

println TheUnique.instance
println TheUnique.instance

def theUnique = new TheUnique()
println theUnique
```

输出结果：
```
TheUnique@23529fee
TheUnique@23529fee
Caught: java.lang.RuntimeException: Can't instantiate singleton TheUnique. Use TheUnique.instance
```

## 2.11　陷阱

### 2.11.1　Groovy的==等价于Java的equals()

在Java中，`==` 和equals()是一个混乱之源，而Groovy加剧了这种混乱。Groovy将`==`操作符映射到了Java中的equals()方法。假如我们想比较引用是否相等（也就是原始的`==`的语义），该怎么办呢？必须使用Groovy中的is()。


```groovy
package ch2_11

str1 = 'hello'
str2 = str1
str3 = new String('hello')
str4 = 'Hello'

// 比较值相等
println "str1 == str2: ${str1 == str2}"
println "str1 == str3: ${str1 == str3}"
println "str1 == str4: ${str1 == str4}"

// 比较引用相等
println "str1.is(str2): ${str1.is(str2)}"
println "str1.is(str3): ${str1.is(str3)}"
println "str1.is(str4): ${str1.is(str4)}"
```

输出结果：
```
str1 == str2: true
str1 == str3: true
str1 == str4: false
str1.is(str2): true
str1.is(str3): false
str1.is(str4): false
```

观察发现，Groovy的`==`映射到equals()，这个结论并不总是成立，当且仅当该类没有实现Comparable接口时，才会这样映射。如果实现了Comparable接口，则`==`会被映射到该类的compareTo()方法。


```groovy
package ch2_11

class A {
    boolean equals(other) {
        println "equals called"
        false
    }
}

class B implements Comparable {
    boolean equals(other) {
        println "equals called"
        false
    }

    int compareTo(other) {
        println "compareTo called"
        0
    }
}

new A() == new A() // equals called
new B() == new B() // compareTo called
```

### 2.11.2　编译时类型检查默认为关闭

Groovy编译器不会验证类型，相反，它只是进行强制类型转换，然后将其留给运行时处理。

```groovy
package ch2_11

try {
    Integer val = 4
    val = 'hello'
} catch (Exception ex) {
    println ex // org.codehaus.groovy.runtime.typehandling.GroovyCastException
}

try {
    Integer val = 4
    val.blah()
} catch (Exception ex) {
    println ex // groovy.lang.MissingMethodException
}
```

### 2.11.3　小心新的关键字

n/a

### 2.11.4　别用这样的代码块

Java中的代码块定义了一个新的作用域，但是Groovy会感到困扰。Groovy编译器会错误地认为我们是要定义一个闭包，并给出编译错误。在Groovy中，方法内不能有任何这样的代码块。

```groovy
package ch2_11;

public class Block {
    public void method() {
        System.out.println("in method1");
        // 在 Groovy 中，方法内不能有任何这样的代码块。
        {
            System.out.println("in block");
        }
    }
}
```

### 2.11.5　闭包与匿名内部类的冲突

```groovy
package ch2_11

class Calibrator {
    Calibrator(calculationBlock) {
        print "using..."
        calculationBlock()
    }
}

// 尾随闭包的写法与匿名内部类有冲突
//def calibrator = new Calibrator() {
//    println "the calculation provided"
//}

// 把闭包放在圆括号内
def calibrator1 = new Calibrator({
    println "the calculation provided"
})

// 传递闭包的引用
def calculation = { println "another calculation provided" }
def calibrator2 = new Calibrator(calculation)
```
