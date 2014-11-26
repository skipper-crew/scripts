#!/usr/local/bin/bash

STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3
STATE_DEPENDENT=4

result="OK"
exitstatus=$STATE_OK

while test -n "$1"; do
    case "$1" in
        -ip)
            ip=$2
            shift
            ;;
        -h)
            echo "Usage: -ip - ip adress"
            shift
            exit 3
            ;;
        *)
            echo "Unknown argument: $1"
            exit 3
            ;;
    esac
    shift
done

if [ -z $ip ]
then
    echo "Usage: -ip - ip adress"
    exit 3
fi

critical=40
filepath1=/tmp/sla_status1_elastic_$ip.log
filepath2=/tmp/sla_pugre_elastic_$ip.log
wget -q http://$ip/sla_status -O $filepath1
wget -q http://$ip/sla_purge -O $filepath2

count=`cat $filepath1 | grep "elastic.all.http_4" | awk '{print $3}'`

if [ $count -lt $critical ]; then
    exitstatus=$STATE_CRITICAL
    result="CRITICAL"
    echo "Elasticsearch Responce Time is over"
    exit $exitstatus
fi

rm $filepath1
rm $filepath2

exit $exitstatus
