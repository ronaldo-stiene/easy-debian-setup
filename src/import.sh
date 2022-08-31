#!/bin/bash

# Check if the scrit was called directly
if [ -z $SRC ]; then echo "This script should not be called directly"; exit 0; fi

# Import the env
. "${SRC}/.env"

# Import the console message helpers
. "${SRC}/src/output/messages.sh"
. "${SRC}/src/output/blocks.sh"

# Import the functions
. "${SRC}/src/functions/execute.sh"
. "${SRC}/src/functions/list.sh"
. "${SRC}/src/functions/help.sh"