#-----------------------------/chapter5/ex5-17.sh------------------
#! /bin/bash

for ((i=1;i<=9;i++))
do
   for ((j=1;j<=i;j++))
   do
      let "product=i*j"
      printf "$i*$j=$product"
      if [[ "$product" -gt 9 ]]
      then
         printf "   "
      else
         printf "    "
      fi
   done
   echo
   #当变量i的值为5时，退出循环
   if [[ "$i" -eq 5 ]]
   then
      break;
   fi
done
