#-----------------------------/chapter5/ex5-22.sh------------------
#!/bin/sh

for i in a b c d
do
   echo -n "$i "
   for j in `seq 10`
   do
      if [ $j -eq 5 ];then
         #指定跳出层数2
         break 2
      fi
      echo -n "$j "
   done
   echo
done
