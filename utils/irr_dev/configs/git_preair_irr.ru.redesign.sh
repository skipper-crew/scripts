#!/bin/sh

op=$1

copy_config ()
{
    server=$1
    port=$2
    server_name=$3

    echo `date`
    echo "Working with $server_name:"
#    echo "remove new.irr.ru ..."
#    /usr/bin/ssh mephius@$server -p $port "sudo rm -r /usr/local/www/new.irr.ru"
    echo "mkdir new1.irr.ru ..."
    /usr/bin/ssh mephius@$server -p $port "sudo mkdir /usr/local/www/new1.irr.ru; sudo chown -R mephius /usr/local/www/new1.irr.ru"

    echo "git clone in new1.irr.ru ..."
    /usr/bin/ssh mephius@$server -p $port "git clone git@prontosoft.by:irr.ru.git /usr/local/www/new1.irr.ru"

    echo "git branch  release.2013.08.02  ..."
    #/usr/bin/ssh mephius@$server -p $port "cd /usr/local/www/new.irr.ru; sudo -u mephius git branch release.2013.07.02"
    /usr/bin/ssh mephius@$server -p $port "cd /usr/local/www/new1.irr.ru; git checkout master "

    echo "copy server.conf.php ..."
    /usr/bin/ssh mephius@$server -p $port "cp /usr/local/www/irr.ru/config/server.conf.php /usr/local/www/new1.irr.ru/config/server.conf.php"

    echo "ln -s img ..."
    /usr/bin/ssh mephius@$server -p $port "ln -s /usr/local/www/img /usr/local/www/new1.irr.ru/html/img"

    echo "chmod project folders ..."
    /usr/bin/ssh mephius@$server -p $port "cd /usr/local/www/new1.irr.ru; sudo chmod -R 777 cache logs utils/irr.ru/files html/img"

    echo "ln -s xls_files ..."
    /usr/bin/ssh mephius@$server -p $port "ln -s /usr/local/www/xls_files /usr/local/www/new1.irr.ru/html/site/files/xls_files"

}

case $op in

    "--copy")
#	copy_config	'192.168.1.1'	22	web1
#	copy_config	'192.168.1.2'	22	web2
	copy_config	'192.168.1.3'	22	web3
#	copy_config	'192.168.1.184'	22	web4
#	copy_config	'192.168.1.12'	22	web5
#	copy_config	'192.168.1.13'	22	web6
#	copy_config	'192.168.1.71'	22	web7
#	copy_config	'192.168.1.72'	22	web8
#	copy_config	'192.168.1.14'	22	web9
#	copy_config	'192.168.1.182'	22	web10
#	copy_config	'192.168.1.53'	22	web11
#	copy_config	'192.168.1.78'	22	web12
#	copy_config	'192.168.1.164'	22	web13
#	copy_config	'192.168.1.107'	22	web14
#	copy_config	'192.168.1.183'	22	web15
#	copy_config	'192.168.1.178'	22	web18
#	copy_config	'192.168.1.176'	22	web20
#	copy_config	'192.168.1.163'	22	webbo
	;;
	
    *)
	echo "Unknown parameter. See --help"
	;;

esac