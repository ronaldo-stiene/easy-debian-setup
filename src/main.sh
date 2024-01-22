#!/bin/bash

# Check if the scrit was called directly
if [ -z $SRC ]; then echo "This script should not be called directly"; exit 0; fi

# Import the scripts
. "${SRC}/src/import.sh"

# Set the applications var
APPLICATIONS="${DATA_SRC}/applications.json"

# Execute the scripts
execute(){
    action=$1
    app=$2

    success_block "EasyDebianSetup - by Stiene"
    echo ""

    if ! [ -z $HELP ]; then
        eds_help
        return
    fi

    if [ -z $DATA_SRC ]; then
        error "Error: The data source was not defined"
        echo "eds: See the installation manual in: https://github.com/ronaldo-stiene/easy-debian-setup"
        return
    fi

    if ! [ -a $APPLICATIONS ]; then
        error "Error: The application JSON was not found in $DATA_SRC"
        echo "eds: See the installation manual in: https://github.com/ronaldo-stiene/easy-debian-setup"
        return
    fi

    if ! [ -z $LIST ]; then
        eds_list 'all'
        return
    fi

    if ! [ -z $LIST_ONLY_INTERFACE ]; then
        eds_list 'only_interface'
        return
    fi

    if ! [ -z $LIST_ONLY_TERMINAL ]; then
        eds_list 'only_terminal'
        return
    fi

    if [ -z $action ]; then
        error "Error: Missing <action> in 'eds <action> [-a | -x]'"
        echo "eds: See 'eds -h' for the avaiable commands"
        return
    fi

    if ! [ -z $AVAIABLE ]; then
        eds_avaiable $action
        return
    fi

    if ! [ -z $ALL ]; then
        echo -en "${cyan}Are you sure that you want ${action} all aplications? [y/n]: ${reset}"
        read allConfirm
        echo ""
        
        if [ ${allConfirm^^} == 'Y' ]; then 
            executeAll $action
        else 
            warning "Exiting"
        fi

        return
    fi

    if [ -z $app ]; then
        eds_list
    fi

    executeOne $action $app
}
