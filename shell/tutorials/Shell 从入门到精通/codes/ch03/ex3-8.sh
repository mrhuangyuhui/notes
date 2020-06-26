#-----------------------------/chapter3/ex3-8.sh------------------
#! /bin/bash

#定义函数
func()
{
   #输出全局变量v1的值
   echo "global variable v1 is $v1"
   #定义局部变量v1
   local v1=2
   #输出局部变量v1的值
   echo "local variable v1 is $v1"
}
#定义全局变量v1
v1=1
#调用函数
func
#输出全局变量v1的值
echo "global variable v1 is $v1"
