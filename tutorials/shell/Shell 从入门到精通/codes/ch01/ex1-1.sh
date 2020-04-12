#-----------------------------/chapter1/ex1-1.sh------------------
[root@linux ~]# for filename in `ls .`
> do
> if echo "$filename" | grep "xml"
> then
> echo "$filename"
> fi
> done
package.xml
package.xml
wbxml-1.0.3
wbxml-1.0.3
wbxml-1.0.3.tgz
wbxml-1.0.3.tgz
