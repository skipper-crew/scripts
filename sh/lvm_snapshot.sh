#!/bin/sh

#if [ -f /mysql_backup/sslite_`date +%Y-%m-%d -d '3 day ago'`.tgz ]
#    then
#	tail -n 1 /home/scripts/snapshot.log | mail -s "Old backups was'n removed from db4 server!!!" skipper@prontosoft.by imatsiuk@prontosoft.by
#fi

DATE=`date +%Y-%m-%d`
OLD_DATE=`date +%Y-%m-%d -d '5 day ago'`
SNAPSHOT_SIZE=20G
SNAP_NAME=sslite_${DATE}
OLD_SNAP_NAME=sslite_${OLD_DATE}

/usr/bin/mysql --user=root --password=ghjynjcjandb -e "FLUSH TABLES WITH READ LOCK;"
echo "step 1 lock db on `date`"
/sbin/lvcreate --size 20G --snapshot --name sslite /dev/mysql-db4/mysql-data
echo "step 3 snapshot created on `date`"
/usr/bin/mysql --user=root --password=ghjynjcjandb -e "UNLOCK TABLES;"
echo "step 4 unlock db on `date`"

mkdir /mnt/backupdb
mount /dev/mysql-db4/sslite /mnt/backupdb
tar -zcf /mysql_backup/${SNAP_NAME}.tgz /mnt/backupdb
umount /mnt/backupdb

/sbin/lvremove -f /dev/mysql-db4/sslite
rmdir /mnt/backupdb
echo "step 6 snapshot removed on `date`"

echo "`date` moving to ftp"
FILE_NAME=${SNAP_NAME}.tgz
OLD_FILE_NAME=${OLD_SNAP_NAME}.tgz
cd /mysql_backup
HOST='192.168.1.207'
USER='irr'
PASSWD='EiK8fei8'
ftp -nv <<EOF
open $HOST
user $USER $PASSWD
put $FILE_NAME
delete ${OLD_FILE_NAME}
EOF
echo "`date`copy backup complete"
echo "-------"

find /mysql_backup/* -mtime +1 -exec rm {} \;

