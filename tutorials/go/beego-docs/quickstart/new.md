# [创建项目](https://beego.me/docs/quickstart/new.md)

> 注意：要先安装 beego 和 bee

```bash
go get -u github.com/astaxie/beego
go get -u github.com/beego/bee
```

```bash
# 进入工作空间的源码目录
cd $GOPATH/src

# 创建项目
bee new quickstart

# 进入项目目录
cd quickstart/

# 运行项目
bee run

# 打开 http://localhost:8080/
```