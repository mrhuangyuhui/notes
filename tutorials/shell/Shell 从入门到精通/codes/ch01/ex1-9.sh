#-----------------------------/chapter1/ex1-9.sh------------------
#!/bin/sh

echo "hello world"
#退出状态为0, 因为命令执行成功.  
echo $?    
#无效命令.
abc
#非零的退出状态, 因为命令执行失败.
echo $?    
echo
#返回120退出状态给shell.  
exit 120
