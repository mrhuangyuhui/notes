# Windows 查看端口占用以及关闭相应的进程

查看所有的端口占用情况
```dos
C:\>netstat -ano
```

查看指定端口的占用情况
```dos
C:\>netstat -aon|findstr "9050"
```

查看 PID 对应的进程
```dos
C:\>tasklist|findstr "2016"
```

结束该进程
```dos
C:\>taskkill /f /t /im tor.exe
```

> 标签：windows win cmd dos port 端口 进程