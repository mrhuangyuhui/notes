#-----------------------------/chapter7/ex7-9.sh------------------
#! /bin/bash

#定义数组
array=(1 2)
#输出数组
echo "${array[@]}"
#向数组末尾追加元素
array[2]=3
array[3]=4
echo "${array[@]}"
