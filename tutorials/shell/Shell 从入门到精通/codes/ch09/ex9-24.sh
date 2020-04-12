#-----------------------------/chapter9/ex9-24.sh------------------
#! /bin/bash

#使用修饰符实现降序
result=`sort -k 2,3r demo5.txt`

echo "$result"
