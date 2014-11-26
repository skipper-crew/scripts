#!/bin/sh

op=$1
#tmp=`cat /home/skipper/scripts/sh/key`
command="ps auxww | grep syslog-ng"
#command="ls /usr/local/www/new.irr.ru/utils/irr.ru/files/ | grep IRR"
#command_0="sudo mkdir /usr/local/etc/zabbix22/scripts"
#command_1="sudo chown -R mephius /usr/local/etc/zabbix22"
#command_2="sudo chown -R root /usr/local/etc/zabbix22"
#command="uname -a"

exec_command ()
{
    server_ip=$1
    port=$2
    server_name=$3
    echo -e "\033[33m Execing command for $server_name...\033[0m"
    /usr/bin/ssh mephius@$server_ip -p $port "$command"
#    /usr/bin/ssh mephius@$server_ip -p $port "$command_1"
#    /usr/bin/scp -q -P 22 -i /home/mephius/.ssh/id_rsa /home/skipper/userparameter_fcgi.conf mephius@$server_ip:/usr/local/etc/zabbix22/zabbix_agentd.conf.d/userparameter_fcgi.conf
#    /usr/bin/scp -q -P 22 -i /home/mephius/.ssh/id_rsa /home/skipper/zabbix-disk/userparameter_disk.conf mephius@$server_ip:/usr/local/etc/zabbix22/zabbix_agentd.conf.d/userparameter_disk.conf
#    /usr/bin/ssh mephius@$server_ip -p $port "$command_2"
}

exec_command_h ()
{
    server_name=$1
    echo -e "\033[33m Execing command for $server_name...\033[0m"
    $command

}

case $op in

    "--exec")
            exec_command '192.168.1.1'		22	web1		# FreeBSD
            exec_command '192.168.1.2'		22	web2		# FreeBSD
            exec_command '192.168.1.3'		22	web3		# FreeBSD
            exec_command '192.168.1.184'	22	web4		# FreeBSD
            exec_command '192.168.1.12'		22	web5		# FreeBSD
            exec_command '192.168.1.13'		22	web6		# FreeBSD
            exec_command '192.168.1.71'		22	web7		# FreeBSD
            exec_command '192.168.1.72'		22	web8		# FreeBSD
            exec_command '192.168.1.14'		22	web9		# FreeBSD
            exec_command '192.168.1.182'	22	web10		# FreeBSD
            exec_command '192.168.1.53'		22	web11		# FreeBSD
            exec_command '192.168.1.78'		22	web12		# FreeBSD
            exec_command '192.168.1.30'		22	web13		# FreeBSD
            exec_command '192.168.1.107'	22	web14		# FreeBSD
            exec_command '192.168.1.183'	22	web15		# FreeBSD
            exec_command '192.168.1.108'	22	web16		# FreeBSD
            exec_command '192.168.1.179'	22	web17		# FreeBSD
            exec_command '192.168.1.178'	22	web18		# FreeBSD
            exec_command '192.168.1.177'	22	web19		# FreeBSD
            exec_command '192.168.1.176'	22	web20		# FreeBSD
            exec_command '192.168.1.164'	22	webbo		# FreeBSD
#            exec_command '192.168.1.28'		22	sphinx_import	# FreeBSD
            exec_command_h				helper		# FreeBSD
            exec_command '192.168.1.7'		22	helper2		# FreeBSD
            exec_command '192.168.1.165'	22	helper3		# FreeBSD
            exec_command '192.168.1.77'		22	helper4		# FreeBSD
            exec_command '192.168.1.11'		22	cruncher	# FreeBSD
#            exec_command '192.168.1.5'		22	dotnet		# Windows
#            exec_command '192.168.1.181'	22	db1		# Debian
#            exec_command '192.168.1.171'	22	db2		# Debian
#            exec_command '192.168.1.6'		22	db3		# Debian
#            exec_command '192.168.1.188'	22	db4		# Debian
#            exec_command '192.168.1.168'	22	db5		# Debian
#            exec_command '192.168.1.165'	22	db6		# Debian
#            exec_command '192.168.1.76'		22	db7		# Debian
#            exec_command '192.168.1.75'		22	db8		# Debian
#            exec_command '192.168.1.103'	22	db9		# Debian

