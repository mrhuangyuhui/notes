#-----------------------------/chapter7/ex7-10.sh------------------
#! /bin/bash

#定义数组
declare -A array
#初始化数组
array=([a]=a [b]=b)

echo "the old elements are ${array[@]}"
#向数组追加元素
array[c]=c

echo "the new elements are ${array[@]}"
