#!/bin/sh

#	copy server.conf.php to all servers
#       run it script from mephius user
#		from helper server
#		file server.conf.php must have owner mephius

op=$1
now=`date "+%Y-%m-%d_%H:%M:%S"`	# use in functions
conf_path_www='/usr/local/www/new.irr.ru/'
conf_path_home='/usr/home/mephius/irr.ru/'
conf_path_home_debian='/home/mephius/irr.ru/'
conf_path_home_kz='/usr/home/mephius/irr.kz/'

current_path=$(pwd)

copy_config ()
{
	server_ip=$1
	port=$2
	conf_path=$3
	res=1       # error
	echo -e "\033[1m\033[34m\tCopy to $4\033[0m"
	echo "create backup server.conf.php_$now in home dir on $server_ip"
	/usr/bin/ssh -p $port mephius@$server_ip "sudo cp ${conf_path}config/server.conf.php ~/server.conf.php_BACKUP"
#	if [ $? -eq 0 ]; then
		echo "replace server.conf.php on $server_ip"
		/usr/bin/scp -q -P $port -i /home/mephius/.ssh/id_rsa configs/server.conf.php mephius@$server_ip:${conf_path}config/server.conf.php
		if [ $? -eq 0 ]; then
			res=0
			echo -e "file replaced: \033[1m\033[34m[OK]\033[0m"
		else
			echo -e "file not replaced: \033[1m\033[31m\033[5m[BAD]\033[0m"
		fi
#	fi
	echo ""     # \n
#	return $res

	echo "create backup ru production.conf.php_$now in home dir on $server_ip"
	/usr/bin/ssh -p $port mephius@$server_ip "sudo cp ${conf_path}config/ru/production.conf.php ~/ru_production.conf.php_BACKUP"
#	if [ $? -eq 0 ]; then
		echo "replace rc.conf on $server_ip"
		/usr/bin/scp -q -P $port -i /home/mephius/.ssh/id_rsa configs/ru/production.conf.php mephius@$server_ip:${conf_path}config/ru/production.conf.php
		if [ $? -eq 0 ]; then
			res=0
			echo -e "file replaced: \033[1m\033[34m[OK]\033[0m"
		else
			echo -e "file not replaced: \033[1m\033[31m\033[5m[BAD]\033[0m"
		fi
#	fi
	echo ""     # \n
#	return $res
	
	echo "create backup kz production.conf.php_$now in home dir on $server_ip"
	/usr/bin/ssh -p $port mephius@$server_ip "sudo cp ${conf_path}config/kz/production.conf.php ~/kz_production.conf.php_BACKUP"
#	if [ $? -eq 0 ]; then
		echo "replace rc.conf.kz on $server_ip"
		/usr/bin/scp -q -P $port -i /home/mephius/.ssh/id_rsa configs/kz/production.conf.php mephius@$server_ip:${conf_path}config/kz/production.conf.php
		if [ $? -eq 0 ]; then
			res=0
			echo -e "file replaced: \033[1m\033[34m[OK]\033[0m"
		else
			echo -e "file not replaced: \033[1m\033[31m\033[5m[BAD]\033[0m"
		fi
#	fi
	echo ""     # \n
	return $res
}

copy_local_config ()
{
	server_ip=$1
	port=$2
	conf_path=$3
	res=1       # error
	echo -e "\033[1m\033[34m\tCopy to $4\033[0m"
	echo "create backup server.conf.php_$now in home dir on $server_ip"
	cp ${conf_path}config/server.conf.php ~/server.conf.php_BACKUP
	if [ $? -eq 0 ]; then
		echo "replace server.conf.php on $server_ip"
		cp configs/server.conf.php ${conf_path}config/server.conf.php
		if [ $? -eq 0 ]; then
			res=0
			echo -e "file replaced: \033[1m\033[34m[OK]\033[0m"
		else
			echo -e "file not replaced: \033[1m\033[31m\033[5m[BAD]\033[0m"
		fi
	fi
	echo ""     # \n
#	return $res

	echo "create backup ru production.conf.php_$now in home dir on $server_ip"
	cp ${conf_path}config/ru/production.conf.php ~/ru_production.conf.php_BACKUP
#	if [ $? -eq 0 ]; then
		echo "replace ru production.conf.php on $server_ip"
		cp configs/ru/production.conf.php ${conf_path}config/ru/production.conf.php
		if [ $? -eq 0 ]; then
			res=0
			echo -e "file replaced: \033[1m\033[34m[OK]\033[0m"
		else
			echo -e "file not replaced: \033[1m\033[31m\033[5m[BAD]\033[0m"
		fi
#	fi
	echo ""     # \n
#	return $res
	
	echo "create backup kz production.conf.php_$now in home dir on $server_ip"
	cp ${conf_path}config/kz/production.conf.php ~/kz_production.conf.php_BACKUP
#	if [ $? -eq 0 ]; then
		echo "replace kz production.conf.php on $server_ip"
		cp configs/kz/production.conf.php ${conf_path}config/kz/production.conf.php
		if [ $? -eq 0 ]; then
			res=0
			echo -e "file replaced: \033[1m\033[34m[OK]\033[0m"
		else
			echo -e "file not replaced: \033[1m\033[31m\033[5m[BAD]\033[0m"
		fi
#	fi
	echo ""     # \n
	return $res
}

