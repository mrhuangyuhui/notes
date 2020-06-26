#!/bin/bash                                                                                                                                                                                                     
echo 'START'

exec 100< <(ls -l)

num=1
while read line; do
    echo "LINE $num: $line"
    num=$(($num + 1))
done <&100

exec 100>&-                     # close it                                                                                                                                                                      
echo 'END'
