#!/bin/sh

STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2

exitstatus=$STATE_OK

while test -n "$1"; do
    case "$1" in
        -d)
            device=$2
            shift
            ;;
        -w)
            warning=$2
            shift
            ;;
        -c)
            critical=$2
            shift
            ;;
        *)
            echo "Unknown argument: $1"
            print_usage
            exit $STATE_UNKNOWN
            ;;
    esac
    shift
done

busy=`sudo /usr/sbin/gstat -b | grep ${device} | awk '{print $9}' | sed -e 's|\..*||g' | head -n 1`


if [ $busy -ge $warning ] && [ $busy -lt $critical ]; then
    echo "Disk Usage=$busy% | busy=$busy"
    exitstatus=$STATE_WARNING
    exit $exitstatus
fi

if [ $busy -ge $critical ]; then
    echo "Disk Usage=$busy% | busy=$busy"
    exitstatus=$STATE_CRITICAL
    exit $exitstatus
fi

echo "Disk Usage=$busy% | busy=$busy"
exit $exitstatus