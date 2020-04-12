#-----------------------------/chapter9/ex9-42.sh------------------ 
#! /bin/bash

#指定students.txt的第1列和scores.txt文件的第2列作为列关键字
result=`join -1 1 -2 2 students.txt scores.txt > studentsscores.txt`

cat studentsscores.txt
