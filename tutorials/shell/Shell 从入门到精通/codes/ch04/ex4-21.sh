#-----------------------------/chapter4/ex4-21.sh------------------
#! /bin/sh
#使用&&操作符代替if语句
test "$(whoami)" != "root" && (echo you are using a non-privileged account; exit 1)
