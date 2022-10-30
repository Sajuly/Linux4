#!/bin/bash

inputFile="/var/www/html/metrics/report.html"
sudo touch $inputFile

function page {
    # cpu="$(cat /proc/stat | grep cpu |sed -n '2'p)"
    cpu="$(grep 'cpu ' /proc/stat | LC_ALL=c awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')"
    mem_free="$(free -m | sed -n 2p | awk '{print $4}')"
    disk_used="$(df / | awk 'NR==2{print $3}')"
    disk_available="$(df / | awk 'NR==2{print $4}')"
    echo "scrpt_CPU ${cpu}"
    echo "scrpt_MemFree ${mem_free}"
    echo "scrpt_DiskUsed ${disk_used}"
    echo "scrpt_DiskAvailable ${disk_available}"
}

while true; do
    page | sudo tee $inputFile
    sleep 3
done