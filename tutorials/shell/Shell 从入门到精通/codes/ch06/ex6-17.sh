#-----------------------------/chapter6/ex6-17.sh------------------
#! /bin/bash

#定义递归函数
func()
{
   read y
   #递归调用
   func "$y"
   echo "$y"
}  
#调用函数
func
