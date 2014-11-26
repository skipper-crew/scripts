#!/usr/local/bin/bash
time=`date -v-1M +%Y.%m.%d-%H:%M`
zero_time=`cat /usr/truncate.time.txt`
if [ $time = $zero_time ]; then
    /usr/local/bin/zabbix_sender -i /usr/local/etc/zabbix22/scripts/nginx_logrequests.txt -c /usr/local/etc/zabbix22/zabbix_agentd.conf > /dev/null
    echo 1
    exit 0
fi

hostname="web1.irr.ru"
#date=`date -v-1M '+%Y:%H:%M'`
date=`date -v-1M '+%Y-%m-%dT%H:%M'`
declare -a ARRAY
#"if QR on" ARRAY=( `cat /var/log/nginx/nginx-main-access-all-irr.ru.log | grep "$date" | grep -v "/empty.html" | grep -v "/blank.html" | grep -v '400 0 \"-\" \"-\"' | awk '{print $1}' | sed 's|^"||' | sed 's|"$|*1000|'|bc -l | sed 's|\..*||'` )
ARRAY=( `cat /var/log/nginx/nginx-main-access-all-irr.ru.log | grep "$date" | grep -v "/empty.html" | grep -v '400 0 \"-\" \"-\"' | awk '{print $1}' | sed 's|^"||' | sed 's|"$|*1000|'|bc -l | sed 's|\..*||'` )
element_count=${#ARRAY[@]}
element_count_timedout=`cat /var/log/nginx/nginx-main-access-all-irr.ru.log | grep "$date" | grep "/empty.html" | wc -l | awk '{print $1}'`
#"if QR on" element_count_blocked=`cat /var/log/nginx/nginx-main-access-all-irr.ru.log | grep "$date" | grep "/blank.html" | wc -l | awk '{print $1}'`
element_count_blocked=0
index=0
resp_0_300=0
resp_301_600=0
resp_601_1000=0
resp_1001_3000=0
resp_3001_6000=0
resp_6001=0


index=0
while [ "$index" -lt "$element_count" ]
do
    if [ ${ARRAY[$index]} -ge 0 ] && [ ${ARRAY[$index]} -le 300 ]
    then
        let "resp_0_300 = $resp_0_300 + 1"
    elif [ ${ARRAY[$index]} -ge 301 ] && [ ${ARRAY[$index]} -le 600 ]
    then
        let "resp_301_600 = $resp_301_600 + 1"
    elif [ ${ARRAY[$index]} -ge 601 ] && [ ${ARRAY[$index]} -le 1000 ]
    then
        let "resp_601_1000 = $resp_601_1000 + 1"
    elif [ ${ARRAY[$index]} -ge 1001 ] && [ ${ARRAY[$index]} -le 3000 ]
    then
        let "resp_1001_3000 = $resp_1001_3000 + 1"
    elif [ ${ARRAY[$index]} -ge 3001 ] && [ ${ARRAY[$index]} -le 6000 ]
    then
        let "resp_3001_6000 = $resp_3001_6000 + 1"
    elif [ ${ARRAY[$index]} -ge 6001 ]
    then
	let "resp_6001 = $resp_6001 + 1"
    fi
    let "index = $index + 1"
done

resp_0_300=`echo "$resp_0_300 * 100 / $element_count" | bc -l`
resp_301_600=`echo "$resp_301_600 * 100 / $element_count" | bc -l`
resp_601_1000=`echo "$resp_601_1000 * 100 / $element_count" | bc -l`
resp_1001_3000=`echo "$resp_1001_3000 * 100 / $element_count" | bc -l`
resp_3001_6000=`echo "$resp_3001_6000 * 100 / $element_count" | bc -l`
resp_6001=`echo "$resp_6001 * 100 / $element_count" | bc -l`

echo "$hostname  nginx.logrequests.count $element_count" > /usr/local/etc/zabbix22/scripts/nginx_logrequests.txt
echo "$hostname  nginx.logrequests.count.timedout $element_count_timedout" >> /usr/local/etc/zabbix22/scripts/nginx_logrequests.txt
echo "$hostname  nginx.logrequests.count.blocked $element_count_blocked" >> /usr/local/etc/zabbix22/scripts/nginx_logrequests.txt

echo "$hostname  nginx.logrequests.count.resp_0_300 $resp_0_300" >> /usr/local/etc/zabbix22/scripts/nginx_logrequests.txt
echo "$hostname  nginx.logrequests.count.resp_301_600 $resp_301_600" >> /usr/local/etc/zabbix22/scripts/nginx_logrequests.txt
echo "$hostname  nginx.logrequests.count.resp_601_1000 $resp_601_1000" >> /usr/local/etc/zabbix22/scripts/nginx_logrequests.txt
echo "$hostname  nginx.logrequests.count.resp_1001_3000 $resp_1001_3000" >> /usr/local/etc/zabbix22/scripts/nginx_logrequests.txt
echo "$hostname  nginx.logrequests.count.resp_3001_6000 $resp_3001_6000" >> /usr/local/etc/zabbix22/scripts/nginx_logrequests.txt
echo "$hostname  nginx.logrequests.count.resp_6001 $resp_6001" >> /usr/local/etc/zabbix22/scripts/nginx_logrequests.txt

/usr/local/bin/zabbix_sender -i /usr/local/etc/zabbix22/scripts/nginx_logrequests.txt -c /usr/local/etc/zabbix22/zabbix_agentd.conf > /dev/null
echo 1
exit 0
