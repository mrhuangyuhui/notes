# Linux Commands

## `alias`

设置命令别名

```bash
$ alias lm='ls -al | more'
# 查看所有命令别名
$ alias
alias cp='cp -i'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias lm='ls -al | more'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
# 删除命令别名
$ unalias lm
```

## `history`

历史命令

```bash
# 查看所有的历史命令
$ history
    1  alias
    2  alias lm='ls -al | more'
    3  alias
    4  unalias lm
    5  history
# 查看最近三笔历史命令
$ history 3
    4  unalias lm
    5  history
    6  history 3
# 把新的历史命令更新到记录文件 ~/.bash_history
$ history -w
```

相关变量：`HISTSIZE`

相关文件：`~/.bash_history`

执行历史命令

```bash
$ history
    1  alias
    2  alias lm='ls -al | more'
    3  alias
    4  unalias lm
    5  history
    6  history 3
    7  history -w
    8  echo ${HISTSIZE}
    9  ll ~/.bash_history
   10  cat ~/.bash_history
   11  history
# 执行第 8 条历史命令
$ !8
echo ${HISTSIZE}
1000
# 执行最近一条历史命令
$ !!
echo ${HISTSIZE}
1000
# 执行最近一条以 al 开头的历史命令
$ !al
alias
alias cp='cp -i'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
```

## `nc`

```bash
echo stat | nc localhost 2181
```

## `join`

按关键字列拼接两个文本文件

相关笔记：

JOIN Manual

《Shell 从入门到精通》第 9 章

## `source`

读取配置到当前的 shell 环境

```bash
source ~/.bashrc
# 用点号也可以
. ~/.bashrc
```

## `su`

切换账号

参考学习笔记《鸟哥的 Linux 私房菜 基础篇》第十三章

## `sudo`

以另一身份执行命令，通常是 root 身份。

详情查看笔记 SUDO Manual

## `telnet`

```bash
yum install -y telnet
```

## `type`

查看命令的类型

```bash
$ type ls
ls is aliased to `ls --color=auto'
$ type -t ls
alias
$ type -a ls
ls is aliased to `ls --color=auto'
ls is /usr/bin/ls
$ type cd
cd is a shell builtin
```

## `unalias`

删除命令别名

```bash
unalias lm
```