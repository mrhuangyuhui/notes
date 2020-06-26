#-----------------------------/chapter4/ex4-32.sh------------------
#! /bin/sh

#左移运算
result=$[ 2 << 3 ]
echo "$result"
#右移运算
result=$[ 8 >> 2 ]
echo "$result"
#按位与运算
result=$[ 8 & 4 ]
echo "$result"
#按位非运算
result=$[ ~8 ]
echo "$result"
#按位异或运算
result=$[ 10 ^ 6 ]
echo "$result"
