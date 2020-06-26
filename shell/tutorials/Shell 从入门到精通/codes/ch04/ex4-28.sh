#-----------------------------/chapter4/ex4-28.sh------------------
#! /bin/sh

#计算2和100的差，即-98
result=`expr 2 - 100`
echo "$result"
#计算2和100的和，即102
result=`expr 2 + 100`
echo "$result"
#计算2和5的乘积，即10
result=`expr 2 \* 5`
echo "$result"
#计算24和8的商，即3
result=`expr 24 / 8`
echo "$result"
#先计算2和6的差，然后再乘以12，即-48
result=`expr \( 2 - 6 \) \* 12`
echo "$result"
#错误的语法
result=`expr 2+5`
echo "$result"
#错误的语法
result=`expr 2-4*9`
echo "$result"
#错误的语法
result=`expr 1-(4-7)`
echo "$result"
