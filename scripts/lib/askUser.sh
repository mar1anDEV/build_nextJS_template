ask_user(){
        read -p "$1 (y/n): " answer
        if [ "$answer" = "y" ]; then
            return 0
        else 
            return 1
        fi
    }