#-----------------------------/chapter6/ex6-15.sh------------------
#! /bin/bash

#定义函数
func()
{
   echo "number of elements is $#."
   while [ $# -gt 0 ]
   do
      echo "$1"
      shift
    done
}
#定义数组
a=(a b "c d" e)
#调用函数
func "${a[@]}"
