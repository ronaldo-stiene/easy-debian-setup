#!/bin/bash

# Set the source folder
src=$(cd $(dirname "$0"); pwd)

# Import the main
. "${src}/src/main.sh"

# Execute
execute "install"