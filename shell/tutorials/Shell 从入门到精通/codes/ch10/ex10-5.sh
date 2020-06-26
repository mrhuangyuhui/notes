#-----------------------------/chapter10/ex10-5.sh------------------ 
#! /bin/bash

#使用混合位置参数
result=`sed '1,/^200200167/ s/e/E/g' students.txt`

echo "$result"
