# [Go - Decision Making](https://www.tutorialspoint.com/go/go_decision_making.htm)

[Go - if statement](https://www.tutorialspoint.com/go/go_if_statement.htm)

```go
package main

import "fmt"

func main() {
    /* local variable definition */
    var a = 10

    /* check the boolean condition using if statement */
    if a < 20 {
        /* if condition is true then print the following */
        fmt.Printf("a is less than 20\n")
    }
    fmt.Printf("value of a is : %d\n", a)
}
```

[Go - if...else statement](https://www.tutorialspoint.com/go/go_if_else_statement.htm)

```go
package main

import "fmt"

func main() {
    /* local variable definition */
    var a = 100

    /* check the boolean condition */
    if a < 20 {
        /* if condition is true then print the following */
        fmt.Printf("a is less than 20\n")
    } else {
        /* if condition is false then print the following */
        fmt.Printf("a is not less than 20\n")
    }
    fmt.Printf("value of a is : %d\n", a)
}
```

[Go - nested if statements](https://www.tutorialspoint.com/go/go_nested_if_statements.htm)

```go
package main

import "fmt"

func main() {
    /* local variable definition */
    var a = 100
    var b = 200

    /* check the boolean condition */
    if a == 100 {
        /* if condition is true then check the following */
        if b == 200 {
            /* if condition is true then print the following */
            fmt.Printf("Value of a is 100 and b is 200\n")
        }
    }
    fmt.Printf("Exact value of a is : %d\n", a)
    fmt.Printf("Exact value of b is : %d\n", b)
}
```

[Go - The Switch Statement](https://www.tutorialspoint.com/go/go_switch_statement.htm)

```go
package main

import "fmt"

func main() {
    /* local variable definition */
    var grade = "B"
    var marks = 90

    switch marks {
    case 90:
        grade = "A"
    case 80:
        grade = "B"
    case 50, 60, 70:
        grade = "C"
    default:
        grade = "D"
    }
    switch {
    case grade == "A":
        fmt.Printf("Excellent!\n")
    case grade == "B", grade == "C":
        fmt.Printf("Well done\n")
    case grade == "D":
        fmt.Printf("You passed\n")
    case grade == "F":
        fmt.Printf("Better try again\n")
    default:
        fmt.Printf("Invalid grade\n")
    }
    fmt.Printf("Your grade is  %s\n", grade)
}
```

```go
package main

import "fmt"

func main() {
    var x interface{}

    switch i := x.(type) {
    case nil:
        fmt.Printf("type of x :%T", i)
    case int:
        fmt.Printf("x is int")
    case float64:
        fmt.Printf("x is float64")
    case func(int) float64:
        fmt.Printf("x is func(int)")
    case bool, string:
        fmt.Printf("x is bool or string")
    default:
        fmt.Printf("don't know the type")
    }
}
```

[Go - The Select Statement](https://www.tutorialspoint.com/go/go_select_statement.htm)

```go
package main

import "fmt"

func main() {
    var c1, c2, c3 chan int
    var i1, i2 int
    select {
    case i1 = <-c1:
        fmt.Printf("received ", i1, " from c1\n")
    case c2 <- i2:
        fmt.Printf("sent ", i2, " to c2\n")
    case i3, ok := (<-c3): // same as: i3, ok := <-c3
        if ok {
            fmt.Printf("received ", i3, " from c3\n")
        } else {
            fmt.Printf("c3 is closed\n")
        }
    default:
        fmt.Printf("no communication\n")
    }
}
```