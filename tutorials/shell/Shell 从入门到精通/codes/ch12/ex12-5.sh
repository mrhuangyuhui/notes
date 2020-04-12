#! /bin/bash

file=`find /etc -name "httpd.conf*" -print`

head -5 $file
