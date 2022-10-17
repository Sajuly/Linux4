#!/bin/bash

if [ $# != 6 ]; then
    echo "n/a"
    exit 1
fi

if [[ -d "$1" ]]; then  # путь
    export par1=$1
else
    echo "n/a1"
    exit 1
fi

if [[ $2 =~ [0-9] ]]; then  #  количество вложенных папок.  if [[ $2 =~ [^0-9] ]] обратная
    export par2=$2
else
    echo "n/a2"
    exit 1
fi

export count=${#3}
if [[ ($count -gt 7) ]]; then  # -gt больше
    echo "7 знаков!"
    exit 1
fi

if [[ $3 =~ [A-Za-z] ]]; then
    export par3=$3
else
    echo "n/a3"
    exit 1
fi

if [[ $4 = [0-9] ]]; then  #   количество файлов
    export par4=$4
else
    echo "n/a4"
    exit 1
fi

# if [[ ! "$5" =~ ^([a-zA-Z]{1,7}).([a-zA-Z]{1,3})$ ]]; then
#     echo "n/a5"
#     exit 1
# else
#     export par5=$5
# fi

if [[ "$5" =~ ^([a-zA-Z]{1,7}).([a-zA-Z]{1,3})$ ]]; then
    export par5=$5
else
    echo "n/a5"
    exit 1
fi

filesize=$6
onlysize=${filesize%kb}

if [[ ! "$6" =~ ^([0-9]+kb)$ ]]; then
    echo "n/a6"
    exit 1
else 
    export par6=$6
fi

if [[ ! $onlysize > 0 || ! $onlysize -le 100 ]]; then
    echo "n/a6  100Кб!"
    exit 1
fi

# sudo chmod +x info_2.sh
./info.sh
