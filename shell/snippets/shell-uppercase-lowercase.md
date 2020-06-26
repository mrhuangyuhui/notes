# Shell - 字母大小写

```bash
# 指定变量为大写类型
$ typeset -u name
$ name='mike'
$ echo $name
MIKE

# 指定变量为小写类型
$ typeset -l name
$ name='MIKE'
$ echo $name
mike
```

```bash
$ echo 'hello' | tr 'a-z' 'A-Z'
HELLO

$ echo 'HELLO' | tr 'A-Z' 'a-z'
hello
```