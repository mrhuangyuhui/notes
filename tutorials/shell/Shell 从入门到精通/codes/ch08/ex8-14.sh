#-----------------------------/chapter8/ex8-15.sh------------------
#! /bin/bash

#匹配含有字符“o”，后面紧跟着字符“r”或者“u”的文本行
str=`grep "o[ru]" demo3.txt`

echo "$str"
