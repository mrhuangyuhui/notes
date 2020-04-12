#-----------------------------/chapter7/ex7-6.sh------------------
#! /bin/bash

#定义字符串变量
array="hello, world."
#输出下标为0的元素的值
echo "${array[0]}"
#输出所有元素的值
echo "${array[@]}"
#输出所有元素的值
echo "${array[*]}"
