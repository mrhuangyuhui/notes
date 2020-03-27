# Go - Struct

## Notes

[Go - Structures](https://gitee.com/mrhuangyuhui/notes/blob/master/tutorials/go/learn-go/go_structures.md)

[第 7 章 使用结构体和指针](https://gitee.com/mrhuangyuhui/notes/blob/master/books/go/go-24h/ch07.md)

## Snippets

匿名结构体

```go
package main

import (
    "fmt"
)

func main() {
    a := &struct {
        name string
        age  int
    }{
        name: "Ken",
        age:  10,
    }
    fmt.Println(a)
}
```