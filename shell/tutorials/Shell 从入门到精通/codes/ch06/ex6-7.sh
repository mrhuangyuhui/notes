#-----------------------------/chapter6/ex6-7.sh------------------
#! /bin/bash

#在函数外定义全局变量
var="Hello world"

func()
{
   #在函数内改变变量的值
   var="Orange Apple Banana"
   echo "$var"
   #在函数内定义全局变量
   var2="Hello John"
}
#输出变量值
echo "$var"
#调用函数
func
#重新输出变量的值
echo "$var"
#输出函数内定义的变量的值
echo "$var2"
