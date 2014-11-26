#!/bin/sh

STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3
STATE_DEPENDENT=4

result="green"
exitstatus=$STATE_OK
thresh_warn="yellow"
thresh_crit="red"

while test -n "$1"; do
    case "$1" in
        -h)
            ip=$2
            shift
            ;;
        -p)
            port=$2
            shift
            ;;
#        -c)
#            thresh_crit=$2
#            shift
#            ;;
        *)
            echo "Unknown argument: $1"
            print_usage
            exit $STATE_UNKNOWN
            ;;
    esac
    shift
done

#elastic=`curl -XGET 'http://$ip:$port/_cluster/health?pretty=true' | grep "status" | awk '{print $3}' | cut -c2-6`
elastic=`curl -XGET 'http://192.168.1.${ip}:$port/_cluster/health?pretty=true' | grep "status" | awk '{print $3}' | cut -c2-6`
#dirsize=`sudo du --block-size=1G $dirpath | tail -n 1 | cut -c1-3 $fgg`


if [ "$thresh_warn" != "" ]; then
    if [ $elastic != $thresh_warn ]; then
        exitstatus=$STATE_WARNING
    fi
fi
if [ "$thresh_crit" != "" ]; then
    if [ $elastic != $thresh_crit ]; then
        exitstatus=$STATE_CRITICAL
    fi
fi

echo "Elastic State is $elastic"
exit $exitstatus
