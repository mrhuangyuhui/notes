#! /bin/bash

RESTART="/sbin/service httpd restart"

PGREP="/usr/bin/pgrep"

HTTPD="httpd"

$PGREP ${HTTPD} &>/dev/null

if [ $? -ne 0 ]
then
   $RESTART
fi
