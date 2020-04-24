#!/usr/bin/env bash

WORKING_DIR="$HOME/repos/notes/codes/php-codes"

cd $WORKING_DIR/lumen-framework

zip -r -q $WORKING_DIR/idea-backup/lumen-framework_`date +%Y-%m-%d-%H-%M-%S`.zip .idea
