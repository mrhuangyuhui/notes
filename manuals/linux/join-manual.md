# [JOIN Manual](https://www.gnu.org/software/coreutils/manual/coreutils.html#join-invocation)

---

[TOC]

```bash
$ man join
NAME
     join -- relational database operator

SYNOPSIS
     join [-a file_number | -v file_number] [-e string] [-o list] [-t char] [-1 field] [-2 field]
          file1 file2
```

命令行选项 | 说明 | 例子
--- | --- | ---
`-a` | 输出所有行 | `-a 1` 输出第一个文件的所有行
`-o` | 指定输出列 | `-o 1.1,1.2,2.2,2.3` 输出第一个文件的第 1、2 列和第二个文件的第 2、3 列
`-1` | 指定第一个文件的关键字列 | `-1 2` 指定第一个文件的第 2 列作为关键字列
`-2` | 指定第二个文件的关键字列 | `-2 1` 指定第二个文件的第 1 列作为关键字列

相关笔记：

《Shell 从入门到精通》第 9 章