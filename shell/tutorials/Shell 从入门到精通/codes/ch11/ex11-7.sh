#-----------------------------/chapter11/ex11-7.sh------------------
#! /bin/bash

#»ìºÏÄ£Ê½
result=`awk '/^K/ && $2 > 80 { print }' scores.txt`

echo "$result"
