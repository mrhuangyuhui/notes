#-----------------------------/chapter6/ex6-18.sh------------------
#! /bin/bash

#定义递归函数
fact()
{
   #定义局部变量
   local n="$1"
   #当n等于0时终止递归调用
   if [ "$n" -eq 0 ]
   then
      result=1
   else
      #当n大于0时，递归计算n-1的阶乘
      let "m=n-1"
      fact "$m"
      let "result=$n * $?"
   fi
   #将计算结果以退出状态码的形式返回
   return $result
}

#调用递归函数
fact "$1"

echo "Factorial of $1 is $?"
