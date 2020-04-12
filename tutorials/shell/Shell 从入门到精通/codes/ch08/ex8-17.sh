#-----------------------------/chapter8/ex8-17.sh------------------
#! /bin/bash

#筛选以3个数字开头的文本行
str=`egrep "^[[:digit:]]{3}" demo5.txt`

echo "$str"
