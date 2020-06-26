#-----------------------------/chapter11/ex11-35.sh------------------
#! /bin/awk -f

BEGIN {
   #外层循环
   for(i=1;i<=9;i++)
   {
      #内层循环
      for(j=1;j<=i;j++)
      {
         #将每一行的数值连接成一个字符串
         if(i*j<10)
         {
            row=row"   "i*j
         }
         else
         {
            row=row"  "i*j
         }
      }
      #输出每一行数值
      print row
      row=""
   }
}
