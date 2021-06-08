#!/bin/bash
str=''
for ((i=0;${i}<=100;i+=5))
do
        sleep 0.2
        printf "progress:[%-40s]%d%%\r" "${str}" "${i}"
        str="##${str}"
done
echo

