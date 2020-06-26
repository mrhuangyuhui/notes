#-----------------------------/chapter9/ex9-22.sh------------------
#! /bin/bash

if [ $1 -gt 4 ]
then
   echo "column no. could not be greater than 4."
   exit
fi

#根据指定的列排序
result=`sort -k $1,$1 demo6.txt`

echo "$result"
