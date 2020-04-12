#-----------------------------/chapter5/ex5-20.sh------------------
#! /bin/bash

for var in {1..10}
do
   #如果当前数字为奇数
   if [[ "$var%2" -eq 1 ]]
   then
      #跳过后面的语句
      continue
   fi
   echo "$var"
done