#            exec_command '192.168.1.187'	22	db11		# Debian
#            exec_command '192.168.1.185'	22	db12		# Debian
#            exec_command '192.168.1.80'		22	db13		# Debian
#            exec_command '192.168.1.105'	22	db14		# Debian
#            exec_command '192.168.1.180'	22	db15		# Debian
#            exec_command '192.168.1.74'		22	db16		# Debian
#            exec_command '192.168.1.173'	22	dbkz		# Debian
#            exec_command '192.168.1.10'	22	search		# FreeBSD
#            exec_command '192.168.1.67'		22	filter1		# Debian
#            exec_command '192.168.1.61'		22	filter3		# Debian
#            exec_command '192.168.1.63'		22	filter4		# Debian
#            exec_command '192.168.1.66'		22	filter5		# Debian
#            exec_command '192.168.1.68'		22	filter6		# Debian
#            exec_command '192.168.1.64'		22	filter7		# Debian
#            exec_command '192.168.1.65'		22	filter8		# Debian
#            exec_command '192.168.1.73'		22	fulltext1	# Debian
#            exec_command '192.168.1.69'		22	fulltext2	# Debian
#            exec_command '192.168.1.79'		22	fulltext3	# Debian
#            exec_command '192.168.1.9'		22	cache		# FreeBSD
#            exec_command '192.168.1.167'	22	catalog		# FreeBSD
#            exec_command '192.168.1.34'	22	wap		# FreeBSD
#            exec_command '192.168.1.59'	22	content		# FreeBSD
#            exec_command '192.168.1.60'		22	dbcontent	# Debian
#            exec_command '192.168.1.166'	22	web1test	# FreeBSD
#            exec_command '192.168.1.169'	22	web2test	# FreeBSD
#            exec_command '192.168.1.47'		22	db3test		# Debian
#            exec_command '192.168.1.48'		22	db4test		# Debian
#            exec_command '192.168.1.36'		22	automoderation	# Debian
#            exec_command '192.168.1.51'		22	suggest1	# Debian
#            exec_command '192.168.1.106'	22	sphinx		# Debian
#            exec_command '192.168.1.170'	22	filter1new	# Debian
#            exec_command '192.168.1.171'	22	filter2new	# rezerv
#            exec_command '192.168.1.172'	22	rediscounters	# Debian
#            exec_command '192.168.1.174'	22	redis		# Debian
#            exec_command '192.168.1.175'	22	pgsql		# Debian
#            exec_command '192.168.1.4'		22	dbbalancer	# Debian
            ;;

    "--exec-freebsd")
            exec_command '192.168.1.3'		22	balancer1	# FreeBSD
            exec_command '192.168.1.9'		22	balancer2	# FreeBSD
            exec_command '192.168.1.1'		22	web1		# FreeBSD
            exec_command '192.168.1.2'		22	web2		# FreeBSD
            exec_command '192.168.1.184'	22	web4		# FreeBSD
            exec_command '192.168.1.12'	22	web5		# FreeBSD
            exec_command '192.168.1.13'	22	web6		# FreeBSD
            exec_command '192.168.1.71'	22	web7		# FreeBSD
            exec_command '192.168.1.72'	22	web8		# FreeBSD
            exec_command '192.168.1.14'	22	web9		# FreeBSD
            exec_command '192.168.1.182'	22	web10		# FreeBSD
            exec_command '192.168.1.53'	22	web11		# FreeBSD
            exec_command '192.168.1.78'	22	web12		# FreeBSD
            exec_command '192.168.1.30'	22	web13		# FreeBSD
            exec_command '192.168.1.107'	22	web14		# FreeBSD
            exec_command '192.168.1.183'	22	web15		# FreeBSD
            exec_command '192.168.1.108'	22	web16		# FreeBSD
            exec_command '192.168.1.179'	22	web17		# FreeBSD
            exec_command '192.168.1.178'	22	web18		# FreeBSD
            exec_command '192.168.1.177'	22	web19		# FreeBSD
            exec_command '192.168.1.176'	22	web20		# FreeBSD
            exec_command '192.168.1.164'	22	webbo		# FreeBSD
