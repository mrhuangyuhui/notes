[toc]

# Classes and Objects [>>](https://docs.oracle.com/javase/tutorial/java/javaOO/index.html)

## Nested Classes [>>](https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html)

**Terminology: Nested classes are divided into two categories: static and non-static. Nested classes that are declared static are called ==static nested classes==. Non-static nested classes are called ==inner classes==.**

```java
class OuterClass {
    ...
    static class StaticNestedClass {
        ...
    }
    class InnerClass {
        ...
    }
}
```

**Static Nested Classes**

As with class methods and variables, a static nested class is associated with its outer class. And like static class methods, a static nested class cannot refer directly to instance variables or methods defined in its enclosing class: ==it can use them only through an object reference==.

Static nested classes are accessed using the enclosing class name:

```java
OuterClass.StaticNestedClass
```

For example, to create an object for the static nested class, use this syntax:

```java
OuterClass.StaticNestedClass nestedObject =
     new OuterClass.StaticNestedClass();
```

**Inner Classes**

As with instance methods and variables, an inner class is associated with an instance of its enclosing class and has direct access to that object's methods and fields. Also, because an inner class is associated with an instance, ==it cannot define any static members itself==.

To instantiate an inner class, you must first instantiate the outer class. Then, create the inner object within the outer object with this syntax:

```java
OuterClass.InnerClass innerObject = outerObject.new InnerClass();
```

### Inner Class Example [>>](https://docs.oracle.com/javase/tutorial/java/javaOO/innerclasses.html)

