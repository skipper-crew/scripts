#!/bin/bash

op=$1
DATE=`date +%Y-%m-%d`
OLD_DATE=`date +%Y-%m-%d -d '14 day ago'`

full ()
{
    echo "*** `date`: starting full backup"
    innobackupex --defaults-file=/etc/mysql/my.cnf --password='ghjynjcjandb' --no-timestamp --slave-info /mysql_xtrabackup/full
    echo "*** `date`: apply logs"
    innobackupex --apply-log --redo-only --defaults-file=/etc/mysql/my.cnf --password='ghjynjcjandb' --no-timestamp --slave-info /mysql_xtrabackup/full
    cd /mysql_xtrabackup/
    echo "*** `date`: creating tar file"
    tar cfz /mysql_xtrabackup/mysql-full-dump-$DATE.tar.gz ./full
    echo "*** `date`: copy to ftp"
    FILE_NAME=mysql-full-dump-$DATE.tar.gz
    OLD_FILE_NAME=mysql-full-dump-$OLD_DATE.tar.gz
    HOST='192.168.1.207'
    USER='irr'
    PASSWD='EiK8fei8'

ftp -nv <<EOF
open $HOST
user $USER $PASSWD
cd mysql-xtrabackup
put $FILE_NAME
delete ${OLD_FILE_NAME}
EOF

    echo "*** `date`: copy to isilon"
    mv /mysql_xtrabackup/mysql-full-dump-$DATE.tar.gz /mysql_backup_isi-storage/mysql-full-dump-$DATE.tar.gz
    echo "*** `date`: removing 14 days old backup"
    rm /mysql_backup_isi-storage/mysql-full-dump-$OLD_DATE.tar.gz
    rm -r /mysql_xtrabackup/full
}

inc ()
{
    rm -r /mysql_xtrabackup/inc
    mkdir /mysql_xtrabackup/inc-$DATE
    echo "*** `date`: starting incremental backup"
    innobackupex --incremental /mysql_xtrabackup/inc-$DATE/ --incremental-basedir=/mysql_xtrabackup/full/ --defaults-file=/etc/mysql/my.cnf --password='ghjynjcjandb' --no-timestamp --slave-info
    echo "*** `date`: apply logs"
    innobackupex --apply-log /mysql_xtrabackup/inc-$DATE/ --incremental-basedir=/mysql_xtrabackup/full/ --defaults-file=/etc/mysql/my.cnf --password='ghjynjcjandb' --no-timestamp --slave-info
    cd  /mysql_xtrabackup/
    tar cfz /mysql_xtrabackup/mysql-inc-dump-$DATE.tar.gz ./inc-$DATE
    echo "*** `date`: moving to ftp"
    FILE_NAME=mysql-inc-dump-$DATE.tar.gz
    OLD_FILE_NAME=mysql-inc-dump-$OLD_DATE.tar.gz
    HOST='192.168.1.207'
    USER='irr'
    PASSWD='EiK8fei8'

ftp -nv <<EOF
open $HOST
user $USER $PASSWD
cd mysql-xtrabackup
put $FILE_NAME
delete ${OLD_FILE_NAME}
EOF

    echo "*** `date`: copy backup complete"
    echo "*** `date`: delete 14 days old backup"
    rm /mysql_xtrabackup/mysql-inc-dump-$OLD_DATE.tar.gz
}

case $op in

    "--full")
	full
	;;

    "--inc")
	inc
	;;

    *)
	echo -e "Usage:\n--full\n\trun full mysql backup;\n--inc\n\trun incremental mysql backup."
	;;
esac
