#!/bin/sh

op=$1

copy_config ()
{
    server=$1
    port=$2
    server_name=$3

    echo `date`
    echo "Working with $server_name:"
    echo "remove old irr.ru ..."
    /usr/bin/ssh mephius@$server -p $port "sudo mv /usr/local/www/new.irr.ru /usr/local/www/old.irr.ru"
    echo "mv irr.ru.new in irr.ru ..."
    /usr/bin/ssh mephius@$server -p $port "sudo mv /usr/local/www/irr.ru.new /usr/local/www/new.irr.ru"
    echo "done"
}

case $op in

    "--copy")
	copy_config	'192.168.1.1'	22	web1
	copy_config	'192.168.1.2'	22	web2
	copy_config	'192.168.1.3'	22	web3
#	copy_config	'192.168.1.4'	22	web4
	copy_config	'192.168.1.12'	22	web5
	copy_config	'192.168.1.13'	22	web6
	copy_config	'192.168.1.71'	22	web7
	copy_config	'192.168.1.72'	22	web8
	copy_config	'192.168.1.14'	22	web9
#	copy_config	'192.168.1.39'	22	web10
	copy_config	'192.168.1.53'	22	web11
	copy_config	'192.168.1.78'	22	web12
	copy_config	'192.168.1.164'	22	web13
	copy_config	'192.168.1.107'	22	web14
	copy_config	'192.168.1.178'	22	web18
	copy_config	'192.168.1.177'	22	web19
	copy_config	'192.168.1.176'	22	web20
	copy_config	'192.168.1.163'	22	webbo
	;;
	
    *)
	echo "Unknown parameter. See --help"
	;;

esac