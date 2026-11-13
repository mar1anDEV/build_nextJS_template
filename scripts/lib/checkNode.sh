#!/bin/bash



set -e

RED='\033[91m'
GREEN='\033[92m'
YELLOW='\033[93m'
CYAN='\033[96m'
RESET='\033[0m'


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/../lib/askUser.sh"

checked_node_bool(){
    if ! command -v node > /dev/null;then
    echo "Node.js is not installed."
    return 1
    else return 0
    fi
}


    check_node_main(){
        echo -e "${YELLOW}Checking Node.js...${RESET}"
        if ! command -v node > /dev/null;then
        echo -e "${YELLOW}Node.js is not installed on your computer. You need to install Node.js in order to proceed with the script!${RESET}"
            if ask_user "Install Node.js with winget?";then
                winget install OpenJS.NodeJS.LTS
                if checked_node_bool;then
                    echo -e "${GREEN}Node.js is successfully installed.${RESET}"
                else echo "Open a new terminal and run the script again."
                fi
            else echo -e "${YELLOW} Install Node.js manually: https://nodejs.org ${RESET}"
            fi
            exit 1
        fi
        echo ""
        echo -e "${GREEN}Node.js is installed.${RESET}"
        echo -e "${GREEN}Node.js version: $(node -v)${RESET}"

        if checked_node_bool;then
            return 0
        fi
    }

