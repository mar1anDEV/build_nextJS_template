#!/bin/bash
# The shebang above: run this file with bash


set -e


ask_user(){
        read -p "$1 (y/n): " answer
        if [ "$answer" = "y" ]; then
            return 0
        else 
            return 1
        fi
    }

checked_node_bool(){
    if ! command -v node > /dev/null;then
    echo "Node.js is not installed."
    return 1
    else return 0
    fi
}


check_node_main(){
    if ! command -v node > /dev/null;then
    echo "Node.js is not installed on your computer.You need to install Node.js in order to proceed with the script!"
    if ask_user "Install Node.js with winget?";then
        winget install OpenJS.NodeJS.LTS
        if checked_node_bool; then
        echo "Node.js is succesfully installed."
    else echo "Node.js is already installed."
    fi
}

check_node_main()


