#-----------------------------/chapter7/ex7-3.sh------------------
#! /bin/bash

#定义数组
array=(1 2 3 4 5 6 7 8)
#输出第1个数组元素的值
echo "the first element is ${#array[0]}"
#输出所有元素的值
echo "the elements of this array are ${array[@]}"
#输出数组长度
echo "the size of the array is ${#array[@]}"
