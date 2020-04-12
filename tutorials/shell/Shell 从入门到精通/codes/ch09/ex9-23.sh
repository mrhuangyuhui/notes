#-----------------------------/chapter9/ex9-23.sh------------------
#! /bin/bash
   
#使用-r选项降序排序
result=`sort -r -k 2,3 demo5.txt`
   
echo "$result"
