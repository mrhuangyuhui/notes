#!/usr/bin/env bash

DEST_DIR="$HOME/backups/bash"

if [ ! -d $DEST_DIR ]; then
    mkdir -p $DEST_DIR
fi
cp ~/.bash_profile ${DEST_DIR}/.bash_profile_`date +%Y-%m-%d-%H-%M-%S`