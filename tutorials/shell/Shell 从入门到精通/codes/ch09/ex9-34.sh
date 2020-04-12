#-----------------------------/chapter9/ex9-34.sh------------------  
#! /bin/bash

#自定义分隔符为冒号，选择第1列和第6列
result=`cut -d ":" -f 1,6 passwd`

echo "$result"
