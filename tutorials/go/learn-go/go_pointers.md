# [Go - Pointers](https://www.tutorialspoint.com/go/go_pointers.htm)

```go
package main

import "fmt"

func main() {
    var a = 10
    fmt.Printf("Address of a variable: %x\n", &a) // Address of a variable: c42001a050
}
```

## What Are Pointers?

```go
var ip *int        /* pointer to an integer */
var fp *float32    /* pointer to a float */
```

## How to Use Pointers?

```go
package main

import "fmt"

func main() {
    var a = 20  /* actual variable declaration */
    var ip *int /* pointer variable declaration */

    ip = &a /* store address of a in pointer variable*/

    fmt.Printf("Address of a variable: %x\n", &a)

    /* address stored in pointer variable */
    fmt.Printf("Address stored in ip variable: %x\n", ip)

    /* access the value using the pointer */
    fmt.Printf("Value of *ip variable: %d\n", *ip)
}
```

Output

```bash
Address of a variable: c420086008
Address stored in ip variable: c420086008
Value of *ip variable: 20
```

## Nil Pointers in Go

```go
if (ptr != nil)     /* succeeds if p is not nil */
if (ptr == nil)    /* succeeds if p is null */
```

```go
package main

import "fmt"

func main() {
    var ptr *int

    fmt.Printf("The value of ptr is : %x\n", ptr) // The value of ptr is : 0
}
```

## Go Pointers in Detail

[Go - Array of pointers](https://www.tutorialspoint.com/go/go_array_of_pointers.htm)

```go
package main

import "fmt"

const MAX int = 3

func main() {
    a := []int{10, 100, 200}
    var i int
    var ptr [MAX]*int
    for i = 0; i < MAX; i++ {
        ptr[i] = &a[i] /* assign the address of integer. */
    }
    for i = 0; i < MAX; i++ {
        fmt.Printf("Value of a[%d] = %d\n", i, *ptr[i])
    }
}
```

Output

```bash
Value of a[0] = 10
Value of a[1] = 100
Value of a[2] = 200
```

[Go - Pointer to pointer](https://www.tutorialspoint.com/go/go_pointer_to_pointer.htm)

```go
package main

import "fmt"

func main() {
    var a int
    var ptr *int
    var pptr **int

    a = 3000

    /* take the address of var */
    ptr = &a

    /* take the address of ptr using address of operator & */
    pptr = &ptr

    /* take the value using pptr */
    fmt.Printf("Value of a = %d\n", a)
    fmt.Printf("Value available at *ptr = %d\n", *ptr)
    fmt.Printf("Value available at **pptr = %d\n", **pptr)
}
```

Output

```bash
Value of a = 3000
Value available at *ptr = 3000
Value available at **pptr = 3000
```

[Go - Passing pointers to functions](https://www.tutorialspoint.com/go/go_passing_pointers_to_functions.htm)

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