copy_js_config ()
{
	server_ip=$1
	port=$2
	conf_path=$3
	res=1       # error
	echo -e "\033[1m\033[34m\tCopy to $4\033[0m"
	echo "replace account.conf.js on $server_ip"
	/usr/bin/scp -q -P $port -i /home/mephius/.ssh/id_rsa account.conf.js mephius@$server_ip:${conf_path}html/account/js/account.conf.js
	if [ $? -eq 0 ]; then
		res=0
		echo -e "file replaced: \033[1m\033[34m[OK]\033[0m"
	else
		echo -e "file not replaced: \033[1m\033[31m\033[5m[BAD]\033[0m"
	fi

	echo ""     # \n
	return $res
}

case $op in

    "--copy")

		MESSAGE= /usr/local/bin/php -l configs/server.conf.php
		if [ $? -ne 0 ]
			then
				echo "Server.conf error:  $MESSAGE" 1>&2
				exit 1
		fi

		echo "$MESSAGE" 1>&2
		
#		MESSAGE= /usr/local/bin/php -l configs/kz/production.conf.php
#		if [ $? -ne 0 ]
#			then
#				echo "$MESSAGE" 1>&2
#				exit 1
#		fi

#		echo "$MESSAGE" 1>&2
		
		MESSAGE= /usr/local/bin/php -l configs/ru/production.conf.php
		if [ $? -ne 0 ]
			then
				echo "Production.conf error: $MESSAGE" 1>&2
				exit 1
		fi

		echo "$MESSAGE" 1>&2

		copy_config '192.168.1.1' 22 $conf_path_www		web1	# balancer
		copy_config '192.168.1.2' 22 $conf_path_www		web2	# static
		#        copy_config '192.168.1.3' 22 $conf_path_www		web3	# balancer1
		copy_config '192.168.1.184' 22 $conf_path_www		web4	# static
		#        copy_config '192.168.1.12' 22 $conf_path_www		web5	# php
		copy_config '192.168.1.13' 22 $conf_path_www		web6	# php
		copy_config '192.168.1.71' 22 $conf_path_www		web7	# php
		copy_config '192.168.1.72' 22 $conf_path_www		web8	# php
		copy_config '192.168.1.14' 22 $conf_path_www		web9	# php
		copy_config '192.168.1.182' 22 $conf_path_www		web10
		copy_config '192.168.1.53' 22 $conf_path_www		web11	# php
		copy_config '192.168.1.78' 22 $conf_path_www		web12	# php
		copy_config '192.168.1.30' 22 $conf_path_www		web13	# css,js
		copy_config '192.168.1.107' 22 $conf_path_www		web14	# static
		copy_config '192.168.1.183' 22 $conf_path_www		web15	# static
		copy_config '192.168.1.108' 22 $conf_path_www		web16	# static
		copy_config '192.168.1.179' 22 $conf_path_www		web17	# static
		copy_config '192.168.1.178' 22 $conf_path_www		web18	# php
		copy_config '192.168.1.177' 22 $conf_path_www		web19	# php
		copy_config '192.168.1.176' 22 $conf_path_www		web20	# php
		copy_config '192.168.1.164' 22 $conf_path_www		webbo	# php
		copy_local_config '192.168.1.8' 22 $conf_path_home	helper
		copy_config '192.168.1.11' 22 $conf_path_home		cruncher
		copy_config '192.168.1.7' 22 $conf_path_home		helper2
		## helper2 replaced by web17
		#copy_config '192.168.1.179' 22 $conf_path_home		helper2-web17
		#copy_config '192.168.1.179' 22 $conf_path_home_kz	helper2kz-web17kz
		copy_config '192.168.1.7' 22 $conf_path_home_kz		helper2kz
		copy_config '192.168.1.165' 22 $conf_path_home		helper3
		copy_config '192.168.1.77' 22 $conf_path_home		helper4

	;;

	"--copyjs")
		# run builder
		$current_path/account_config_builder.php --path "$current_path/configs/ru/"
		copy_js_config '192.168.1.1' 22 $conf_path_www web1	# balancer1 web1
		copy_js_config '192.168.1.2' 22 $conf_path_www web2	# balancer2 web2
		copy_js_config '192.168.1.30' 22 $conf_path_www web13	# css,js
		echo -e "\033[1m\033[34m\tRemove temporary config file\033[0m"
		rm -f account.conf.js
	;;

    "--help")
		echo "--copy";
		printf "\tcopy config files to servers";
    ;;

	*)
		echo "Unknown parameter. See --help"
	;;

esac
