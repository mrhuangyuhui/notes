# [Go - Structures](https://www.tutorialspoint.com/go/go_structures.htm)

```go
package main

import "fmt"

type Book struct {
    title   string
    author  string
    subject string
    book_id int
}

func main() {
    var book1 Book /* Declare book1 of type Book */
    var book2 Book /* Declare book2 of type Book */

    /* book 1 specification */
    book1.title = "Go Programming"
    book1.author = "Mahesh Kumar"
    book1.subject = "Go Programming Tutorial"
    book1.book_id = 6495407

    /* book 2 specification */
    book2.title = "Telecom Billing"
    book2.author = "Zara Ali"
    book2.subject = "Telecom Billing Tutorial"
    book2.book_id = 6495700

    /* print book1 info */
    fmt.Printf("Book 1 title : %s\n", book1.title)
    fmt.Printf("Book 1 author : %s\n", book1.author)
    fmt.Printf("Book 1 subject : %s\n", book1.subject)
    fmt.Printf("Book 1 book_id : %d\n", book1.book_id)

    /* print book2 info */
    fmt.Printf("Book 2 title : %s\n", book2.title)
    fmt.Printf("Book 2 author : %s\n", book2.author)
    fmt.Printf("Book 2 subject : %s\n", book2.subject)
    fmt.Printf("Book 2 book_id : %d\n", book2.book_id)
}
```

## Structures as Function Arguments

```go
package main

import "fmt"

type Book struct {
    title   string
    author  string
    subject string
    book_id int
}

func main() {
    var book1 Book /* Declare book1 of type Book */
    var book2 Book /* Declare book2 of type Book */

    /* book 1 specification */
    book1.title = "Go Programming"
    book1.author = "Mahesh Kumar"
    book1.subject = "Go Programming Tutorial"
    book1.book_id = 6495407

    /* book 2 specification */
    book2.title = "Telecom Billing"
    book2.author = "Zara Ali"
    book2.subject = "Telecom Billing Tutorial"
    book2.book_id = 6495700

    /* print book1 info */
    printBook(book1)

    /* print book2 info */
    printBook(book2)
}

func printBook(book Book) {
    fmt.Printf("Book title : %s\n", book.title);
    fmt.Printf("Book author : %s\n", book.author);
    fmt.Printf("Book subject : %s\n", book.subject);
    fmt.Printf("Book book_id : %d\n", book.book_id);
}
```

## Pointers to Structures

```go
package main

import "fmt"

type Book struct {
    title   string
    author  string
    subject string
    book_id int
}

func main() {
    var book1 Book /* Declare book1 of type Book */
    var book2 Book /* Declare book2 of type Book */

    /* book 1 specification */
    book1.title = "Go Programming"
    book1.author = "Mahesh Kumar"
    book1.subject = "Go Programming Tutorial"
    book1.book_id = 6495407

    /* book 2 specification */
    book2.title = "Telecom Billing"
    book2.author = "Zara Ali"
    book2.subject = "Telecom Billing Tutorial"
    book2.book_id = 6495700

    /* print book1 info */
    printBook(&book1)

    /* print book2 info */
    printBook(&book2)
}

func printBook(book *Book) {
    fmt.Printf("Book title : %s\n", book.title);
    fmt.Printf("Book author : %s\n", book.author);
    fmt.Printf("Book subject : %s\n", book.subject);
    fmt.Printf("Book book_id : %d\n", book.book_id);
}
```