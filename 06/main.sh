#!/bin/bash

GREEN='\033[1;32m'; RESET='\033[0m'; RED='\033[1;31m'
if [[ $# == 0 ]]; then

    # sudo apt install goaccess
    goaccess ../04/*.log --log-format=COMBINED -a -o index.html
    if [ -s index.html ]; then
        echo -e "${GREEN}данные записаны в index.html${RESET}"
    fi
    
else
    echo -e "${RED}n/a${RESET}"
fi