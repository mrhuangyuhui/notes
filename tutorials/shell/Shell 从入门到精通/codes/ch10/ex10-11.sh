#-----------------------------/chapter10/ex10-11.sh------------------
#! /bin/bash

#删除1~4行
result=`sed -e '1,4 d' students.txt`

echo "$result"

echo "==============================="

#删除奇数行
result=`sed -e '1~2 d' students.txt`

echo "$result"

echo "=============================="

#删除偶数行
result=`sed -e '0~2 d' students.txt`

echo "$result"

echo "============================="

#删除从第1行开始，一直到以200200172开头的行
result=`sed -e '1,/^200200172/ d' students.txt`

echo "$result"

echo "============================"

#删除从第4行开始，一直到最后一行的所有行
result=`sed '4,$ d' students.txt`

echo "$result"
