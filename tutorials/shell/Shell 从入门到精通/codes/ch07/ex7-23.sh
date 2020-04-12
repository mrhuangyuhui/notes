#-----------------------------/chapter7/ex7-23.sh------------------
#! /bin/bash

#定义数组
a=(1 2 3 4 5)
#输出替换结果
echo "the result is ${a[@]/3/100}"
#输出原始数组
echo "the old array is ${a[@]}"
#将替换结果赋给一个数组变量
a=(${a[@]/3/100})
#输出新的数组变量的值
echo "the new array is ${a[@]}"
