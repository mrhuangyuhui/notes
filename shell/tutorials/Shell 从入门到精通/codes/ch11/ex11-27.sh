#-----------------------------/chapter11/ex11-27.sh------------------
#! /bin/awk -f

BEGIN {
   #定义字符串
   string="abcd6b12abcabc212@123465"
   #将第1个符合正则表达式/(abc)+[0-9]*/的子串用括号括起来
   sub(/(abc)+[0-9]*/,"(&)",string)
   print string
   
   #将所有符合正则表达式/(abc)+[0-9]*/的子串用括号括起来
   gsub(/(abc)+[0-9]*/,"(&)",string)
   print string
}
