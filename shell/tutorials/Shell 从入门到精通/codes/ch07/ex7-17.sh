#-----------------------------/chapter7/ex7-17.sh------------------
#! /bin/bash

array=(Mon Tue Wed Thu Fri Sat Sun)
#获取数组长度
len="${#array[@]}"
#通过循环结构遍历数组
for ((i=0;i<$len;i++))
do
   echo "${array[$i]}"
done
