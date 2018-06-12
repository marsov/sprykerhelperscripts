#!/bin/bash

BACKUP_PATH=$PATH
PATH=$PATH:"$(pwd)/sprykerhelperscripts"
source devenv.sh
PATH=$BACKUP_PATH

CMD="cd $VM_PROJECT_ROOT && XDEBUG_CONFIG='idekey=PHPSTORM' XDEBUG_CONFIG='remote_host=$X_DEBUG_REMOTE_HOST' PHP_IDE_CONFIG='$IDEA_PHP_IDE_CONFIG' vendor/bin/codecept run Unit "
if [ -n "$1" ]
then
    CMD+=' -g '
    CMD+=$1
fi

ECHO $CMD

cd $HOST_PROJECT_ROOT
vagrant ssh -c "$CMD"
