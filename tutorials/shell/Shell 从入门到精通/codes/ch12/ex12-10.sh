#! /bin/bash

exec 3<> hello.txt

echo "Hello,world." >&3

echo "Hello,Shell." >&3
exec 3>&-
