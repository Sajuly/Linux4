#!/bin/bash

if [ $# != 3 ]; then
    echo "n/a1"
    exit 1
fi

if [[ ${#1} -gt 7 ]]; then
    echo "в названии папок должно быть не более 7 знаков!"
    exit
fi

if [[ $1 =~ [^A-Za-z] ]]; then
    echo "n/a2"
    exit
else
    export p1=$1
fi

if [[ ! "$2" =~ ^([a-zA-Z]{1,7}).([a-zA-Z]{1,3})$ ]]; then
    echo "для имени файла - не более 7 знаков, для расширения - не более 3 знаков!"
    exit
else
    export p2=$2
fi

file_size=$(echo $3 | awk -F"Mb" '{print $1}')

if [[ !($3 =~ Mb$) || ($file_size =~ [^0-9]) || ($file_size -gt 100) || ($file_size -le 0) ]]; then
    echo "формат размера файла введён некорректно!"
    exit 1
else
    export p3=$3
fi

# sudo chmod +x ./info.sh
./info.sh