#-----------------------------/chapter9/ex9-49.sh------------------
#! /bin/bash

#将当前目录在的所有文件的文件名转为大写
for file in `ls`;do
   echo "$file" | tr 'a-z' 'A-Z'
done
