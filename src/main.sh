#!/bin/bash

# Check if the scrit was called directly
if [ -z $src ]; then echo "This script should not be called directly"; exit 0; fi

# Set the applications var
applications="${src}/data/applications.json"

# Import the console message helpers
. "${src}/src/output/messages.sh"
. "${src}/src/output/blocks.sh"

# Import the functions
. "${src}/src/functions/action.sh"

# Check the flags
while getopts :al FLAG; do
    case $FLAG in
        a) all="true" ;;
        l) list="true" ;;
    esac
done

# Execute the scripts
execute(){
    action=$1

    # Title
    success_block "Easy ${action^^} - by Stiene"
    echo ""

    # Execute the action for all aplications
    if ! [ -z $all ]; then
        echo -en "${cyan}Are you sure that you want ${action} all aplications? [y/n]: ${reset}"
        read allConfirm
        echo ""
        
        if [ ${allConfirm^^} == 'Y' ]; then . "${src}/src/execute/all.sh"; else warning "Exiting"; fi

        return
    fi

    # List the applications
    . "${src}/src/actions/list.sh"

    if ! [ -z $list ]; then
        return
    fi

    # Execute the action for one application
    . "${src}/src/execute/one.sh"
}
