#!/bin/sh

op=$1

copy_config ()
{
    server=$1
    port=$2
    server_name=$3

    echo `date`
    echo "Working with $server_name:"
    echo "remove irr.ru.new ..."
    /usr/bin/ssh mephius@$server -p $port "sudo rm -r /usr/home/mephius/irr.ru.new"
    echo "mkdir irr.ru.new ..."
    /usr/bin/ssh mephius@$server -p $port "sudo mkdir /usr/home/mephius/irr.ru.new; sudo chown -R mephius /usr/home/mephius/irr.ru.new"

    echo "git clone in irr.ru.new ..."
    /usr/bin/ssh mephius@$server -p $port "git clone git@prontosoft.by:irr.ru.git /usr/home/mephius/irr.ru.new"

    echo "git branch release.2012.07.02 ..."
    #/usr/bin/ssh mephius@$server -p $port "cd /usr/local/www/irr.ru.new; sudo -u mephius git branch release.2012.04.01"
    /usr/bin/ssh mephius@$server -p $port "cd /usr/home/mephius/irr.ru.new; git checkout master"

    echo "copy server.conf.php ..."
    /usr/bin/ssh mephius@$server -p $port "cp /usr/home/mephius/irr.ru/config/server.conf.php /usr/home/mephius/irr.ru.new/config/server.conf.php"

    echo "ln -s img ..."
    /usr/bin/ssh mephius@$server -p $port "ln -s /home/mephius/img /usr/home/mephius/irr.ru.new/html/img"

    echo "chmod project folders ..."
    /usr/bin/ssh mephius@$server -p $port "cd /usr/home/mephius/irr.ru.new; sudo chmod -R 777 cache logs utils/irr.ru/files html/img"

    echo "ln -s xls_files ..."
    /usr/bin/ssh mephius@$server -p $port "ln -s /usr/local/www/xls_files /usr/home/mephius/irr.ru.new/html/site/files/xls_files"

}

case $op in

    "--copy")
#	copy_config	'192.168.1.8'	22	helper
#	copy_config	'192.168.1.11'	22	cruncher
#	copy_config	'192.168.1.7'	22	helper2
#	copy_config	'192.168.1.52'	22	helper3
	copy_config	'192.168.1.77'	22	helper4
	;;
	
    *)
	echo "Unknown parameter. See --help"
	;;

esac