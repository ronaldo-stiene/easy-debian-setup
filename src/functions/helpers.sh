#!/bin/bash

# Check if the scrit was called directly
if [ -z $SRC ]; then echo "This script should not be called directly"; exit 0; fi

cmd_exists() {
    if [[ $(type -P $1) ]]; then
      return 0
    fi
    return 1
}

package_exists() {
    return $(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep $1 &> /dev/null)
}