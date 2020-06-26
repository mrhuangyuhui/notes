#! /bin/bash

find ./tmp -name "*.php" -exec rm -f {} \;

if [ $? -eq 0 ]
then
   echo "the files have been deleted successfully.";
else
   echo "Failed to delete files.";
fi