[DataStructure.java](https://docs.oracle.com/javase/tutorial/java/javaOO/examples/DataStructure.java)

### Local Classes [>>](https://docs.oracle.com/javase/tutorial/java/javaOO/localclasses.html)

Local classes are classes that are defined in a block, which is a group of zero or more statements between balanced braces. You typically find local classes defined in the body of a method.

[LocalClassExample.java](https://docs.oracle.com/javase/tutorial/java/javaOO/examples/LocalClassExample.java)

You cannot declare an interface inside a block; interfaces are inherently static.

```java
public void greetInEnglish() {
    // 编译错误
    interface HelloThere {
       public void greet();
    }
    class EnglishHelloThere implements HelloThere {
        public void greet() {
            System.out.println("Hello " + name);
        }
    }
    HelloThere myGreeting = new EnglishHelloThere();
    myGreeting.greet();
}
```

You cannot declare static initializers or member interfaces in a local class.

```java
public void sayGoodbyeInEnglish() {
    class EnglishGoodbye {
        // 编译错误
        public static void sayGoodbye() {
            System.out.println("Bye bye");
        }
    }
    EnglishGoodbye.sayGoodbye();
}
```

A local class can have static members provided that they are constant variables.

```java
public void sayGoodbyeInEnglish() {
    class EnglishGoodbye {
        public static final String farewell = "Bye bye";
        public void sayGoodbye() {
            System.out.println(farewell);
        }
    }
    EnglishGoodbye myEnglishGoodbye = new EnglishGoodbye();
    myEnglishGoodbye.sayGoodbye();
}
```

### Anonymous Classes [>>](https://docs.oracle.com/javase/tutorial/java/javaOO/anonymousclasses.html)

Anonymous classes enable you to make your code more concise. They enable you to ==declare and instantiate a class at the same time==. They are like local classes except that they do not have a name. Use them if you need to ==use a local class only once==.

```java
HelloWorld frenchGreeting = new HelloWorld() {
    String name = "tout le monde";
    public void greet() {
        greetSomeone("tout le monde");
    }
    public void greetSomeone(String someone) {
        name = someone;
        System.out.println("Salut " + name);
    }
    // System.out.println("method declarations are allowed but statements are not");
};
```

The anonymous class expression consists of the following:

- The new operator
- The name of an interface to implement or a class to extend.
- Parentheses that contain the arguments to a constructor, just like a normal class instance creation expression. Note: When you implement an interface, there is no constructor, so you use an empty pair of parentheses.
- A body, which is a class declaration body. More specifically, in the body, method declarations are allowed but ==statements are not==.

Anonymous classes are often used in graphical user interface (GUI) applications.

```java
Button btn = new Button();
btn.setText("Say 'Hello World'");
btn.setOnAction(new EventHandler<ActionEvent>() {

    @Override
    public void handle(ActionEvent event) {
        System.out.println("Hello World!");
    }
});
```

```java
final TextField sum = new TextField() {
    @Override
    public void replaceText(int start, int end, String text) {
        if (!text.matches("[a-z, A-Z]")) {
            super.replaceText(start, end, text);                     
        }
        label.setText("Enter a numeric value");
    }

    @Override
    public void replaceSelection(String text) {
        if (!text.matches("[a-z, A-Z]")) {
            super.replaceSelection(text);
        }
    }
};
```

### Lambda Expressions [>>](https://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html)

One issue with anonymous classes is that if the implementation of your anonymous class is very simple, such as an interface that contains only one method, then the syntax of anonymous classes may seem unwieldy and unclear. In these cases, you're usually trying to ==pass functionality as an argument to another method==, such as what action should be taken when someone clicks a button. Lambda expressions enable you to do this, to ==treat functionality as method argument, or code as data==.【注：行为或代码可作为参数来传递】

A lambda expression consists of the following:

- A comma-separated list of formal parameters enclosed in parentheses.

Note: You can omit the data type of the parameters in a lambda expression. In addition, ==you can omit the parentheses if there is only one parameter==.

```java
p -> p.getGender() == Person.Sex.MALE 
    && p.getAge() >= 18
    && p.getAge() <= 25
```

- The arrow token, ->

- A body, which consists of a single expression or a statement block.

```java
p.getGender() == Person.Sex.MALE 
    && p.getAge() >= 18
    && p.getAge() <= 25
```

If you specify a single expression, then the Java runtime evaluates the expression and then returns its value. Alternatively, you can use a return statement:

```java
p -> {
    return p.getGender() == Person.Sex.MALE
        && p.getAge() >= 18
        && p.getAge() <= 25;
}
```

==A return statement is not an expression; in a lambda expression, you must enclose statements in braces ({}).== However, you do not have to enclose a void method invocation in braces.

```java
email -> System.out.println(email)
```

[Calculator.java](https://docs.oracle.com/javase/tutorial/java/javaOO/examples/Calculator.java)

#### Method References [>>](https://docs.oracle.com/javase/tutorial/java/javaOO/methodreferences.html)

You use lambda expressions to create anonymous methods. Sometimes, however, ==a lambda expression does nothing but call an existing method==. In those cases, it's often clearer to refer to the existing method by name. Method references enable you to do this; they are compact, easy-to-read lambda expressions for methods that already have a name.

[MethodReferencesTest.java](https://docs.oracle.com/javase/tutorial/java/javaOO/examples/MethodReferencesTest.java)

```java
Arrays.sort(rosterAsArray,
    (a, b) -> Person.compareByAge(a, b) // 方法体只调用一个已存在的方法，可用函数引用代替。
);
// 等价于
Arrays.sort(rosterAsArray, Person::compareByAge);
```

There are four kinds of method references:

Kind | Example
---|---
Reference to a static method | ContainingClass::staticMethodName
Reference to an instance method of a particular object | containingObject::instanceMethodName
Reference to an instance method of an arbitrary object of a particular type | ContainingType::methodName
Reference to a constructor | ClassName::new

**Reference to a Static Method**

参考上例

**Reference to an Instance Method of a Particular Object**

```java
class ComparisonProvider {
    public int compareByName(Person a, Person b) {
        return a.getName().compareTo(b.getName());
    }
}
ComparisonProvider myComparisonProvider = new ComparisonProvider();
Arrays.sort(rosterAsArray, myComparisonProvider::compareByName);
```

**Reference to an Instance Method of an Arbitrary Object of a Particular Type**

```java
String[] stringArray = { "Barbara", "James", "Mary", "John",
    "Patricia", "Robert", "Michael", "Linda" };
Arrays.sort(stringArray, String::compareToIgnoreCase);
```

**Reference to a Constructor**

```java
Set<Person> rosterSetLambda =
    transferElements(roster, () -> { return new HashSet<>(); });
// 等价于
Set<Person> rosterSet = transferElements(roster, HashSet::new);
```