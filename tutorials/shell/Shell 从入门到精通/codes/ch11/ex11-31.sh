#-----------------------------/chapter11/ex11-31.sh------------------
#! /bin/awk -f

BEGIN {
   #定义数组
   arr[1]="Tim"
   arr[2]="John"
   arr["a"]=12
   arr[3]=3.1415
   arr[4]=5
   arr[99]=23

   #遍历数组
   for(n in arr)
   {
      print arr[n]
   }
}
