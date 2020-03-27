# [Go - Scope Rules](https://www.tutorialspoint.com/go/go_scope_rules.htm)

## Local Variables

```go
package main

import "fmt"

func main() {
    /* local variable declaration */
    var a, b, c int

    /* actual initialization */
    a = 10
    b = 20
    c = a + b

    fmt.Printf("value of a = %d, b = %d and c = %d\n", a, b, c)
}
```

Output

```bash
value of a = 10, b = 20 and c = 30
```

## Global Variables

```go
package main

import "fmt"

/* global variable declaration */
var g int

func main() {
    /* local variable declaration */
    var a, b int

    /* actual initialization */
    a = 10
    b = 20
    g = a + b

    fmt.Printf("value of a = %d, b = %d and g = %d\n", a, b, g)
}
```

Output

```bash
value of a = 10, b = 20 and g = 30
```

```go
package main

import "fmt"

/* global variable declaration */
var g = 20

func main() {
    /* local variable declaration */
    var g = 10

    fmt.Printf("value of g = %d\n", g)
}
```

Output

```bash
value of g = 10
```

## Formal Parameters

```go
package main

import "fmt"

/* global variable declaration */
var a = 20

func main() {
    /* local variable declaration in main function */
    var a = 10
    var b = 20
    var c = 0

    fmt.Printf("value of a in main() = %d\n", a)
    c = sum(a, b)
    fmt.Printf("value of c in main() = %d\n", c)
}

/* function to add two integers */
func sum(a, b int) int {
    fmt.Printf("value of a in sum() = %d\n", a)
    fmt.Printf("value of b in sum() = %d\n", b)
    return a + b
}
```

Output

```bash
value of a in main() = 10
value of a in sum() = 10
value of b in sum() = 20
value of c in main() = 30
```