#! /bin/bash

#输出所有的参数
echo "$*"
#将参数列表作为条件
for arg in $*
do
   #依次输出各个参数值
   echo "${arg}"
done
