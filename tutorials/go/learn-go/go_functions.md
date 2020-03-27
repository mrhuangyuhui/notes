# [Go - Functions](https://www.tutorialspoint.com/go/go_functions.htm)

## Calling a Function

```go
package main

import "fmt"

func main() {
    /* local variable definition */
    var a = 100
    var b = 200
    var ret int

    /* calling a function to get max value */
    ret = max(a, b)

    fmt.Printf("Max value is : %d\n", ret)
}

/* function returning the max between two numbers */
func max(num1, num2 int) int {
    /* local variable declaration */
    var result int

    if num1 > num2 {
        result = num1
    } else {
        result = num2
    }
    return result
}
```

## Returning multiple values from Function

```go
package main

import "fmt"

func swap(x, y string) (string, string) {
    return y, x
}
func main() {
    a, b := swap("Mahesh", "Kumar")
    fmt.Println(a, b)
}
```

## Function Arguments

[Go - Call by value](https://www.tutorialspoint.com/go/go_function_call_by_value.htm)

```go
package main

import "fmt"

func main() {
    /* local variable definition */
    var a = 100
    var b = 200

    fmt.Printf("Before swap, value of a : %d\n", a)
    fmt.Printf("Before swap, value of b : %d\n", b)

    /* calling a function to swap the values */
    swap(a, b)

    fmt.Printf("After swap, value of a : %d\n", a)
    fmt.Printf("After swap, value of b : %d\n", b)
}

func swap(x, y int) int {
    var temp int

    temp = x /* save the value of x */
    x = y    /* put y into x */
    y = temp /* put temp into y */

    return temp
}
```

Output

```bash
Before swap, value of a : 100
Before swap, value of b : 200
After swap, value of a : 100
After swap, value of b : 200
```

[Go - Call by reference](https://www.tutorialspoint.com/go/go_function_call_by_reference.htm)

```go
package main

import "fmt"

func main() {
    /* local variable definition */
    var a = 100
    var b = 200

    fmt.Printf("Before swap, value of a : %d\n", a)
    fmt.Printf("Before swap, value of b : %d\n", b)

    /* calling a function to swap the values.
    * &a indicates pointer to a ie. address of variable a and
    * &b indicates pointer to b ie. address of variable b.
    */
    swap(&a, &b)

    fmt.Printf("After swap, value of a : %d\n", a)
    fmt.Printf("After swap, value of b : %d\n", b)
}
func swap(x *int, y *int) {
    var temp int
    temp = *x /* save the value at address x */
    *x = *y   /* put y into x */
    *y = temp /* put temp into y */
}
```

Output

```bash
Before swap, value of a : 100
Before swap, value of b : 200
After swap, value of a : 200
After swap, value of b : 100
```

## Function Usage

[Go - functions as values](https://www.tutorialspoint.com/go/go_function_as_values.htm)

```go
package main

import (
    "fmt"
    "math"
)

func main() {
    /* declare a function variable */
    getSquareRoot := func(x float64) float64 {
        return math.Sqrt(x)
    }

    /* use the function */
    fmt.Println(getSquareRoot(9))
}
```

[Go - function closure](https://www.tutorialspoint.com/go/go_function_closures.htm)

```go
package main

import "fmt"

func getSequence() func() int {
    i := 0
    return func() int {
        i += 1
        return i
    }
}

func main() {
    /* nextNumber is now a function with i as 0 */
    nextNumber := getSequence()

    /* invoke nextNumber to increase i by 1 and return the same */
    fmt.Println(nextNumber())
    fmt.Println(nextNumber())
    fmt.Println(nextNumber())

    /* create a new sequence and see the result, i is 0 again*/
    nextNumber1 := getSequence()
    fmt.Println(nextNumber1())
    fmt.Println(nextNumber1())
}
```

[Go - Method](https://www.tutorialspoint.com/go/go_method.htm)

```go
package main

import (
    "fmt"
    "math"
)

/* define a circle */
type Circle struct {
    x, y, radius float64
}

/* define a method for circle */
func (circle Circle) area() float64 {
    return math.Pi * circle.radius * circle.radius
}

func main() {
    circle := Circle{x: 0, y: 0, radius: 5}
    fmt.Printf("Circle area: %f", circle.area())
}
```