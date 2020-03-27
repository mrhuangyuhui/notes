# [Go - Variables](https://www.tutorialspoint.com/go/go_variables.htm)

## Static Type Declaration in Go

```go
package main

import "fmt"

func main() {
    // 静态类型声明，编译时就知道类型。
    var x float64
    x = 20.0
    fmt.Println(x)
    fmt.Printf("x is of type %T\n", x)
}
```

```bash
$ go run main.go
20
x is of type float64
```

## Dynamic Type Declaration / Type Inference in Go

```go
package main

import "fmt"

func main() {
    var x float64 = 20.0
    // 动态类型声明，:= 表示声明变量并赋值，运行时根据赋值来推断类型。
    y := 42
    fmt.Println(x)
    fmt.Println(y)
    fmt.Printf("x is of type %T\n", x)
    fmt.Printf("y is of type %T\n", y)
}
```

```bash
$ go run main.go
20
42
x is of type float64
y is of type int
```

## Mixed Variable Declaration in Go

```go
package main

import "fmt"

func main() {
    // 给多个变量赋值
    var a, b, c = 3, 4, "foo"
    fmt.Println(a)
    fmt.Println(b)
    fmt.Println(c)
    fmt.Printf("a is of type %T\n", a)
    fmt.Printf("b is of type %T\n", b)
    fmt.Printf("c is of type %T\n", c)
}
```

```bash
$ go run main.go
3
4
foo
a is of type int
b is of type int
c is of type string
```