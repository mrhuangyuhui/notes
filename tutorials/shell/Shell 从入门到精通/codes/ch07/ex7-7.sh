#-----------------------------/chapter7/ex7-7.sh------------------
#! /bin/bash

#定义数组
students=(John Rose Tom Tim)

#输出元素值
echo "the old students are: ${students[*]}"

#改变第1个元素的值
students[0]=Susan
#改变第4个元素的值
students[3]=Jack
#输出数组新的值
echo "the new students are: ${students[*]}"

#声明关联数组
declare -A grades
#初始化新的数组
grades=([john]=90 [rose]=87 [tim]=78 [tom]=85 [jack]=76)
#输出数组元素值
echo "the old grades are: ${grades[@]}"
#改变Tim的分数
grades[tim]=84
#重新输出数组元素值
echo "the new grades are: ${grades[@]}"
