#-----------------------------/chapter9/ex9-36.sh------------------ 
#! /bin/bash

#提取所有行的第1列
cut -d ":" -f 1 passwd > allusers.txt
echo "all users:"
#显示所有的行
cat allusers.txt
#只提取正确的行
cut -s -d ":" -f 1 passwd > validusers.txt
echo "valid users:"
#显示所有正确的行
cat validusers.txt
