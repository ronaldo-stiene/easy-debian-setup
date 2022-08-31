#!/bin/bash

# Check if the scrit was called directly
if [ -z $src ]; then echo "This script should not be called directly"; exit 0; fi

action(){
    action=$1
	name=$2
	command=$3
	folder=$4

    success "${action^} of ${name} starting..."

    if [ $action == 'install' ]; then
        if [ -x "$(command -v ${command})" ]; then
            success_block "${name} is already installed"
            return
        fi
    else
        if ! [ -x "$(command -v ${command})" ]; then
            error_block "${name} is not installed"
            return
        fi
    fi

    file="${src}/data/${folder}/${action}.sh"

    if [ -a $file ]; then
        . $file
        success_block "${action^} of ${name} finished"
    else
        warning_block "The ${action} script for ${name} doesn't exists. Skipping."
    fi
}
