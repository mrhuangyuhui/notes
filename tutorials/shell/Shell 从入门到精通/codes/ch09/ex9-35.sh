#-----------------------------/chapter9/ex9-35.sh------------------ 
#! /bin/bash

#选择指定的列
result=`cut -c1-3,5 passwd`

echo "$result"
