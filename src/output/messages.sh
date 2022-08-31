#!/bin/bash

# Check if the scrit was called directly
if [ -z $src ]; then echo "This script should not be called directly"; exit 0; fi

cyan="\033[1;36m"
green="\033[32m"
yellow="\033[1;33m"
red="\033[1;31m"
reset="\033[0m"

info(){
	arg1=$1
	echo -e "${cyan}${arg1}${reset}"
}

success(){
	arg1=$1
	echo -e "${green}${arg1}${reset}"
}

warning(){
	arg1=$1
	echo -e "${yellow}${arg1}${reset}"
}

error(){
	arg1=$1
	echo -e "${red}${arg1}${reset}"
}
