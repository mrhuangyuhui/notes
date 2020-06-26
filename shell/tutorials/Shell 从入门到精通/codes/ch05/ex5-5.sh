#! /bin/bash

#使用ls命令的执行结果作为列表
for file in $(ls)
do
   #输出每个文件名
   echo "$file"
done
