#!/bin/sh

#		copy server.conf.php to all servers
#       run it script from mephius user
#		from helper server
#		file server.conf.php must have owner mephius

op=$1
now=`date "+%Y-%m-%d_%H:%M:%S`	# use in functions
conf_path_www='/usr/local/www/new.irr.ru/'
conf_path_home='/usr/home/mephius/irr.ru/'
conf_path_home_debian='/home/mephius/irr.ru/'
conf_path_home_kz='/usr/home/mephius/irr.kz/'

copy_config ()
{
	server_ip=$1
	port=$2
	conf_path=$3
	server_name=$4
	res=1       # error
	echo -e "\n\033[1m\033[33m\t$server_name\033[0m"
	echo "create backup server.conf.php_$now in home dir on $server_ip"
#	/usr/bin/ssh -p $port mephius@$server_ip "sudo cp ${conf_path}config/server.conf.php ~/server.conf.php_$now"
#	if [ $? -eq 0 ]; then
		echo "replace server.conf.php on $server_ip"
#		/usr/bin/scp -q -P $port -i /home/mephius/.ssh/id_rsa configs/server.conf.php mephius@$server_ip:${conf_path}config/server.conf.php
		if [ $? -eq 0 ]; then
			res=0
			echo -e "\033[1m\033[34mfile replaced [OK]\033[0m"
		else
			echo -e "\033[1m\033[35m\033[5mfile not replaced [BAD]\033[0m"
		fi
#	fi
#	echo ""     # \n
#	return $res

	echo "create backup ru production.conf.php_$now in home dir on $server_ip"
#	/usr/bin/ssh -p $port mephius@$server_ip "sudo cp ${conf_path}config/ru/production.conf.php ~/ru_production.conf.php_$now"
#	if [ $? -eq 0 ]; then
		echo "replace rc.conf on $server_ip"
#		/usr/bin/scp -q -P $port -i /home/mephius/.ssh/id_rsa configs/ru/production.conf.php mephius@$server_ip:${conf_path}config/ru/production.conf.php
		if [ $? -eq 0 ]; then
			res=0
			echo -e "\033[1m\033[34mfile replaced [OK]\033[0m"
		else
			echo -e "\033[1m\033[35m\033[5mfile not replaced [BAD]\033[0m"
		fi
#	fi
#	echo ""     # \n
#	return $res
	
	echo "create backup kz production.conf.php_$now in home dir on $server_ip"
#	/usr/bin/ssh -p $port mephius@$server_ip "sudo cp ${conf_path}config/kz/production.conf.php ~/kz_production.conf.php_$now"
#	if [ $? -eq 0 ]; then
		echo "replace rc.conf.kz on $server_ip"
#		/usr/bin/scp -q -P $port -i /home/mephius/.ssh/id_rsa configs/kz/production.conf.php mephius@$server_ip:${conf_path}config/kz/production.conf.php
		if [ $? -eq 0 ]; then
			res=0
			echo -e "\033[1m\033[34mfile replaced [OK]\033[0m"
		else
			echo -e "\033[1m\033[35m\033[5mfile not replaced [BAD]\033[0m"
		fi
#	fi
#	echo ""     # \n
	return $res
}

