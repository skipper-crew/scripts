#!/bin/sh

STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3
STATE_DEPENDENT=4

result="OK"
exitstatus=$STATE_OK
thresh_crit=25000000

count=`/usr/local/bin/mysql -h 192.168.1.165 -udev -pdev sslite -e "select count(*) from ads_archive;" | awk '{print $1}' | tail -n 1`

if [ $count -ge $thresh_crit ]; then
    result="AHTUNG"
    exitstatus=$STATE_CRITICAL
fi

echo "$result: ads_archive count - $count"
exit $exitstatus
