#!/bin/sh

op=$1
echo "IRR.RU Restart php-fpm"
case $op in

    "--restart")

	    echo -e "\033[33m Restarting php-fpm web1...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.1 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web2...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.2 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web3...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.3 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web4...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.184 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

#	    echo -e "\033[33m Restarting php-fpm web5...\033[0m"
#	    /usr/bin/ssh mephius@192.168.1.12 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web6...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.13 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web7...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.71 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web8...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.72 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web9...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.14 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web10...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.182 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web11...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.53 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"
	    
	    echo -e "\033[33m Restarting php-fpm web12...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.78 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web13...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.30 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web14...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.107 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web15...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.183 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web16...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.108 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web17...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.179 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web18...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.178 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web19...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.177 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm web20...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.176 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    echo -e "\033[33m Restarting php-fpm webbo...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.164 -p22 "sudo /usr/local/etc/rc.d/php-fpm restart"

	    ;;
	
	"--help")
	    echo "--restart";
	    printf "\tcopy config files to servers";
	    ;;
	                
	*)
	    echo "Unknown parameter. See --help"
	    ;;
esac
