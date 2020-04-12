#-----------------------------/chapter11/ex11-10.sh------------------
#! /bin/awk -f

#通过BEGIN模式初始化变量
BEGIN {
   FS="[\t:]"
   RS="\n"
   count=30
   print "The report is about students's scores."
}
