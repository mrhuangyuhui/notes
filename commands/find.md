# `find`

<https://man.linuxde.net/find>

```bash
man find
find --help
```

```bash
# 列出当前目录及其子目录下的所有文件
find .

# 在 /home 目录下查找文件名以 .txt 结尾的文件
find /home -name "*.txt"
# 同上，但忽略大小写
find /home -iname "*.txt"

# 查找所有文件名以 .txt 或 .pdf 结尾的文件
find . \( -name "*.txt" -o -name "*.pdf" \)
# 或
find . -name "*.txt" -o -name "*.pdf"

# 匹配文件路径
find /usr/ -path "*local*"

# 基于正则表达式匹配文件路径
find . -regex ".*\(\.txt\|\.pdf\)$"
# 同上，但忽略大小写
find . -iregex ".*\(\.txt\|\.pdf\)$"
```
