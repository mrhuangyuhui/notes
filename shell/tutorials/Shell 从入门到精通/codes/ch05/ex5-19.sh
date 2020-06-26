#-----------------------------/chapter5/ex5-19.sh------------------
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
      if [[ "$j" -eq 5 ]]
      then
         #增加参数2
         break 2
      fi
   done
   echo
done
