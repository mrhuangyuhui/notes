#-----------------------------/chapter4/ex4-19.sh------------------
#! /bin/sh
#通过echo命令和重定向创建一个文件
echo "hello world!" > ./msg.log
if [ -f ./msg.log ]; then echo "file has been created."; fi
