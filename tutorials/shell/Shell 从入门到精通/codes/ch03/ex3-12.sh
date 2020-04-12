#-----------------------------/chapter3/ex3-12.sh------------------
#! /bin/bash

#定义变量v1
v1="Hello world"
#输出v1的值
echo "$v1"
#清除变量
unset v1
echo "the value of v1 has been reset"
#再次输出变量的值
echo "$v1"
