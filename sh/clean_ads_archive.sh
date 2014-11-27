#!/bin/bash

notify ()
{
    /usr/bin/printf "$1" | /home/skipper/archive/sms.php -p +375298617796
    /usr/bin/printf "$1" | /home/skipper/archive/sms.php -p +375297571417
    /usr/bin/printf "$1" | /home/skipper/archive/sms.php -p +375297727121
}

if [ ! $1 = "start" ] || [ -z $1 ]; then
    echo "Usage: ./clean_ads_archive.sh start"
    exit 0
fi

DATE=`date +%Y-%m-%d`
echo "----//----//----//----//----//----//----"
echo "Start: \"`date`\""
echo "Checking free space"
free_space=`df -B GB | grep rootfs | awk '{print $4}' | sed 's|GB||g'`
free_space=`expr $free_space - 5`
ads_archive_size=`mysql -h 192.168.1.189 -uarchive -pdfRew1xs -e 'SELECT round(((data_length + index_length) / 1024 / 1024 / 1024), 2) "Size in MB", table_name AS "Tables" FROM information_schema.TABLES WHERE table_schema = "sslite";' | grep '.*ads_archive$' | awk '{print $1}' | awk -F . '{print $1}'`

if [ $ads_archive_size -lt 25 ]; then
    echo "ads_archive size is too small: $ads_archive_size GB"
    exit 0
fi

echo "ads_archive size is $ads_archive_size GB. Dump started."

if [ $free_space -lt $ads_archive_size ]; then
    echo "Not enough free space for dump"
    notify "ads_archive dump\nNot enough free space for dump"
    exit 0
fi

echo "Changing crontab"
/usr/bin/ssh mephius@192.168.1.77 -p22 "sudo cp /var/cron/tabs/root /var/cron/tabs/root_backup_$DATE"
/usr/bin/ssh mephius@192.168.1.77 -p22 "sudo cat /var/cron/tabs/root | sed -e 's|\(.*\"deactivate\"\)|#\1|g' | sed -e 's|\(.*\"archive\"\)|#\1|g' > /tmp/root"
#/usr/bin/ssh mephius@192.168.1.77 -p22 "sudo mv /tmp/root /var/cron/tabs/root"
/usr/bin/ssh mephius@192.168.1.77 -p22 "sudo crontab /tmp/root"
/usr/bin/ssh mephius@192.168.1.77 -p22 "sudo chmod 600 /var/cron/tabs/root"
/usr/bin/ssh mephius@192.168.1.77 -p22 "sudo chown root /var/cron/tabs/root"

echo "Killing processes & removing lockfiles"
pid_archive=`/usr/bin/ssh mephius@192.168.1.77 -p22 "cat /usr/home/mephius/irr.ru/utils/irr.ru/maintenance/ads_maintenance_archive.lock" | awk '{print $1}'`
/usr/bin/ssh mephius@192.168.1.77 -p22 "sudo kill -KILL $pid_archive; sudo rm /usr/home/mephius/irr.ru/utils/irr.ru/maintenance/ads_maintenance_archive.lock"
pid_deactivate=`/usr/bin/ssh mephius@192.168.1.77 -p22 "cat /usr/home/mephius/irr.ru/utils/irr.ru/maintenance/ads_maintenance_deactivate.lock" | awk '{print $1}'`
/usr/bin/ssh mephius@192.168.1.77 -p22 "sudo kill -KILL $pid_deactivate; sudo rm /usr/home/mephius/irr.ru/utils/irr.ru/maintenance/ads_maintenance_deactivate.lock"

echo "ads_archive dump started on `date`"
notify "ads_archive dump\nDump started on `date`"
mysql -h 192.168.1.189 -uarchive -pdfRew1xs sslite -e "select * from ads_archive into outfile '/home/skipper/archive/ads_archive.sql';"
echo "Checking archive validity"
check=`tail -n 200 /home/skipper/archive/ads_archive.sql | grep -E "^[0-9]{9}" | tail -n 1 | awk '{print $1}'`
control_check=`mysql -h 192.168.1.189 -uarchive -pdfRew1xs sslite -e "select * from ads_archive ORDER BY id DESC LIMIT 1\G" | grep " id: " | awk '{print $2}'`
if [ ! $check = $control_check ]; then
    echo -e "ERROR: dump file not valid"
    notify "ads_archive dump\nERROR: dump file not valid"
    exit 0
fi
archive_file_size=`ls -lh /home/skipper/archive/ads_archive.sql | awk '{print $5}'`

echo "Gzipping archive file"
mv /home/skipper/archive/ads_archive.sql /home/skipper/archive/ads_archive_${DATE}.sql
gzip /home/skipper/archive/ads_archive_${DATE}.sql
echo "Coping archive to 192.168.1.170 server"
free_space_storage=`/usr/bin/ssh mephius@192.168.1.170 -p22 "df -B GB" | grep rootfs | awk '{print $4}' | sed 's|GB||g'`
if [ $free_space_storage -lt 5 ]; then
    echo "Not enough free space on storage"
    notify "ads_archive dump\nNot enough free space on storage"
    echo "Truncating ads_archive table on mysql master server"
    mysql sslite -h 192.168.1.6 -u dev -pdev < /home/skipper/archive/truncate_ads_archive.sql
    echo "Changing crontab"
#    /usr/bin/ssh mephius@192.168.1.77 -p22 "sudo mv /var/cron/tabs/root_backup_$DATE /var/cron/tabs/root"
    /usr/bin/ssh mephius@192.168.1.77 -p22 "sudo crontab /var/cron/tabs/root_backup_$DATE"
    echo "ads_archive dump finished on `date` archive size: $archive_file_size"
    notify "ads_archive dump\nDump finished on `date`. Archive size: $archive_file_size"
    exit 0
fi
/usr/bin/scp -q -P 22 -i /home/skipper/.ssh/id_rsa /home/skipper/archive/ads_archive_${DATE}.sql.gz skipper@192.168.1.170:/home/BACKUP\!\!\!\!/
echo "Removing old files"
rm /home/skipper/archive/ads_archive_${DATE}.sql.gz
echo "Truncating ads_archive table on mysql master server"
mysql sslite -h 192.168.1.6 -u dev -pdev < /home/skipper/archive/truncate_ads_archive.sql
echo "Changing crontab"
#/usr/bin/ssh mephius@192.168.1.77 -p22 "sudo mv /var/cron/tabs/root_backup_$DATE /var/cron/tabs/root"
/usr/bin/ssh mephius@192.168.1.77 -p22 "sudo crontab /var/cron/tabs/root_backup_$DATE"
echo "ads_archive dump finished on `date` archive size: $archive_file_size"

notify "ads_archive dump\nDump finished on `date`. Archive size: $archive_file_size"
echo -e "End: \"`date`\"\n\n------------------------------------\n\n"
