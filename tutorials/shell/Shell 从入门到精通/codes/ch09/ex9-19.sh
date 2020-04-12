#-----------------------------/chapter9/ex9-19.sh------------------
#! /bin/bash

#通过第2列和第3列排序
result=`sort -k 2,3 demo5.txt`

echo "$result"
