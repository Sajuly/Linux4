#!/bin/bash

input_file="log.txt"
touch $input_file

function net_mesta {
SPACE_ROOT_FREE=$(df | sed -n '3'p | awk '{printf("%d", $4 )}')
# echo ">>>>>$SPACE_ROOT_FREE"
if [[ $SPACE_ROOT_FREE -le 1048576 ]]; then
    echo "mesta net"
    exit 1
fi
}

folder=$par3
file_name=$(echo $par5 | awk -F. '{print $1}')   # -F для изменения разделителя полей
file_ext=$(echo $par5 | awk -F. '{print $2}')
last_name_folder=${par3: -1}  #  последняя буква
file_Name=$file_name
old_Name=$file_Name
last_name_files=${file_Name: -1}
log_date="$(date +"%d%m%y")"
new_date="DATE = $(date +"%d.%m.%y")"

if [[ ${#folder} -lt 4 ]]; then  #  меньше
    for (( i=${#folder}; i<4; i++ )); do  #  #(кол-во символов)folder
        folder+="$(echo $last_name_folder)"
    done
fi

net_mesta
for (( i=1; i<=$par2; i++ )); do
    mkdir -p "$par1/"$folder"_"$log_date""
    for (( j=1; j<=$par4; j++ )); do
        net_mesta
        fallocate -l $par6 ""$par1"/"$folder"_"$log_date"/"$file_Name"."$file_ext"_"$log_date""   #  fallocate для создания файлов определенного размера
        line=""$new_date" | "$p3"/"$folder"_"$log_date"/"$file_Name"."$file_ext"_"$log_date" | Size of file = ${par6}."
        echo "$line" | tee -a $input_file
        file_Name+="$(echo $last_name_files)"
    done
    file_Name=$old_Name
    folder+="$(echo $last_name_folder)"
done
