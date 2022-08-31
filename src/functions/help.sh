#!/bin/bash

# Check if the scrit was called directly
if [ -z $SRC ]; then echo "This script should not be called directly"; exit 0; fi

eds_help(){
    info "eds [-l | -h] [<action> [-x | -a ]] [<app>]"
    echo ""
    echo "  <action>: The action that will execute. Must be the same of the scripts names in data."
    echo "  <app>: The app name. Must used with action."
    echo "  -a: List all the app's scripts avaiable for the selected action. Must inform the action."
    echo "  -h: Show the help."
    echo "  -l: List all the applications."
    echo "  -x: Execute the action for all the avaiable applications. Must inform the action."
    echo ""
    echo "See the installation manual in: https://github.com/ronaldo-stiene/easy-debian-setup"
}