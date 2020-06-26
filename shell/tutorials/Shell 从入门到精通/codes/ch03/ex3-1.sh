#-----------------------------/chapter3/ex3-1.sh------------------
#! /bin/bash

#定义变量x，并且赋值为123
x=123
#变量x加1
let "x += 1"
#输出变量x的值
echo "x = $x"
#显示空行
echo
#替换x中的1为abc，并且将值赋给变量y
y=${x/1/abc}
#输出变量y的值
echo "y = $y"
#声明变量y
declare -i y
#输出变量y的值
echo "y = $y"
#变量y的值加1
let "y += 1"
#输出变量y的值
echo "y = $y"
#显示空行
echo
#将字符串赋给变量z
z=abc22
#输出变量z的值
echo "z = $z"
#替换变量z中的abc为数字11，并且将值赋给变量m
m=${z/abc/11}
#输出变量m的值
echo "m = $m"
#变量m加1
let "m += 1"
#输出变量m的值
echo "m = $m"

echo
#将空串赋给变量n
n=""
#输出变量n的值
echo "n = $n"
#变量n加1
let "n += 1"
echo "n = $n"
echo
#输出空变量p的值
echo "p = $p"
# 变量p加1
let "p += 1"
echo "p = $p"
