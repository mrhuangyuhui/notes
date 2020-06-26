#-----------------------------/chapter8/ex8-9.sh------------------
#! /bin/bash

#筛选含有字符串“ssh”、“ssl”或者以字符串“yum”开头的文本行
str=`ls /etc | egrep "(ssh|ssl|^yum)"`

echo "$str"
