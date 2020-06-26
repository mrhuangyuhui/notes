#-----------------------------/chapter9/ex9-25.sh------------------ 
#! /bin/bash

#对第3列按数值排序
result=`sort -n -k 3,3  demo5.txt`

echo "$result"
