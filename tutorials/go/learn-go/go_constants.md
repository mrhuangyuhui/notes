# [Go - Constants](https://www.tutorialspoint.com/go/go_constants.htm)

## Integer Literals

```go
85         /* decimal */
0213       /* octal */
0x4b       /* hexadecimal */
30         /* int */
30u        /* unsigned int */
30l        /* long */
30ul       /* unsigned long */
```

## Floating-point Literals

```go
3.14159       /* Legal */
314159E-5L    /* Legal */
510E          /* Illegal: incomplete exponent */
210f          /* Illegal: no decimal or exponent */
.e55          /* Illegal: missing integer or fraction */
```

## Escape Sequence

```go
package main

import "fmt"

func main() {
    fmt.Printf("Hello\tWorld!")
}
```

## String Literals in Go

以下三种写法等价

```go
"hello, dear"

"hello, \

dear"

"hello, " "d" "ear"
```

## The const Keyword

```bash
package main

import "fmt"

func main() {
    const LENGTH int = 10
    const WIDTH int = 5
    var area int
    area = LENGTH * WIDTH
    fmt.Printf("value of area : %d", area)
}
```