#-----------------------------/chapter8/ex8-16.sh------------------
#! /bin/bash

#筛选符合格式的电话号码
str=`egrep "800-[[:digit:]]{3}-[[:digit:]]{4}$" demo4.txt`

echo "$str"
