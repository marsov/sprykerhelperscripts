#!/usr/bin/env bash

BACKUP_PATH=$PATH
PATH=$PATH:"$(pwd)/sprykerhelperscripts"
source devenv.sh
PATH=$BACKUP_PATH

CMD="cd $VM_PROJECT_ROOT && vendor/bin/phpcbf --standard=vendor/spryker/code-sniffer/Spryker/ruleset.xml "

if [ -n "$1" ]
then
    CMD+=" $1"
else
    CMD+=" ./src"
fi

ECHO $CMD

cd $HOST_PROJECT_ROOT
vagrant ssh -c "$CMD"
