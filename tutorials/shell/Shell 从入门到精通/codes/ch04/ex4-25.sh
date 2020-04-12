#-----------------------------/chapter4/ex4-25.sh------------------
#! /bin/sh

#使用echo语句输出字符串
echo hello world!

#使用$?变量获取echo语句的执行状态
echo $?

#执行一个无效的命令
aaa
#输出执行状态
echo $?

#退出
exit 120
