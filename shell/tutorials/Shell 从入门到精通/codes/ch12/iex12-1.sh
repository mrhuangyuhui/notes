#! /bin/bash

echo "start"

exec 100< <(ls -l)

num=1

while read line; do
   echo "line $num:$line"
   num=$(($num + 1))
done  <&100

exec 100>&-
echo "end"
