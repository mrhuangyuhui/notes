#-----------------------------/chapter5/ex5-23.sh------------------
#!/bin/sh

for i in a b c d
do
   echo -n "$i "
   for j in `seq 10`
   do
      if [ $j -eq 5 ];then
         #跳过后面的语句
         continue
      fi
      echo -n "$j "
   done
   echo
done
