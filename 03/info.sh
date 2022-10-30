#!/bin/bash

date="$(cat ../02/log2.txt | awk -F'|' '{print $2}' | awk -F'_' '{print $3}')"
newDate=${date: -7}

# Log files

if [[ "$p1" -eq "1" ]]; then
	file="$(cat ../02/log2.txt | awk -F'|' '{print $2}')"
	for i in $file; do
		sudo rm -rf $i
		echo "${i}"
	done
	# rm -rf ../02/log2.txt
	# echo "Файл log2.txt - УДАЛЁН"
	
fi

# Date and time of creation

if [[ "$p1" -eq "2" ]]; then
	echo "Введите >DATE< >TIME< Например: >YYYY-MM-DD HH:MM<"
	read srcDate srcTime
	echo "Введите >DATE< >TIME< Например: >YYYY-MM-DD HH:MM<"
	read dstDate dstTime
	#find / -newerct "$srcDate $srcTime" -not -newerct "$dstDate $dstTime" 2>/dev/null | grep $newDate | sort 2>/dev/null
	sudo rm -rf $(find / -newerct "$srcDate $srcTime" -not -newerct "$dstDate $dstTime" 2>/dev/null | grep $newDate | sort) 2>/dev/null
	#echo "Папки удалены: $(find / -newerct "$srcDate $srcTime" -not -newerct "$dstDate $dstTime" 2>/dev/null | grep $newDate | sort)"
fi


# Name mask

if [[ "$p1" -eq "3" ]]; then
	echo "Введите расширение например az_"
	read ext
	sudo find / -name "*.$ext*" -exec rm -rf {} \; 2>/dev/null
	# echo "proverka"
	# find / -name "*.$ext*" 2>/dev/null
fi