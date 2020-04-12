#-----------------------------/chapter10/ex10-6.sh------------------
#! /bin/bash

#将文件中的HTML标记替换为空
result=`sed 's/<[^>]*>//g' html.txt`

echo "$result"
