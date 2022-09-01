#!/bin/bash

# Check if the scrit was called directly
if [ -z $SRC ]; then echo "This script should not be called directly"; exit 0; fi

executeAll(){
    action=$1

    jq -c ".[]" $APPLICATIONS | while read i; do
        name=$(echo $i | jq .name | tr -d '"')
        command=$(echo $i | jq .command | tr -d '"')
        folder=$(echo $i | jq .folder | tr -d '"')

        action $action $name $command $folder
        echo ""
    done
}

executeOne(){
    action=$1
    app=$2

    if [ -z $app ]; then
        echo -en "${cyan}Select the app: ${reset}"
        read app
        while [[ ! "$app" =~ [:alnum:] || -z "$app" ]]
        do
            error "The app must have only alphanumeric characters."; echo ""
            echo -en "${cyan}Select the app: ${reset}"
            read app
        done
        echo ""
    fi

    id=$(jq -c ".$app.id" $APPLICATIONS | tr -d '"')

    if [ $app != $id ]; then
        error_block "The app ${app} was not scripted or was incorrectly writed"
        return
    fi

    name=$(jq -c ".$app.name" $APPLICATIONS | tr -d '"')
    command=$(jq -c ".$app.command" $APPLICATIONS | tr -d '"')
    folder=$(jq -c ".$app.folder" $APPLICATIONS | tr -d '"')

    action $action $name $command $folder
}

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

    file="${DATA_SRC}/${folder}/${action}.sh"

    if [ -a $file ]; then
        . $file
        success_block "${action^} of ${name} finished"
    else
        warning_block "The ${action} script for ${name} doesn't exists. Searchin in ${file}. Skipping."
    fi
}
