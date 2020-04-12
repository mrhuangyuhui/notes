#-----------------------------/chapter6/ex6-9.sh------------------
#! /bin/bash

#定义函数
func()
{
   #输出参数个数
   echo "the function has $# parameters."
}
#调用函数
func a b c d e f g hello
func 12 3 "hello world"
func
