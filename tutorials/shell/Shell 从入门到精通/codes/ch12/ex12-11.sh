#! /bin/bash

exec 99>&2

exec 2> errlog

ls -lw

exec 2>&99

exec 99>&-
