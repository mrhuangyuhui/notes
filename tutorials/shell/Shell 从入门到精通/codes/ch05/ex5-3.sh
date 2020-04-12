#! /bin/bash

#定义变量，并赋初值为0
sum=0;
#for循环开始，设置起始数值为1，结束数值为100，步长为2
for i in {1..100..2}
do
   #将数累加
   let "sum+=i"
done
echo "the sum is $sum"
