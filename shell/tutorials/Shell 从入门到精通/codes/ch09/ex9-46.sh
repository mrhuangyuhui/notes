#-----------------------------/chapter9/ex9-46.sh------------------ 
#! /bin/bash

#联接文件，并指定输出列的清单
result=`join -1 1 -2 2 -o 1.1 1.2 2.3 students.txt scores.txt > studentsscores.txt`

cat studentsscores.txt
