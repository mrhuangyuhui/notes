#-----------------------------/chapter11/ex11-23.sh------------------
#! /bin/awk -f

BEGIN {
   #输出子串在父串中出现的位置
   print index("Hello,world.","world")
}
