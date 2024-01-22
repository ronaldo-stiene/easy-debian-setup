#!/bin/bash

# Check if the scrit was called directly
if [ -z $SRC ]; then echo "This script should not be called directly"; exit 0; fi

eds_help(){
    info "eds [<option>] [<action> [-x | -a]] [<app>]"
    echo ""
    echo "OPTION:"
    echo "  These options should be used without the action."
    echo "    -h: Show the help."
    echo "    -l: List all the applications."
    echo "    -lt: List all the applications without interface."
    echo ""
    echo "ACTION: The action that will execute"
    echo "  The action name should be the same of the scripts names inside data folder (scripts)."
    echo "  The default ones are these:"
    echo "    - install"
    echo "    - uninstall"
    echo "    - setup"
    echo "    - backup"
    echo "  Some apps may have customs actions, or miss some of the above."
    echo ""
    echo "  Options for action"
    echo "    -a: List all the app's scripts avaiable for the selected action. Must inform the action."
    echo "    -x: Execute the action for all the avaiable applications. Must inform the action."
    echo ""
    echo "APP: The app name."
    echo "  Must used with action. Check all available apps with 'eds -l'"
    echo ""
    echo "See the installation manual in: https://github.com/ronaldo-stiene/easy-debian-setup"
}