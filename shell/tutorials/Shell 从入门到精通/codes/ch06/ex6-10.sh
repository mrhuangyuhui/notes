#-----------------------------/chapter6/ex6-10.sh------------------
#! /bin/bash

#定义函数
func()
{
   #输出所有的参数
   echo "all parameters are $*"
   #输出所有的参数
   echo "all parameters are $@"
   #输出脚本名称
   echo "the script's name is $0"
   #输出第1个参数
   echo "the first parameter is $1"
   #输出第2个参数
   echo "the second paramter is $2"
}
#调用函数
func hello world
