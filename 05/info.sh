#!/bin/bash

rm -rf *.log

if [[ $p1 == 1 ]]; then
    for (( i=1; i < 6; i++ )); do
        sort -k9 ../04/$i.log -o sort$i.log
        #cat sort$i.log
    done
fi

if [[ $p1 == 2 ]]; then
    for (( i = 1; i < 6; i++ )); do
        awk '{print $1}' ../04/$i.log > sort$i.log
        #cat sort$i.log
    done
fi

if [[ $p1 == 3 ]]; then
    for (( i = 1; i < 6; i++ )); do
        awk '$9 ~ /[45]/' ../04/$i.log > sort$i.log
        #cat sort$i.log
    done
fi

if [[ $p1 == 4 ]]; then
    for (( i = 1; i < 6; i++ )); do
        awk '$9 ~ /[45]/' ../04/$i.log > temp.log
        awk '{print $1}' temp.log > sort$i.log
        rm -rf temp.log
        #cat sort$i.log
    done
fi