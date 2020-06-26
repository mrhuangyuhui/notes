#-----------------------------/chapter7/ex7-11.sh------------------
#! /bin/bash

#通过循环为数组赋值
for i in {1..10}
do
   array[$i]=$i
done
#输出元素的值
echo "${array[@]}"
