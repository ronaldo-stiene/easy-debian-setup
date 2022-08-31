#!/bin/bash

# Check if the scrit was called directly
if [ -z $src ]; then echo "This script should not be called directly"; exit 0; fi

# @todo use awk to print a table
jq -c ".[]" $applications | while read i; do
    id=$(echo $i | jq .id | tr -d '"')
    category=$(echo $i | jq .category | tr -d '"')
    command=$(echo $i | jq .command | tr -d '"') 

    if [ -z $previousCategory ] || [ $previousCategory != $category ]; then 
        if ! [ -z $previousCategory ]; then echo ""; fi
        success $category
    fi

    echo -en "- ${id}: "; if [ -x "$(command -v ${command})" ]; then echo -e "${green}Installed${reset}"; else echo -e "${red}Not Installed${reset}"; fi

    previousCategory=$category
done

echo ""
