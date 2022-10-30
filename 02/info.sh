#!/bin/bash

inputFile="log2.txt"
sudo touch $inputFile

start=$(date +%s%N)
times=$(date +%H:%M)

function net_mesta {
SPACE_ROOT_FREE=$(df | sed -n '3'p | awk '{printf("%d", $4 )}')
# echo ">>>>>$SPACE_ROOT_FREE"
if [[ $SPACE_ROOT_FREE -le 1048576 ]]; then
    echo "mesta net"
    exit 1
fi
}

folder=$p1
folder_random="$(compgen -d / | shuf -n1)"  #  "compgen -d /" список папок "shuf" — генератор случайных значений
file_ext=$(echo $p2 | awk -F. '{print $2}')
last_name_folder=${p1: -1}
file_name=$(echo $p2 | awk -F. '{print $1}')
old_name=$file_name
last_name_files=${file_name: -1}
log_date="$(date +"%d%m%y")"
new_date="DATE = $(date +"%d.%m.%y")"

count=$(( $RANDOM % 100 + 1 ))  #  $RANDOM: генерация псевдослучайных целых чисел 1-100

if [[ ${#folder} -le 5 ]]; then
    for (( i=${#folder}; i<5; i++ )); do
        folder+="$(echo $last_name_folder)"
    done
fi

net_mesta

    for (( i=1; i<=$count; i++ )); do

        net_mesta

        folder_random="$(compgen -d / | shuf -n1 )"
        files_count="$(shuf -i 1-100 -n1)"
        if [[ $folder_random == "/bin" || $folder_random == "/sbin" || $folder_random == "/root" ||  $folder_random == "/proc" || $folder_random == "/sys" ]]; then
            count++
            continue
        fi
        sudo mkdir -p "$folder_random/"$folder"_"$log_date"" 2>/dev/null
        for (( j=1; j<=${files_count}; j++ )); do
            echo "заполнено $i/${count} директорий и создано $j/${files_count} файлов"

            net_mesta

            sudo fallocate -l $p3 ""$folder_random"/"$folder"_"$log_date"/"$file_name"."$file_ext"_"$log_date"" 2>/dev/null
            line=""$new_date" | "$folder_random"/"$folder"_"$log_date"/"$file_name"."$file_ext"_"$log_date" | Размер файла = ${p3}";
            echo "$line" | sudo tee -a $inputFile
            file_name+="$(echo $last_name_files)"
        done
        file_name=$old_name
        folder+="$(echo $last_name_folder)"
    done
