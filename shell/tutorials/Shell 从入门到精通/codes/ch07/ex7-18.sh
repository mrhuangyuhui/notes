#-----------------------------/chapter7/ex7-18.sh------------------
#! /bin/bash

array=(Mon Tue Wed Thu Fri Sat Sun)
#通过循环输出所有的数组元素
for e in "${array[@]}"
do
   echo "$e"
done
