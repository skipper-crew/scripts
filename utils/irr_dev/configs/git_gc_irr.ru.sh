#!/bin/sh

op=$1
echo "new.irr.ru Test init"
case $op in

    "--update")

	    echo -e "\033[33m Updating web1...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.1 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

	    echo -e "\033[33m Updating web2...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.2 -p2822 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

            echo -e "\033[33m Updating web3...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.3 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

	    echo -e "\033[33m Updating web4...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.184 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

	    echo -e "\033[33m Updating web5...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.12 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

	    echo -e "\033[33m Updating web6...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.13 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

	    echo -e "\033[33m Updating web7...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.71 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

	    echo -e "\033[33m Updating web8...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.72 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"
	    
	    echo -e "\033[33m Updating web9...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.14 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

	    echo -e "\033[33m Updating web10...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.182 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

	    echo -e "\033[33m Updating web11...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.53 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

	    echo -e "\033[33m Updating web12...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.78 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

	    echo -e "\033[33m Updating web13...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.164 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"
	    
	    echo -e "\033[33m Updating web14...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.107 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"
	    
	    echo -e "\033[33m Updating web15...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.183 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

	    echo -e "\033[33m Updating web16...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.108 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

	    echo -e "\033[33m Updating web17...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.179 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"
	    
	    echo -e "\033[33m Updating web18...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.178 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"
	    
	    echo -e "\033[33m Updating web19...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.177 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"
	    
	    echo -e "\033[33m Updating web20...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.176 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"
	    
	    echo -e "\033[33m Updating webbo...\033[0m"
	    /usr/bin/ssh mephius@192.168.1.164 -p22 "cd /usr/local/www/new.irr.ru; /usr/local/bin/git gc"

           echo -e "\033[33m Updating helper2 [irr.ru]...\033[0m"
           /usr/bin/ssh mephius@192.168.1.7 -p22 "cd /home/mephius/irr.ru; /usr/local/bin/git gc"

           echo -e "\033[33m Updating helper2 [irr.kz]...\033[0m"
           /usr/bin/ssh mephius@192.168.1.7 -p22 "cd /home/mephius/irr.kz; /usr/local/bin/git gc"

           echo -e "\033[33m Updating cruncher...\033[0m"
           /usr/bin/ssh mephius@192.168.1.11 -p22 "cd /home/mephius/irr.ru; /usr/local/bin/git gc"
           
           echo -e "\033[33m Updating helper3...\033[0m"
           cd /home/mephius/irr.ru
           sudo -u mephius /usr/local/bin/git gc

	    ;;
	
	"--help")
	    echo "--copy";
	    printf "\tcopy config files to servers";
	    ;;
	                
	*)
	    echo "Unknown parameter. See --help"
	    ;;
esac
