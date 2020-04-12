#-----------------------------/chapter1/ex1-2.sh------------------
#! /bin/sh

#for循环开始
for filename in `ls .`
do
   #如果文件名包含xml
   if echo "$filename" | grep "xml"
   then
      #输出文件名
      echo "$filename"
   fi
done
