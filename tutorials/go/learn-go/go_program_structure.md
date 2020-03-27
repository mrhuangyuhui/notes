# [Go - Program Structure](https://www.tutorialspoint.com/go/go_program_structure.htm)

```go
package main

import "fmt"

func main() {
    /* This is my first sample program. */
    fmt.Println("Hello, World!")
}
```

```bash
$ go run hello.go
Hello, World!
```

> Notice the capital P of `Println` method. In Go language, a name is exported if it starts with capital letter. Exported means the function or variable/constant is accessible to the importer of the respective package.