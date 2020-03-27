# [Go - Maps](https://www.tutorialspoint.com/go/go_maps.htm)

## Defining a Map

```go
package main

import "fmt"

func main() {
    var countryCapitalMap map[string]string
    /* create a map */
    countryCapitalMap = make(map[string]string)

    /* insert key-value pairs in the map */
    countryCapitalMap["France"] = "Paris"
    countryCapitalMap["Italy"] = "Rome"
    countryCapitalMap["Japan"] = "Tokyo"
    countryCapitalMap["India"] = "New Delhi"

    /* print map using keys */
    for country := range countryCapitalMap {
        fmt.Println("Capital of", country, "is", countryCapitalMap[country])
    }

    /* test if entry is present in the map or not */
    capital, ok := countryCapitalMap["United States"]

    /* if ok is true, entry is present otherwise entry is absent */
    if ok {
        fmt.Println("Capital of United States is", capital)
    } else {
        fmt.Println("Capital of United States is not present")
    }
}
```

Output

```bash
Capital of India is New Delhi
Capital of France is Paris
Capital of Italy is Rome
Capital of Japan is Tokyo
Capital of United States is not present
```

## `delete()` Function

```go
package main

import "fmt"

func main() {
    /* create a map */
    countryCapitalMap := map[string]string{"France": "Paris", "Italy": "Rome", "Japan": "Tokyo", "India": "New Delhi"}

    fmt.Println("Original map")

    /* print map */
    for country := range countryCapitalMap {
        fmt.Println("Capital of", country, "is", countryCapitalMap[country])
    }

    /* delete an entry */
    delete(countryCapitalMap, "France")
    fmt.Println("Entry for France is deleted")

    fmt.Println("Updated map")

    /* print map */
    for country := range countryCapitalMap {
        fmt.Println("Capital of", country, "is", countryCapitalMap[country])
    }
}
```