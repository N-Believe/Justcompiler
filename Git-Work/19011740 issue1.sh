#!/bin/bash
fail_file="loginerr.log"
success_file="login.log"
while ((1));do
clear
read -p "localhost login:" name;
read -p "passpord:" key; 
if [[ "$name" = "tom" ]]&&[[ "$key" = "tom" ]] ;then
	if [ -e "$success_file"  ] ;then
		echo "`date` on  `whoami`" >>"$success_file"
	else
		echo "`date` on  `whoami`" >"$success_file"
	fi
	if [ "`ls -A "$fail_file"`"!=""  ] ;then
		echo "Last failed login: "
		tail -n 1 "$fail_file"
		sed -i '$d' "$fail_file"
		echo ""
	fi
	if [ "`ls -A "$success_file"`"!="" ] ;then
		echo "Last successful login: "
		tail -n 1 "$success_file"
		echo ""
	fi
	echo "welcome to `uname -r`"
	sleep 3s
	break
else
	echo "Login Incorrect"
	if [ -e "$fail_file" ];then
		echo "`date` on `whoami`" >> "$fail_file"
	else
		echo "`date` on `whoami`" > "$fail_file"
	fi
	sleep 4s
fi
done
