#-----------------------------/chapter9/ex9-10.sh------------------
#! /bin/bash

#双层嵌套循环输出乘法表
for((i=1;i<10;i++))
do
   for((j=1;j<=$i;j++))
   do
      #使用制表符对齐列
      echo -n -e "$i*$j\t"
   done
   #换行
   echo ""
done
