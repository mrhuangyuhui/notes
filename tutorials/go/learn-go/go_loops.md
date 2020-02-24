# [Go - Loops](https://www.tutorialspoint.com/go/go_loops.htm)

[Go - for Loop](https://www.tutorialspoint.com/go/go_for_loop.htm)

```go
package main

import "fmt"

func main() {
    for a := 0; a < 10; a++ {
        fmt.Printf("value of a: %d\n", a)
    }

    var b = 15
    var a int
    for a < b {
        a++
        fmt.Printf("value of a: %d\n", a)
    }

    numbers := [6]int{1, 2, 3, 5}
    // i 是索引，x 是值。
    for i, x := range numbers {
        fmt.Printf("value of x = %d at %d\n", x, i)
    }
}
```

[Go - Nested for Loops](https://www.tutorialspoint.com/go/go_nested_loops.htm)

```go
package main

import "fmt"

func main() {
    /* local variable definition */
    var i, j int

    for i = 2; i < 100; i++ {
        for j = 2; j <= (i / j); j++ {
            if i%j == 0 {
                break // if factor found, not prime
            }
        }
        if j > (i / j) {
            fmt.Printf("%d is prime\n", i)
        }
    }
}
```

[Go - break statement](https://www.tutorialspoint.com/go/go_break_statement.htm)

```go
package main

import "fmt"

func main() {
    /* local variable definition */
    var a = 10

    /* for loop execution */
    for a < 20 {
        fmt.Printf("value of a: %d\n", a)
        a++
        if a > 15 {
            /* terminate the loop using break statement */
            break
        }
    }
}
```

[Go - The continue Statement](https://www.tutorialspoint.com/go/go_continue_statement.htm)

```go
package main

import "fmt"

func main() {
    /* local variable definition */
    var a = 10

    /* do loop execution */
    for a < 20 {
        if a == 15 {
            /* skip the iteration */
            a = a + 1
            continue
        }
        fmt.Printf("value of a: %d\n", a)
        a++
    }
}
```

[Go - The goto Statement](https://www.tutorialspoint.com/go/go_goto_statement.htm)

```go
package main

import "fmt"

func main() {
    /* local variable definition */
    var a = 10

    /* do loop execution */
LOOP:
    for a < 20 {
        if a == 15 {
            /* skip the iteration */
            a = a + 1
            goto LOOP
        }
        fmt.Printf("value of a: %d\n", a)
        a++
    }
}
```