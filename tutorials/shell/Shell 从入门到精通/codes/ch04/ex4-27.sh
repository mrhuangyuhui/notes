#-----------------------------/chapter4/ex4-27.sh------------------
#! /bin/sh

#输出提示信息
echo "Hit a key,then hit return."
#读取用户按下的键
read keypress
#case语句开始
case "$keypress" in
   #小写字母
   [[:lower:]])
      echo "Lowercase letter.";;
   #大写字母
   [[:upper:]])
      echo "Uppercase letter.";;
   #单个数字
   [0-9])
      echo "Digit.";;
   #其他字符
   *)
      echo "other letter.";;
esac
