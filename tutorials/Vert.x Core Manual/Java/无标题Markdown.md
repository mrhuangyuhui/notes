
```java
package io.vertx.example;

import io.vertx.core.Vertx;

public class HelloWorldEmbedded {
  public static void main(String[] args) {
    Vertx.vertx().setPeriodic(1000, id -> {
      System.out.println("timer fired!");
    });
  }
}
```
