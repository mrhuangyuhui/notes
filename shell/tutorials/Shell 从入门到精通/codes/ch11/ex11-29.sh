#-----------------------------/chapter11/ex11-29.sh------------------
#! /bin/awk -f

BEGIN {
   #为数组元素赋值
   arr[1]="Tim"
   arr["a"]=12
   arr[3]=3.1415
   arr[4]=5
   #输出数组元素的值
   print arr[1],arr[2],arr["a"]*arr[3],arr[4]
}
