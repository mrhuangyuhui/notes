#-----------------------------/chapter8/ex8-15.sh------------------
#! /bin/bash

#匹配任意多个字符“o”
str=`grep "lo*king" demo3.txt`

echo "$str"
