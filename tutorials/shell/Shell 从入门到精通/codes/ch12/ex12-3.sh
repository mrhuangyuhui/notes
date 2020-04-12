#! /bin/bash

files=`find /etc -type f -print | wc -l`
directories=`find /etc -type d -print | wc -l`
echo "There are $files regular files in /etc directory."
echo "There are $directories directories in /etc directory."
