#!/usr/bin/env bash

BACKUP_PATH=$PATH
PATH=$PATH:"$(pwd)/sprykerhelperscripts"
source devenv.sh
PATH=$BACKUP_PATH

if [ -n "$1" ]
then
    export APPLICATION_STORE=$1
fi

cd $VM_PROJECT_ROOT && git checkout src/Orm/Propel/DE/Migration_pgsql
vendor/bin/console scheduler:suspend
vendor/bin/console publish:trigger-events

vendor/bin/console queue:worker:start --stop-when-empty
vendor/bin/console queue:worker:start --stop-when-empty
