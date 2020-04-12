#-----------------------------/chapter9/ex9-33.sh------------------ 
#! /bin/bash

#统计单词数，只取得数量
words=`cat demo1.txt | wc -w`

echo "there are $words words in file demo1.txt"
#统计字符数
chars=`cat demo1.txt | wc -m`

echo "there are $chars characters in file demo1.txt"
