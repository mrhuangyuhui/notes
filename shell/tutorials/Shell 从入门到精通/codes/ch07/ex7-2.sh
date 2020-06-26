#-----------------------------/chapter7/ex7-2.sh------------------
#! /bin/bash

#定义数组
declare -a array
#为元素赋值
array[0]=1
array[1]=2
#输出元素值
echo "${array[@]}"
