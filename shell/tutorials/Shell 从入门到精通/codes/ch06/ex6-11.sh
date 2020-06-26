#-----------------------------/chapter6/ex6-11.sh------------------
#! /bin/bash

#定义函数
func()
{
   #通过while循环和shift命令依次获取参数值
   while (($# > 0))
   do
      echo "$1"
      shift
    done
}
