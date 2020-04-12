#-----------------------------/chapter5/ex5-16.sh------------------
#! /bin/bash

#外层循环
for ((i=1;i<=9;i++))
do
   #内层循环
   for ((j=1;j<=i;j++))
   do
      #计算2个数的乘积
      let "product=i*j"
      #输出乘积
      printf "$i*$j=$product"
      #输出空格分隔符
      if [[ "$product" -gt 9 ]]
      then
         printf "   "
      else
         printf "    "
      fi
   done
   echo
done
