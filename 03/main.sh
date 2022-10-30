#!/bin/bash

if [[ $# == 1 ]]; then
    if [[ $1 =~ [1-3] ]]; then
    export p1=$1

    # sudo chmod +x ./info.sh
    ./info.sh
    else
        echo "n/a1"
        exit 1
    fi
else
    echo "n/a1"
    exit 1
fi