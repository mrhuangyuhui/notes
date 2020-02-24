# [Go - Strings](https://www.tutorialspoint.com/go/go_strings.htm)

## Creating Strings

```go
package main

import "fmt"

func main() {
    var greeting = "Hello world!"

    fmt.Printf("normal string: ")
    fmt.Printf("%s", greeting)

    fmt.Printf("\n")

    fmt.Printf("hex bytes: ")
    for i := 0; i < len(greeting); i++ {
        fmt.Printf("%x ", greeting[i])
    }

    fmt.Printf("\n")
    const sampleText = "\xbd\xb2\x3d\xbc\x20\xe2\x8c\x98"

    /* q flag escapes unprintable characters, with + flag it escapses non-ascii
    characters as well to make output unambigous */
    fmt.Printf("quoted string: ")
    fmt.Printf("%+q", sampleText)
    fmt.Printf("\n")
}
```

Output

```bash
normal string: Hello world!
hex bytes: 48 65 6c 6c 6f 20 77 6f 72 6c 64 21 
quoted string: "\xbd\xb2=\xbc \u2318"
```

## String Length

```go
package main

import "fmt"

func main() {
    var greeting = "Hello world!"

    fmt.Printf("String Length is: ")
    fmt.Println(len(greeting))
}
```

## Concatenating Strings

```go
package main

import (
    "fmt"
    "strings"
)

func main() {
    greetings := []string{"Hello", "world!"}
    fmt.Println(strings.Join(greetings, " "))
}
```