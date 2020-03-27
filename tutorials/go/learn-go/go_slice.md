# [Go - Slices](https://www.tutorialspoint.com/go/go_slice.htm)

## Defining a slice

```go
package main

import "fmt"

func main() {
    var numbers []int /* a slice of unspecified size */
    printSlice(numbers) // len=0 cap=0 slice=[]

    numbers = []int{0, 0, 0, 0, 0}
    printSlice(numbers) // len=5 cap=5 slice=[0 0 0 0 0]

    numbers = make([]int, 5, 10) /* a slice of length 5 and capacity 5 */
    printSlice(numbers) // len=5 cap=10 slice=[0 0 0 0 0]
}

func printSlice(x []int) {
    fmt.Printf("len=%d cap=%d slice=%v\n", len(x), cap(x), x)
}
```

## `len()` and `cap()` functions

```go
package main

import "fmt"

func main() {
    var numbers = make([]int, 3, 5)
    printSlice(numbers) // len=3 cap=5 slice=[0 0 0]
}

func printSlice(x []int) {
    fmt.Printf("len=%d cap=%d slice=%v\n", len(x), cap(x), x)
}
```

## Nil slice

```go
package main

import "fmt"

func main() {
    var numbers []int
    printSlice(numbers) // len = 0 cap = 0 slice = []

    if numbers == nil {
        fmt.Printf("slice is nil") // slice is nil
    }
}

func printSlice(x []int) {
    fmt.Printf("len = %d cap = %d slice = %v\n", len(x), cap(x), x)
}
```

## Subslicing

```go
package main

import "fmt"

func main() {
    /* create a slice */
    numbers := []int{0, 1, 2, 3, 4, 5, 6, 7, 8}
    printSlice(numbers) // len = 9 cap = 9 slice = [0 1 2 3 4 5 6 7 8]

    /* print the original slice */
    fmt.Println("numbers ==", numbers) // numbers == [0 1 2 3 4 5 6 7 8]

    /* print the sub slice starting from index 1(included) to index 4(excluded)*/
    fmt.Println("numbers[1:4] ==", numbers[1:4]) // numbers[1:4] == [1 2 3]

    /* missing lower bound implies 0*/
    fmt.Println("numbers[:3] ==", numbers[:3]) // numbers[:3] == [0 1 2]

    /* missing upper bound implies len(s)*/
    fmt.Println("numbers[4:] ==", numbers[4:]) // numbers[4:] == [4 5 6 7 8]

    numbers1 := make([]int, 0, 5)
    printSlice(numbers1) // len = 0 cap = 5 slice = []

    /* print the sub slice starting from index 0(included) to index 2(excluded) */
    number2 := numbers[:2]
    printSlice(number2) // len = 2 cap = 9 slice = [0 1]

    /* print the sub slice starting from index 2(included) to index 5(excluded) */
    number3 := numbers[2:5]
    printSlice(number3) // len = 3 cap = 7 slice = [2 3 4]

}

func printSlice(x []int) {
    fmt.Printf("len = %d cap = %d slice = %v\n", len(x), cap(x), x)
}
```

## `append()` and `copy()` Functions

```go
package main

import "fmt"

func main() {
    var numbers []int
    printSlice(numbers) // len=0 cap=0 slice=[]

    /* append allows nil slice */
    numbers = append(numbers, 0)
    printSlice(numbers) // len=1 cap=1 slice=[0]

    /* add one element to slice */
    numbers = append(numbers, 1)
    printSlice(numbers) // len=2 cap=2 slice=[0 1]

    /* add more than one element at a time */
    numbers = append(numbers, 2, 3, 4)
    printSlice(numbers) // len=5 cap=6 slice=[0 1 2 3 4]

    /* create a slice numbers1 with double the capacity of earlier slice */
    numbers1 := make([]int, len(numbers), (cap(numbers))*2)

    /* copy content of numbers to numbers1 */
    copy(numbers1, numbers)
    printSlice(numbers1) // len=5 cap=12 slice=[0 1 2 3 4]
}

func printSlice(x []int) {
    fmt.Printf("len=%d cap=%d slice=%v\n", len(x), cap(x), x)
}
```