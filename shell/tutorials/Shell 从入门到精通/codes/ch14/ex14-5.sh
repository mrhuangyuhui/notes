#! /bin/bash

ERRTRAP()
{
   echo "[LINE:$1] Error:Command or function exited with status code $?"
}

func()
{
   return 1
}

trap 'ERRTRAP $LINENO' ERR
abc
func
