#!/bin/sh

echo "Updating christopher..."
/usr/bin/ssh mephius@192.168.1.59 -p22 "cd /usr/local/www/christopher_new; /usr/local/bin/git pull"

