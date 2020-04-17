# `xattr`

扩展属性

```bash
man 1 xattr
```

<https://www.unix.com/man-page/osx/1/xattr/>

```bash
man 7 xattr
```

<http://man7.org/linux/man-pages/man7/xattr.7.html>

从 ifunmac 下载破解软件，安装完成后，如果打开报错 `XXX is damaged and can’t be opened. You should move it to the Trash`，执行以下命令清除程序包的扩展属性。

```bash
xattr -rc /Applications/XXX.app
```
