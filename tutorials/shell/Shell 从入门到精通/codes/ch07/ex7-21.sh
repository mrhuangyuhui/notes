#-----------------------------/chapter7/ex7-21.sh------------------
#! /bin/bash

#定义数组
linux=("Debian" "RedHat" "Ubuntu" "Suse" "Fedora" "UTS" "CentOS")
#切片
array=(${linux[@]:2:4})
#获取新的数组的长度
length="${#array[@]}"
#输出数组长度
echo "the length of new array is $length"
#通过循环输出各个元素
for ((i=0;i<$length;i++))
do
   echo "${array[$i]}"
done
