#!/bin/sh

DATE=`date +%Y-%m-%d`
OLD_DATE=`date +%Y-%m-%d -d '14 day ago'`

cd /home/BACKUP/

mysqldump -R --opt --single-transaction sslite_irrkz > /home/BACKUP/sslite_irrkz-$DATE.sql
gzip /home/BACKUP/sslite_irrkz-$DATE.sql
find /home/BACKUP/sslite_irrkz* -mtime +14 -exec rm {} \;

mysqldump -R --opt --single-transaction counterskz > /home/BACKUP/counterskz-$DATE.sql
gzip /home/BACKUP/counterskz-$DATE.sql
find /home/BACKUP/counterskz* -mtime +14 -exec rm {} \;

FILE_NAME_1=sslite_irrkz-$DATE.sql.gz
OLD_FILE_NAME_1=sslite_irrkz-$OLD_DATE.sql.gz
FILE_NAME_2=counterskz-$DATE.sql.gz
OLD_FILE_NAME_2=counterskz-$OLD_DATE.sql.gz
HOST='192.168.1.207'
USER='irr'
PASSWD='EiK8fei8'

ftp -nv <<EOF
open $HOST
user $USER $PASSWD
cd dbkz_mysql
put $FILE_NAME_1
delete ${OLD_FILE_NAME_1}
put $FILE_NAME_2
delete ${OLD_FILE_NAME_2}
EOF
