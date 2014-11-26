#!/bin/bash

index=0
declare -a servers
servers=(web1 web2 web3 web4 web5 web6 web7 web8 web9 web10 web11 web12 web13 web14 web15 web16 web17 web18 web19 web20 helper helper_tmp helper2 helper2_kz helper3 cruncher)
while [ $index -lt ${#servers[@]} ]; do
    web_pid=`cat /var/run/update_${servers[$index]}.irr.ru.pid`; web_ps_pid=`ps aux | grep $web_pid | grep -v grep | awk '{print $2}'`
    echo -e "\033[1m\033[34m\tChecking status on ${servers[$index]}\033[0m"
    if [ ! -z $web_ps_pid ]; then
	echo -e "\033[1m\033[34m\tUpdate still in progress...\033[0m"
    else
	let "index+=1"
    fi
    sleep 1
done
