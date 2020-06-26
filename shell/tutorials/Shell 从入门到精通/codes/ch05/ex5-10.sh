#! /bin/bash

#定义数组
array=(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
#通过for循环遍历数组元素
for day in ${array[*]}
do
   #输出每个数组元素的值
   echo $day
done
