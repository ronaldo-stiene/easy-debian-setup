#!/bin/bash

# Check if the scrit was called directly
if [ -z $SRC ]; then echo "This script should not be called directly"; exit 0; fi

cyan_block="\e[1;46m"
green_block="\e[1;42m"
yellow_block="\e[1;43m"
red_block="\e[1;41m"
reset_block="\e[0m"

info_block(){
	arg1=$1
	echo -e "${cyan_block}${arg1}${reset_block}"
}

success_block(){
	arg1=$1
	echo -e "${green_block}${arg1}${reset_block}"
}

warning_block(){
	arg1=$1
	echo -e "${yellow_block}${arg1}${reset_block}"
}

error_block(){
	arg1=$1
	echo -e "${red_block}${arg1}${reset_block}"
}