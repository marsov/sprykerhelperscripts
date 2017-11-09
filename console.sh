#!/bin/bash

BACKUP_PATH=$PATH
PATH=$PATH:"$(pwd)/x_scripts"
source devenv.sh
PATH=$BACKUP_PATH

CMD="cd $VM_PROJECT_ROOT && XDEBUG_CONFIG='remote_host=$X_DEBUG_REMOTE_HOST' PHP_IDE_CONFIG='$IDEA_PHP_IDE_CONFIG' vendor/bin/console "
CMD+=$1

if [ -n "$2" ]
then
    CMD+=" $2"
fi

ECHO $CMD

cd $HOST_PROJECT_ROOT
vagrant ssh -c "$CMD"