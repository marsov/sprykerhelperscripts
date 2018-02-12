#!/usr/bin/env bash

BACKUP_PATH=$PATH
PATH=$PATH:"$(pwd)/sprykerhelperscripts"
source devenv.sh
PATH=$BACKUP_PATH

CMD="cd $VM_PROJECT_ROOT && vendor/bin/phpmd "

if [ -n "$1" ]
then
    CMD+=" $1"
else
    CMD+=" ./src"
fi

CMD+=" text cleancode,codesize,design,naming,unusedcode,controversial"

ECHO $CMD

cd $HOST_PROJECT_ROOT
vagrant ssh -c "$CMD"