#            exec_command '192.168.1.28'	22	sphinx_import	# FreeBSD
#            exec_command_h				helper		# FreeBSD
#            exec_command '192.168.1.7'		22	helper2		# FreeBSD
            exec_command '192.168.1.165'	22	helper3		# FreeBSD
            exec_command '192.168.1.77'	22	helper4		# FreeBSD
            exec_command '192.168.1.11'	22	cruncher	# FreeBSD
#            exec_command '192.168.1.5'		22	dotnet		# Windows
            exec_command '192.168.1.167'	22	catalog		# FreeBSD
            exec_command '192.168.1.34'	22	wap		# FreeBSD
            exec_command '192.168.1.59'	22	content		# FreeBSD
            exec_command '192.168.1.166'	22	web1test	# FreeBSD
            exec_command '192.168.1.169'	22	web2test	# FreeBSD
            ;;

    "--exec-debian")
            exec_command '192.168.1.181'	22	db1		# Debian
            exec_command '192.168.1.171'	22	db2		# Debian
            exec_command '192.168.1.6'		22	db3		# Debian
            exec_command '192.168.1.188'	22	db4		# Debian
            exec_command '192.168.1.168'	22	db5		# Debian
#            exec_command '192.168.1.165'	22	db6		# Debian
            exec_command '192.168.1.76'		22	db7		# Debian
            exec_command '192.168.1.75'		22	db8		# Debian
            exec_command '192.168.1.103'	22	db9		# Debian
            exec_command '192.168.1.104'	22	db10		# Debian
            exec_command '192.168.1.187'	22	db11		# Debian
            exec_command '192.168.1.185'	22	db12		# Debian
            exec_command '192.168.1.80'		22	db13		# Debian
            exec_command '192.168.1.105'	22	db14		# Debian
            exec_command '192.168.1.180'	22	db15		# Debian
            exec_command '192.168.1.74'		22	db16		# Debian
            exec_command '192.168.1.189'	22	db17		# Debian
            exec_command '192.168.1.173'	22	dbkz		# Debian
            exec_command '192.168.1.67'		22	filter1		# Debian
            exec_command '192.168.1.61'		22	filter3		# Debian
            exec_command '192.168.1.63'		22	filter4		# Debian
            exec_command '192.168.1.66'		22	filter5		# Debian
            exec_command '192.168.1.68'		22	filter6		# Debian
            exec_command '192.168.1.64'		22	filter7		# Debian
#            exec_command '192.168.1.65'		22	filter8		# Debian
            exec_command '192.168.1.73'		22	fulltext1	# Debian
            exec_command '192.168.1.69'		22	fulltext2	# Debian
            exec_command '192.168.1.79'		22	fulltext3	# Debian
            exec_command '192.168.1.104'	22	fulltext4	# Debian
            exec_command '192.168.1.60'		22	dbcontent	# Debian
            exec_command '192.168.1.47'		22	db3test		# Debian
            exec_command '192.168.1.48'		22	db4test		# Debian
            exec_command '192.168.1.36'		22	automoderation	# Debian
            exec_command '192.168.1.51'		22	suggest1	# Debian
            exec_command '192.168.1.106'	22	sphinx		# Debian
            exec_command '192.168.1.170'	22	filter1new	# Debian
            exec_command '192.168.1.172'	22	rediscounters	# Debian
            exec_command '192.168.1.174'	22	redis		# Debian
            exec_command '192.168.1.175'	22	pgsql		# Debian
            exec_command '192.168.1.4'		22	db1.balancer	# Debian
            exec_command '192.168.1.10'		22	db2.balancer	# Debian
            ;;

    *)
            echo "Unknown parameter. See --help"
            ;;

esac


#echo -e "\033[33m Execing command for  helper...\033[0m"
#$command