case $op in

    "--copy")

		MESSAGE= /usr/local/bin/php -l /home/mephius/configs/rc.conf.new.php/configs/server.conf.php
		if [ $? -ne 0 ]
			then
				echo "Server.conf error:  $MESSAGE" 1>&2
				exit 1
		fi
		echo "$MESSAGE" 1>&2
		MESSAGE= /usr/local/bin/php -l /home/mephius/configs/rc.conf.new.php/configs/ru/production.conf.php
		if [ $? -ne 0 ]
			then
				echo "Production.conf error: $MESSAGE" 1>&2
				exit 1
		fi
		echo "$MESSAGE" 1>&2

        copy_config '192.168.1.1' 22 $conf_path_www web1.irr.ru > /var/tmp/web1.log && cat /var/tmp/web1.log &
        copy_config '192.168.1.2' 22 $conf_path_www web2.irr.ru > /var/tmp/web2.log && cat /var/tmp/web2.log &
        copy_config '192.168.1.3' 22 $conf_path_www web3.irr.ru > /var/tmp/web3.log && cat /var/tmp/web3.log &
        copy_config '192.168.1.184' 22 $conf_path_www web4.irr.ru > /var/tmp/web4.log && cat /var/tmp/web4.log &
        copy_config '192.168.1.12' 22 $conf_path_www web5.irr.ru > /var/tmp/web5.log && cat /var/tmp/web5.log &
        copy_config '192.168.1.13' 22 $conf_path_www web6.irr.ru > /var/tmp/web6.log && cat /var/tmp/web6.log &
        copy_config '192.168.1.71' 22 $conf_path_www web7.irr.ru > /var/tmp/web7.log && cat /var/tmp/web7.log &
        copy_config '192.168.1.72' 22 $conf_path_www web8.irr.ru > /var/tmp/web8.log && cat /var/tmp/web8.log &
        copy_config '192.168.1.14' 22 $conf_path_www web9.irr.ru > /var/tmp/web9.log && cat /var/tmp/web9.log &
        copy_config '192.168.1.182' 22 $conf_path_www web10.irr.ru > /var/tmp/web10.log && cat /var/tmp/web10.log &
        copy_config '192.168.1.53' 22 $conf_path_www web11.irr.ru > /var/tmp/web11.log && cat /var/tmp/web11.log &
        copy_config '192.168.1.78' 22 $conf_path_www web12.irr.ru > /var/tmp/web12.log && cat /var/tmp/web12.log &
#        copy_config '192.168.1.13' 22 $conf_path_www web13.irr.ru > /var/tmp/web13.log && cat /var/tmp/web13.log &
        copy_config '192.168.1.107' 22 $conf_path_www web14.irr.ru > /var/tmp/web14.log && cat /var/tmp/web14.log &
        copy_config '192.168.1.183' 22 $conf_path_www web15.irr.ru > /var/tmp/web15.log && cat /var/tmp/web15.log &
        copy_config '192.168.1.108' 22 $conf_path_www web16.irr.ru > /var/tmp/web16.log && cat /var/tmp/web16.log &
        copy_config '192.168.1.179' 22 $conf_path_www web17.irr.ru > /var/tmp/web17.log && cat /var/tmp/web17.log &
        copy_config '192.168.1.178' 22 $conf_path_www web18.irr.ru > /var/tmp/web18.log && cat /var/tmp/web18.log &
        copy_config '192.168.1.177' 22 $conf_path_www web19.irr.ru > /var/tmp/web19.log && cat /var/tmp/web19.log &
        copy_config '192.168.1.176' 22 $conf_path_www web20.irr.ru > /var/tmp/web20.log && cat /var/tmp/web20.log &
        copy_config '192.168.1.164' 22 $conf_path_www webbo.irr.ru > /var/tmp/webbo.log && cat /var/tmp/webbo.log &
        copy_config '192.168.1.7' 22 $conf_path_home helper2.irr.ru > /var/tmp/helper2.log && cat /var/tmp/helper2.log &
        copy_config '192.168.1.7' 22 $conf_path_home_kz helper2.irr.ru_kz > /var/tmp/helper2kz.log && cat /var/tmp/helper2kz.log &
        copy_config '192.168.1.52' 22 $conf_path_home helper3.irr.ru > /var/tmp/helper3.log && cat /var/tmp/helper3.log &
        copy_config '192.168.1.11' 22 $conf_path_home cruncher.irr.ru > /var/tmp/cruncher.log && cat /var/tmp/cruncher.log &
        copy_config '192.168.1.8' 22 $conf_path_home helper.irr.ru > /var/tmp/helper.log && cat /var/tmp/helper.log &
       	;;

    "--help")
    	echo "--copy";
    	printf "\tcopy config files to servers";
    	;;

    *)
        echo "Unknown parameter. See --help"
        ;;

esac
