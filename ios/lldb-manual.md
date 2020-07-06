# LLDB Manual

<https://lldb.llvm.org/>

[LLDB Quick Start Guide](https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/gdb_to_lldb_transition_guide/document/Introduction.html)

## Commands

```bash
# 查看帮助信息
(lldb) help

# 查看某个命令的帮助信息
(lldb) help
```

![image](https://github.com/mrhuangyuhui/images/blob/master/lldb-help.png?raw=true)

```bash
# 打印表达式的结果
(lldb) po self.view.backgroundColor
UIExtendedSRGBColorSpace 1 0 0 1
```

```bash
# 执行表达式
(lldb) expression -- self.view.backgroundColor = [UIColor redColor]
(UICachedDeviceRGBColor *) $0 = 0x0000600002d11400
```

```bash
# 定位崩溃的具体代码行
(lldb) image lookup -a 0x000000010e77d6a8
      Address: DebugDemo[0x00000001000016a8] (DebugDemo.__TEXT.__text + 168)
      Summary: DebugDemo`-[ViewController viewDidLoad] + 168 at ViewController.m:21:18
```

![image](https://github.com/mrhuangyuhui/images/blob/master/lldb-image-lookup.png?raw=true)

```bash
# 控制返回值
(lldb) thread return NO
```

![image](https://github.com/mrhuangyuhui/images/blob/master/lldb-thread-return.png?raw=true)
