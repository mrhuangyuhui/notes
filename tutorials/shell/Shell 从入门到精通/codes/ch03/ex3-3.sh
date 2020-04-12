#-----------------------------/chapter3/ex3-3.sh------------------
#! /bin/bash

定义变量x，并将一个算术式赋给它
x=6/3
echo "$x"
#定义变量x为整数
declare -i x
echo "$x"
#将算术式赋给变量x
x=6/3
echo "$x"
#将字符串赋给变量x
x=hello
echo "$x"
#将浮点数赋给变量x
x=3.14
echo "$x"
#取消变量x的整数属性
declare +i x
#重新将算术式赋给变量x
x=6/3
echo "$x"
#求表达式的值
x=$[6/3]
echo "$x"
#求表达式的值
x=$((6/3))
echo "$x"
#声明只读变量x
declare -r x
echo "$x"
#尝试为只读变量赋值
x=5
echo "$x
