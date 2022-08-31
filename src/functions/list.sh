#!/bin/bash

# Check if the scrit was called directly
if [ -z $SRC ]; then echo "This script should not be called directly"; exit 0; fi

eds_list(){
    # @todo use awk to print a table
    jq -c ".[]" $APPLICATIONS | while read i; do
        id=$(echo $i | jq .id | tr -d '"')
        category=$(echo $i | jq .category | tr -d '"')
        subCategory=$(echo $i | jq .subcategory | tr -d '"')
        command=$(echo $i | jq .command | tr -d '"') 

        if [ -z $previousCategory ] || [ $previousCategory != ${category^} ]; then 
            if ! [ -z $previousCategory ]; then echo ""; fi
            success ${category^}
        fi

        if [ $subCategory == 'null' ]; then 
            echo -en "- ${id}: "; if [ -x "$(command -v ${command})" ]; then echo -e "${green}Installed${reset}"; else echo -e "${red}Not Installed${reset}"; fi
        else
            if [ -z $previousSubCategory ] || [ $previousSubCategory != ${subCategory^} ]; then 
                echo -e "  ${green}${subCategory^}${reset}"
            fi
            
            echo -en "  - ${id}: "; if [ -x "$(command -v ${command})" ]; then echo -e "${green}Installed${reset}"; else echo -e "${red}Not Installed${reset}"; fi
            
            previousSubCategory=${subCategory^}
        fi

        previousCategory=${category^}
    done

    echo ""
}

eds_avaiable(){
    jq -c ".[]" $APPLICATIONS | while read i; do
        action=$1
        id=$(echo $i | jq .id | tr -d '"')
        category=$(echo $i | jq .category | tr -d '"')
        subCategory=$(echo $i | jq .subcategory | tr -d '"')
        command=$(echo $i | jq .command | tr -d '"') 
        folder=$(echo $i | jq .folder | tr -d '"')

        if ! [ -a "${DATA_SRC}/${folder}/${action}.sh" ]; then
            continue
        fi

        if [ -z $previousCategory ] || [ $previousCategory != ${category^} ]; then 
            if ! [ -z $previousCategory ]; then echo ""; fi
            success ${category^}
        fi

        if [ $subCategory == 'null' ]; then 
            echo -en "- ${id}: "; if [ -x "$(command -v ${command})" ]; then echo -e "${green}Installed${reset}"; else echo -e "${red}Not Installed${reset}"; fi
        else
            if [ -z $previousSubCategory ] || [ $previousSubCategory != ${subCategory^} ]; then 
                echo -e "  ${green}${subCategory^}${reset}"
            fi
            
            echo -en "  - ${id}: "; if [ -x "$(command -v ${command})" ]; then echo -e "${green}Installed${reset}"; else echo -e "${red}Not Installed${reset}"; fi
            
            previousSubCategory=${subCategory^}
        fi

        previousCategory=${category^}
    done

    echo ""
}
