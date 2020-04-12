#-----------------------------/chapter9/ex9-27.sh------------------  
#! /bin/bash

#根据第3列的数值降序，第4列的数值升序排序
result=`sort -k 3,3nr -k 4,4n demo6.txt`

echo "$result"
