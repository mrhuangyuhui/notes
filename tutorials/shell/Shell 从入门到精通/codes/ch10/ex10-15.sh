#-----------------------------/chapter10/ex10-15.sh------------------ 
#! /bin/bash

#将所有的小写字母e替换为大写字母，然后打印2~3行
result=`sed -n -e 's/e/E/g' -e '2,3 p' students.txt`

echo "$result"
