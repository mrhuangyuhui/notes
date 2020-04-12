#-----------------------------/chapter7/ex7-5.sh------------------
#! /bin/bash

#声明数组
declare -A array

#为数组赋值
array=([flower]=rose [fruit]=apple)
#输出第1个元素的值
echo "the flower is ${array[flower]}"
#输出第2个元素的值
echo "the fruit is ${array[fruit]}"
#输出数组长度
echo "the size of the array is ${#array[@]}"
