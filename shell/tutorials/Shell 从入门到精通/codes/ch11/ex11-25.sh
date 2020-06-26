#-----------------------------/chapter11/ex11-25.sh------------------
#! /bin/awk -f

BEGIN {
   #通过正则表达式搜索子串
   match("Hello, world.",/o/)
   print RSTART, RLENGTH
}
