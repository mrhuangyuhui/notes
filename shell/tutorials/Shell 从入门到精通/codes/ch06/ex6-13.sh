#-----------------------------/chapter6/ex6-13.sh------------------
#! /bin/bash

#定义函数
func()
{
   echo "$1"
}

#定义变量
var=name
name=John
#调用函数
func "$var"
func ${!var}
#修改变量的值
name=Alice
#再次调用函数
func "$var"
func ${!var}
