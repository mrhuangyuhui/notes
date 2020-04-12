#!/usr/bin/env bash

# #shell-directory

# 判断目录是否存在
if [ -d "/usr/local" ]; then
    echo "/usr/local is a directory."
fi

# 判断目录是否不存在
if [ ! -d "/unknown/directory" ]; then
    echo "/unknown/directory is not a directory."
fi