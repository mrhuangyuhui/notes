# [Go - Arrays](https://www.tutorialspoint.com/go/go_arrays.htm)

```go
// 声明一个数组
var balance [10] float32
// 初始化数组，指定长度，系统分配固定存储空间，元素数量不能超过指定值。
var balance = [5]float32{1000.0, 2.0, 3.4, 7.0, 50.0}
// 初始化数组，不指定长度，系统分配足够存储空间，元素数量可以是任意值。
var balance = []float32{1000.0, 2.0, 3.4, 7.0, 50.0}
```

```go
package main

import "fmt"

func main() {
    var n [10]int /* n is an array of 10 integers */
    var i, j int

    /* initialize elements of array n to 0 */
    for i = 0; i < 10; i++ {
        n[i] = i + 100 /* set element at location i to i + 100 */
    }

    /* output each array element's value */
    for j = 0; j < 10; j++ {
        fmt.Printf("Element[%d] = %d\n", j, n[j])
    }
}
```

Output

```bash
Element[0] = 100
Element[1] = 101
Element[2] = 102
Element[3] = 103
Element[4] = 104
Element[5] = 105
Element[6] = 106
Element[7] = 107
Element[8] = 108
Element[9] = 109
```

[Go - Multidimensional Arrays in Go](https://www.tutorialspoint.com/go/go_multi_dimensional_arrays.htm)

```go
package main

import "fmt"

func main() {
    /* an array with 5 rows and 2 columns*/
    var a = [5][2]int{{0, 0}, {1, 2}, {2, 4}, {3, 6}, {4, 8}}
    var i, j int

    /* output each array element's value */
    for i = 0; i < 5; i++ {
        for j = 0; j < 2; j++ {
            fmt.Printf("a[%d][%d] = %d\n", i, j, a[i][j])
        }
    }
}
```

[Go - Passing arrays to functions](https://www.tutorialspoint.com/go/go_passing_arrays_to_functions.htm)

```go
package main

import "fmt"

func main() {
    /* an int array with 5 elements */
    var balance = []int{1000, 2, 3, 17, 50}
    var avg float32

    /* pass array as an argument */
    avg = getAverage(balance, 5)

    /* output the returned value */
    fmt.Printf("Average value is: %f ", avg)
}
func getAverage(arr []int, size int) float32 {
    var i, sum int
    var avg float32

    for i = 0; i < size; i++ {
        sum += arr[i]
    }

    avg = float32(sum / size)
    return avg
}
```