#-----------------------------/chapter9/ex9-20.sh------------------
#! /bin/bash

if [ $1 -gt 4 ]
then
   echo "column no. could not be greater than 4."
   exit
fi

#仅指定起始列
result=`sort -r -k $1 demo6.txt`

echo "$result"
