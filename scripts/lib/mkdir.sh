#!/bin/bash
set -e

RED='\033[91m'
GREEN='\033[92m'
YELLOW='\033[93m'
CYAN='\033[96m'
RESET='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/../lib/askUser.sh"

PROJECT_FOLDERS="components hooks utils styles types"


choose_project_name(){
    cd "$HOME/Desktop"

    while true; do
        read -p "Give a name to your project: " project_name

        # npm only allows lowercase names without spaces
        project_name="${project_name,,}"
        project_name="${project_name// /-}"

        if [ -z "$project_name" ]; then
            echo -e "${YELLOW}The name can't be empty.${RESET}"
        elif [ -d "$project_name" ]; then
            echo -e "${YELLOW}A project named '$project_name' already exists, choose a different name.${RESET}"
        else
            break
        fi
    done

    project_dir="$HOME/Desktop/$project_name"
    mkdir "$project_dir"
    cd "$project_dir"
    echo -e "${GREEN}Project folder: $project_dir${RESET}"
}


choose_framework(){
    while true; do
        echo -e "${GREEN}1. React-Vite${RESET}"
        echo -e "${CYAN}2. Next.js${RESET}"
        read -p "1/2: " framework_choice

        if [ "$framework_choice" = "1" ] || [ "$framework_choice" = "2" ]; then
            break
        fi
        echo -e "${YELLOW}You must choose between React-Vite (1) and Next.js (2).${RESET}"
    done
}


create_app(){
    case "$framework_choice" in
    1)
        echo -e "${GREEN}React selected${RESET}"
        if ask_user "Use TypeScript?"; then
            template="react-ts"
        else
            template="react"
        fi
        npm create vite@latest . -- --template "$template"
        npm install
        ;;
    2)
        echo -e "${CYAN}Next.js selected${RESET}"
        if ask_user "Use TypeScript?"; then
            lang="--ts"
        else
            lang="--js"
        fi
        npx create-next-app@latest . "$lang" --tailwind --eslint --app --src-dir --use-npm --import-alias "@/*"
        ;;
    esac
}


create_folders(){
    echo -e "${YELLOW}Creating folders...${RESET}"
    for folder in $PROJECT_FOLDERS; do
        mkdir -p "$project_dir/src/$folder"
        touch "$project_dir/src/$folder/.gitkeep"
    done
}


install_extras(){
    cd "$project_dir"
    if ask_user "Install TanStack Query?"; then
        npm install @tanstack/react-query @tanstack/react-query-devtools
    fi
}


open_editor(){
    if command -v code > /dev/null; then
        code "$project_dir"
    else
        echo -e "${YELLOW}VS Code command 'code' not found, open the project manually.${RESET}"
    fi
}


create_project(){
    choose_project_name
    choose_framework
    create_app
    create_folders
    install_extras
    echo -e "${GREEN}Project successfully created.${RESET}"
    open_editor
}

create_project