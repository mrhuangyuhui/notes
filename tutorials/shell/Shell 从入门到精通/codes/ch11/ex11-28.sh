#-----------------------------/chapter11/ex11-28.sh------------------
#! /bin/awk -f

BEGIN {
   #定义字符串变量
   pages="p12-P34 P56-p78"
   #通过循环依次匹配字符串中的数字
   while(match(pages,/[0-9]+/)>0) {
      #截取并输出匹配的子串
      print substr(pages,RSTART,RLENGTH)
      #删除匹配的子串
      sub(/[0-9]+/,"",pages)
   }
}
