#!/bin/bash

# Check if the scrit was called directly
if [ -z $src ]; then echo "This script should not be called directly"; exit 0; fi

# Getting the app from the user
echo -en "${cyan}Select the app: ${reset}"; read app
while [[ ! "$app" =~ [:alnum:] || -z "$app" ]]
do
    error "The app must have only alphanumeric characters."; echo ""
    echo -en "${cyan}Select the app: ${reset}"; read app
done
echo ""

id=$(jq -c ".$app.id" $applications | tr -d '"')

if [ $app != $id ]; then
    error_block "The app ${app} was not scripted or was incorrectly writed"
    return
fi

name=$(jq -c ".$app.name" $applications | tr -d '"')
command=$(jq -c ".$app.command" $applications | tr -d '"')
folder=$(jq -c ".$app.folder" $applications | tr -d '"')

action $action $name $command $folder
