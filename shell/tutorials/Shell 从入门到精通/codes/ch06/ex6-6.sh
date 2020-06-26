#-----------------------------/chapter6/ex6-6.sh------------------
#! /bin/bash

#定义函数
length()
{
   #接收参数
   str=$1
   result=0
   if [ "$str" != "" ]; then
      #计算字符串长度
      result=${#str}
   fi
   #将长度值写入标准输出
   echo "$result"
}
#调用函数
len=$(length "abc123")
#输出执行结果
echo "the string's length is $len"
