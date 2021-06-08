#!/bin/bash
declare -a last
declare -a now
read -p "number of lines:" num
last[0]=1
for ((i=1;i<=$num;i+=1));do
	now[0]=1;
	for ((j=1;j<=$((num-i));j+=1));do
		echo -n " "
	done
	for ((j=1;j<$((i-1));j+=1));do
		now[j]=$((last[j-1]+last[j]))
	done
	now[i-1]=1
	echo ${now[*]}
	for ((j=0;j<i;j+=1));do
		last[j]=now[j]
	done
done
echo

