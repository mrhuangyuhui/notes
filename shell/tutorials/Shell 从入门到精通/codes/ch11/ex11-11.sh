#-----------------------------/chapter11/ex11-11.sh------------------
#! /bin/awk -f

#输出报表头
BEGIN {
   print "scores report"
   print "================================="
}

#输出数据
{ print }

#报表完成
END {
   print "================================"
   print "printing is over"
}
