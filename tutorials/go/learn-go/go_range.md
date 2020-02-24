# [Go - Range](https://www.tutorialspoint.com/go/go_range.htm)

```go
package main

import "fmt"

func main() {
    /* create a slice */
    numbers := []int{10, 20, 30, 40, 50}

    /* print the numbers */
    for i := range numbers {
        fmt.Println("Slice item", i, "is", numbers[i])
    }

    /* create a map */
    countryCapitalMap := map[string]string{"France": "Paris", "Italy": "Rome", "Japan": "Tokyo"}

    /* print map using keys */
    for country := range countryCapitalMap {
        fmt.Println("Capital of", country, "is", countryCapitalMap[country])
    }

    /* print map using key-value */
    for country, capital := range countryCapitalMap {
        fmt.Println("Capital of", country, "is", capital)
    }
}
```

Output

```bash
Slice item 0 is 10
Slice item 1 is 20
Slice item 2 is 30
Slice item 3 is 40
Slice item 4 is 50
Capital of France is Paris
Capital of Italy is Rome
Capital of Japan is Tokyo
Capital of Italy is Rome
Capital of Japan is Tokyo
Capital of France is Paris
```