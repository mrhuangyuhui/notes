#-----------------------------/chapter6/ex6-14.sh------------------
#! /bin/bash

#定义全局变量
file="/bin/ls"
#定义函数
func()
{
   if [ -e "$file" ]
   then
      echo "the file exists."
   else
      echo "the file does not exist."
   fi
}
#调用函数
func
#修改全局变量的值
file="/bin/a"
#调用函数
func
