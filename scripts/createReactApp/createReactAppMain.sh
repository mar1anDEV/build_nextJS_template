#!/bin/bash

set -e

RED='\033[91m'
GREEN='\033[92m'
YELLOW='\033[93m'
CYAN='\033[96m'
RESET='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/../lib/checkNode.sh"
source "$SCRIPT_DIR/../lib/mkdir.sh"

main_fn()
{
    echo -e "${GREEN}Script is running..${RESET}"

    if check_node_main;then
        make_dir
    fi
}

main_fn