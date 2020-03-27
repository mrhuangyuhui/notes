# Go Manual

<https://golang.org/>

<https://golang.org/doc/>

<https://play.golang.org/>

<https://github.com/trending/go>

<https://github.com/avelino/awesome-go>

<https://github.com/hyper0x/awesome-go-China>

## Installation

<https://golang.org/doc/install>

<https://golang.org/dl/>

### Mac

[Download the package file](https://golang.org/dl/), open it, and follow the prompts to install the Go tools. The package installs the Go distribution to `/usr/local/go`.

The package should put the `/usr/local/go/bin` directory in your `PATH` environment variable. You may need to restart any open Terminal sessions for the change to take effect.

### Test

```go
package main

import "fmt"

func main() {
    fmt.Printf("hello, world\n")
}
```

```bash
$ go run hello.go
hello, world
```

## Commands

[GO 命令教程](https://github.com/hyper0x/go_command_tutorial)

```bash
go version
```

查看环境信息

```bash
go env
```

## References

[The Go Programming Language Specification](https://golang.org/ref/spec)

<https://godoc.org/>

## Packages

<https://go-search.org/>

## Tutorials

[Learn Go Programing](https://www.tutorialspoint.com/go/index.htm)

[Go 语言教程](http://www.runoob.com/go/go-tutorial.html)

[GO 命令教程](https://github.com/hyper0x/go_command_tutorial)

[Go Web 编程](https://github.com/astaxie/build-web-application-with-golang)

[Go 实战开发](https://github.com/astaxie/go-best-practice)

## IDES

<https://www.jetbrains.com/go/>

## Frameworks

<https://github.com/astaxie/beego>

<https://github.com/gin-gonic/gin>

<https://github.com/revel/revel>

<https://github.com/gohugoio/hugo>

<https://github.com/getlantern/lantern>

<https://github.com/go-sql-driver/mysql>

Redis

<https://github.com/gomodule/redigo>

## Tools

依赖管理

<https://github.com/tools/godep>

<https://github.com/Masterminds/glide>

<https://github.com/kardianos/govendor>

调试

<https://github.com/derekparker/delve>