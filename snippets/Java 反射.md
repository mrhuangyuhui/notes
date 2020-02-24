# Java 反射

http://www.iteye.com/topic/1123081

**示例一：构造实例**

```java
package com.baobaotao.reflect;

public class Car {
    private String brand;
    private String color;
    private int maxSpeed;

    public Car() {
    }

    public Car(String brand, String color, int maxSpeed) {
        this.brand = brand;
        this.color = color;
        this.maxSpeed = maxSpeed;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(int maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    @Override
    public String toString() {
        return "Car{" +
                "brand='" + brand + '\'' +
                ", color='" + color + '\'' +
                ", maxSpeed=" + maxSpeed +
                '}';
    }
}
```

```java
package com.baobaotao.reflect;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

public class ReflectTest {

    public static Car initByDefaultConstructor() throws Throwable {

        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        Class clazz = loader.loadClass("com.baobaotao.reflect.Car");

        Constructor constructor = clazz.getDeclaredConstructor((Class[])null);
        Car car = (Car)constructor.newInstance();

        Method setBrand = clazz.getMethod("setBrand", String.class);
        setBrand.invoke(car, "红旗 CA72");
        Method setColor = clazz.getMethod("setColor", String.class);
        setColor.invoke(car, "黑色");
        Method setMaxSpeed = clazz.getMethod("setMaxSpeed", int.class);
        setMaxSpeed.invoke(car, 200);

        return car;
    }

    public static void main(String[] args) throws Throwable {
        Car car = initByDefaultConstructor();
        System.out.println(car.toString());
    }
}
```

**示例二：类装载器**

```java
public class ClassLoaderTest {
    public  static void main(String[] args) {
        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        System.out.println("current loaer: " + loader);
        System.out.println("parent loader: " + loader.getParent());
        System.out.println("grandparent loader: " + loader.getParent().getParent());
    }
}
```

**示例三：访问私有成员**

```java
package com.baobaotao.reflect;

public class PrivateCar {
    private String color;
    protected void drive() {
        System.out.println("drive private car! the color is: " + color);
    }
}
```

```java
package com.baobaotao.reflect;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class ReflectTest {

    public static void main(String[] args) throws Throwable {

        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        Class clazz = loader.loadClass("com.baobaotao.reflect.PrivateCar");

        PrivateCar privateCar = (PrivateCar)clazz.newInstance();

        Field color = clazz.getDeclaredField("color");
        color.setAccessible(true);
        color.set(privateCar, "red");

        Method drive = clazz.getDeclaredMethod("drive", (Class[])null);
        drive.setAccessible(true);
        drive.invoke(privateCar, (Object[])null);
    }
}
```