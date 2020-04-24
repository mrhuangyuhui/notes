# `launchcd`

[A launchd Tutorial](https://www.launchd.info/)

[Daemons and Services Programming Guide](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/Introduction.html)

## Job Definitions

Type | Location | Run on behalf of
---- | -------- | ----------------
User Agents | `~/Library/LaunchAgents` | Currently logged in user
Global Agents | `/Library/LaunchAgents` |Currently logged in user
Global Daemons | `/Library/LaunchDaemons` | root or the user specified with the key `UserName`
System Agents | `/System/Library/LaunchAgents` | Currently logged in user
System Daemons | `/System/Library/LaunchDaemons` | root or the user specified with the key `UserName`

## Commands

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

## Examples

[Mac 定时任务脚本](/scripts/launchd/README.md)
