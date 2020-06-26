#-----------------------------/chapter11/ex11-36.sh------------------
#! /bin/awk -f

BEGIN {
   #循环读取数据
   while( getline < "scores.txt" > 0)
   {
      #当第1个字段的额值为Kity时退出
      if($1=="Kity")
         break
      else
         print $1,$2,$3,$4,$5
   }
}
