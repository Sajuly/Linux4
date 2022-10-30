#!/bin/bash

if [[ $# == 1 ]]; then
    if [[ $1 = [1-4] ]]; then
        export p1=$1

        # chmod +x info.sh
        ./info.sh
    else
        echo "n/a2"
        exit 1
    fi
else
    echo "n/a1"
    exit 1
fi
