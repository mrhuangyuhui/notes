#! /bin/bash

function filename()
{
   timestamp=$(date +%Y%m%d%H%M%S)
   echo "$1".$timestamp."tar"
}

function archivelog()
{
   archivefile=`filename httpd_log`
   
   archivedest=$1

   if [ ! -d archivedest ];then
      mkdir -p $archivedest
   fi

   cd /var/log/httpd

   find . -mtime +1 -exec tar -rf $archivedest$archivefile {} \;
   
   zip $archivedest$archivefile".zip" $archivedest$archivefile

   if [ "$?" -eq 0 ]
   then
      rm -f $archivedest$archivefile
   fi

   return $?
}

function removearchivedlog()
{
   cd /var/log/httpd

   find . -mtime +1 -exec rm -f $archivedest$archivefile {} \;
}

while true 
do
   archivelog "/root/chapter15/"

   if [ "$?" -eq 0 ]
   then
      removearchivedlog
   fi
   sleep 86400
done
