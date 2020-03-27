# Git 忽略配置

<https://git-scm.com/docs/gitignore>

<https://github.com/github/gitignore>

- [Eclipse.gitignore](https://github.com/github/gitignore/blob/master/Global/Eclipse.gitignore)
- [Java.gitignore](https://github.com/github/gitignore/blob/master/Java.gitignore)
- [JetBrains.gitignore](https://github.com/github/gitignore/blob/master/Global/JetBrains.gitignore)
- [Laravel.gitignore](https://github.com/github/gitignore/blob/master/Laravel.gitignore)

注意：

- 一个仓库 repo 内可以有多个 `.gitignore` 文件，可以在仓库根目录下，如 `repo/.gitignore`，也可以在仓库的子目录下，如 `repo/foo/.gitignore`。
- 文件 `.gitignore` 所列规则的根目录指的是该文件所在的目录，如 `repo/.gitignore` 的根目录是 `repo/`，`repo/foo/.gitignore` 的根目录是 `repo/foo/`。
- 已纳入版本控制的文件不受 `.gitignore` 影响，应尽量在建立仓库时创建忽略规则。

`/` 表示目录

```bash
# 忽略根目录下名称为 foo 的文件或目录
/foo

# 忽略名称为 foo 的目录
foo/

# 忽略根目录下名称为 foo 的目录
/foo/

# 忽略名称为 foo 的文件或目录
foo
```

`**` 表示任意层目录

```bash
# 忽略名称为 foo 的文件或目录
**/foo
# 等价于
foo

# 忽略 foo 目录下名称为 bar 的文件或目录
**/foo/bar

# 忽略 abc 目录（注意：该目录与 .gitignore 在同一目录）下所有文件和目录
abc/**

# 忽略 a 目录（注意：该目录与 .gitignore 在同一目录）下名称为 b 的文件或目录，如 a/b a/x/b a/x/y/b。
a/**/b
```

`*` 表示任意多个字符

```bash
# 忽略名称以 .class 结尾的文件或目录
*.class
```

`?` 表示任意单个字符

```bash
# 忽略名称为任意单个字符加 .class 的文件或目录，如 a.class b.class 会被忽略，而 .class ab.class 都不会被忽略。
?.class
```

`[]` 表示匹配方括号中的其中一个字符

```bash
# 忽略名称为 a.class b.class c.class 的文件或目录
[abc].class
```

`!` 表示不忽略

```bash
# 忽略名称以 .class 结尾的文件或目录，a.class 除外。
*.class
!a.class
```

`\` 表示字符转义

```bash
# 忽略名称为 #.class 的文件或目录
\#.class
# 忽略名称为 !.class 的文件或目录
\!.class
```