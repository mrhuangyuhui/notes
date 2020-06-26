#-----------------------------/chapter4/ex4-29.sh------------------
#! /bin/sh

#紧凑格式，计算3和6的和
result=$((3+6))
echo "$result"
#松散格式，计算3和9的和
result=$(( 3 + 9 ))
echo "$result"
#计算3和6的乘积
reuslt=$(( 3 * 6 ))
echo "$result"
#计算7和5的商
result=$(( 7 / 5 ))
echo "$result"
#计算8和3的余数
result=$(( 8 % 3 ))
echo "$result"
#复合运算
result=$(( ( 1-4 ) * 5 ))
echo "$result"

