#!/bin/bash

if [ -x "$(command -v eds)" ]; then
    SRC=$(dirname -- $(readlink `which eds`))
else
    SRC=$(cd $(dirname "$0"); pwd)
fi

if ! [ -a "${SRC}/src/main.sh" ]; then
    echo "Installation error: the 'main.sh' could not be found."
    exit 1
fi

if [[ $1 != -* ]]; then
    ACTION=$1
fi

if [[ $2 != -* ]]; then
    APP=$2
fi

for i in $*; do 
    case $i in
        -a) AVAIABLE="true" ;;
        -x) ALL="true" ;;
        -l) LIST="true" ;;
        -lt) LIST_ONLY_TERMINAL="true" ;;
        -h) HELP="true" ;;
    esac
done

. "${SRC}/src/main.sh"

execute $ACTION $APP