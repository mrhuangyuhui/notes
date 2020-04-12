#-----------------------------/chapter11/ex11-37.sh------------------
#! /bin/awk -f

BEGIN {
   #通过循环读取数据
   while( getline < "scores.txt" > 0)
   {
      #当第1个字段含有字符串Nancy时跳过后面的语句
      if($1 == "Kity")
         continue
      print $1,$2,$3,$4,$5
   }
}
