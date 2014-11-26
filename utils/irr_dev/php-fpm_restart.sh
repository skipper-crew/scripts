#!/usr/local/bin/bash

op=$1
case $op in
    "--restart")
	index=0
	declare -a servers
	servers=(
	192.168.1.1	# web1
	192.168.1.2	# web2
	192.168.1.3	# web3
	192.168.1.184	# web4
	192.168.1.12	# web5
	192.168.1.13	# web6
	192.168.1.71	# web7
	192.168.1.72	# web8
	192.168.1.14	# web9
	192.168.1.182	# web10
	192.168.1.53	# web11
	192.168.1.78	# web12
#	192.168.1.164	# web13
	192.168.1.107	# web14
	192.168.1.183	# web15
	192.168.1.108	# web16
	192.168.1.179	# web17
	192.168.1.178	# web18
	192.168.1.177	# web19
	192.168.1.176	# web20
	192.168.1.164	# webbo
	)
	while [ $index -lt ${#servers[@]} ]; do
	    /usr/bin/ssh mephius@${servers[$index]} -p22 "echo -e \"\n\033[1m\033[34m------------------------\033[0m\" > /var/tmp/fpm.status; hostname >> /var/tmp/fpm.status; sudo /usr/local/etc/rc.d/php-fpm restart >> /var/tmp/fpm.status; cat /var/tmp/fpm.status" &
	    let "index+=1"
	done
	;;
    "--help")
	echo "--restart";
	printf "\tcopy config files to servers";
	;;
    *)
	echo "Unknown parameter. See --help"
	;;
esac
