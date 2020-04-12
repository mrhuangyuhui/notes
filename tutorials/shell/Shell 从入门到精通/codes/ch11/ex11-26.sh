#-----------------------------/chapter11/ex11-26.sh------------------
#! /bin/awk -f

BEGIN {
   string="5P12p89"
   #使用分隔符P或者p分隔字符串
   split(string,arr,/[Pp]/)
   #输出第1~3个数组元素
   print arr[1]
   print arr[2]
   print arr[3]
}
