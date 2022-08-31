#!/bin/bash

# Check if the scrit was called directly
if [ -z $src ]; then echo "This script should not be called directly"; exit 0; fi

jq -c ".[]" $applications | while read i; do
    name=$(echo $i | jq .name | tr -d '"')
    command=$(echo $i | jq .command | tr -d '"')
    folder=$(echo $i | jq .folder | tr -d '"')

    action $action $name $command $folder
    echo ""
done