#!/bin/sh
echo -e "IRR.RU Regions updating"
echo -e "\033[33m Updating web1\033[0m..."
/usr/bin/ssh mephius@192.168.1.1 -p22 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web2\033[0m..."
/usr/bin/ssh mephius@192.168.1.2 -p22 "sudo /usr/bin/svn up --username mephius /usr/local/www/xls_files/"

#echo -e "\033[33m Updating web3\033[0m..."
#/usr/bin/ssh mephius@192.168.1.3 -p22 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

#echo -e "\033[33m Updating web4\033[0m..."
#/usr/bin/ssh mephius@192.168.1.4 -p22 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

#echo -e "\033[33m Updating web5\033[0m..."
#/usr/bin/ssh mephius@192.168.1.12 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web6\033[0m..."
/usr/bin/ssh mephius@192.168.1.13 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web7\033[0m..."
/usr/bin/ssh mephius@192.168.1.71 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web8\033[0m..."
/usr/bin/ssh mephius@192.168.1.72 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web9\033[0m..."
/usr/bin/ssh mephius@192.168.1.14 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web10\033[0m..."
/usr/bin/ssh mephius@192.168.1.182 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web11\033[0m..."
/usr/bin/ssh mephius@192.168.1.53 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web12\033[0m..."
/usr/bin/ssh mephius@192.168.1.78 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

#echo -e "\033[33m Updating web13\033[0m..."
#/usr/bin/ssh mephius@192.168.1.164 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web14\033[0m..."
/usr/bin/ssh mephius@192.168.1.107 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web15\033[0m..."
/usr/bin/ssh mephius@192.168.1.183 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web16\033[0m..."
/usr/bin/ssh mephius@192.168.1.108 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web17\033[0m..."
/usr/bin/ssh mephius@192.168.1.179 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web18\033[0m..."
/usr/bin/ssh mephius@192.168.1.178 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web19\033[0m..."
/usr/bin/ssh mephius@192.168.1.177 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating web20\033[0m..."
/usr/bin/ssh mephius@192.168.1.176 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"

echo -e "\033[33m Updating webbo\033[0m..."
/usr/bin/ssh mephius@192.168.1.164 "sudo /usr/local/bin/svn up --username mephius /usr/local/www/xls_files/"


echo -e "Finished"