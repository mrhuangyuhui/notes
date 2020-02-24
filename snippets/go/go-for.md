# Go - `for` 语句

## Notes

<https://gitee.com/mrhuangyuhui/notes/blob/master/tutorials/go/learn-go/go_loops.md>

## Snippets

```go
func spinner(delay time.Duration) {
    for {
        for _, r := range `-\|/` {
            fmt.Printf("\r%c", r)
            time.Sleep(delay)
        }
    }
}
```