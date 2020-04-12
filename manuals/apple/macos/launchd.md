# `launchcd`

<https://www.launchd.info/>

```bash
man launchd
man launchctl
man launch.plist
```

```bash
# 注册任务
launchctl load com.example.program.plist
# 注销任务
launchctl unload com.example.program.plist
# 启动任务
launchctl start com.example.program.plist
# 停止任务
launchctl stop com.example.program.plist
```

[Daemons and Services Programming Guide](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/Introduction.html)
