#!/bin/sh
echo "IRR.RU Test init"

echo "Updating web1..."
#/usr/bin/ssh mephius@192.168.1.1 -p2822 "cd /usr/local/www/irr.ru; sudo /usr/local/bin/git pull"

echo "Updating web3..."
/usr/bin/ssh mephius@192.168.1.3 -p22 "cd /usr/local/www/irr.ru; sudo /usr/local/bin/git reset HEAD~1"

echo "Updating web4..."
/usr/bin/ssh mephius@192.168.1.4 -p22 "cd /usr/local/www/irr.ru; sudo /usr/local/bin/git reset HEAD~1"

echo "Updating web5..."
/usr/bin/ssh mephius@192.168.1.12 "cd /usr/local/www/irr.ru; sudo /usr/local/bin/git reset HEAD~1"

echo "Updating web6..."
/usr/bin/ssh mephius@192.168.1.13 "cd /usr/local/www/irr.ru; sudo /usr/local/bin/git reset HEAD~1"

echo "Updating web7..."
/usr/bin/ssh mephius@192.168.1.71 "cd /usr/local/www/irr.ru; sudo /usr/local/bin/git reset HEAD~1"

echo "Updating web8..."
/usr/bin/ssh mephius@192.168.1.72 "cd /usr/local/www/irr.ru; sudo /usr/local/bin/git reset HEAD~1"

echo "Updating web9..."
/usr/bin/ssh mephius@192.168.1.73 "cd /usr/local/www/irr.ru; sudo /usr/local/bin/git reset HEAD~1"

echo "Updating webbo..."
/usr/bin/ssh mephius@192.168.1.163 "cd /usr/local/www/irr.ru; sudo /usr/local/bin/git reset HEAD~1"

echo "Updating helper2..."
/usr/bin/ssh mephius@192.168.1.11 -p22 "cd /usr/home/mephius/irr.ru; sudo /usr/local/bin/git reset HEAD~1"

echo "Updating helper3..."
/usr/bin/ssh mephius@192.168.1.74 "cd /usr/home/mephius/irr.ru; sudo /usr/local/bin/git reset HEAD~1"

echo "Updating helper..."
cd /usr/home/mephius/irr.ru; sudo /usr/local/bin/git reset HEAD~1

echo "Updating web2..."
/usr/bin/ssh mephius@192.168.1.2 -p22 "cd /usr/local/www/irr.ru; sudo /usr/local/bin/git reset HEAD~1"


