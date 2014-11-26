#!/usr/local/bin/bash

STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3
STATE_DEPENDENT=4
grep="php"
result="OK"
exitstatus=$STATE_OK

usage () {
    echo -e "Help:\n-f filepath\n-g grep statement\n-c critical time in sec"
    exit 0
}

while test -n "$1"; do
    case "$1" in
        -f)
            filepath=$2
            shift
            ;;
        -g)
            grep=$2
            shift
            ;;
        -c)
            crit_time=$2
            shift
            ;;
        -h)
            usage
            shift
            ;;
        *)
            echo "Unknown argument: $1"
            usage
            ;;
    esac
    shift
done

curent_time=`date +%s`
file_mod_time=`stat -f"%m" $filepath`
file_mod_time_crit=`expr $file_mod_time + $crit_time`
file_mod_delta=`expr $curent_time - $file_mod_time`

php_file=`echo $filepath | sed 's/.*\///g' | sed 's/\.lock.*//g' | sed 's/__lock.*//g' | sed 's/_lock.*//g'`

if [ $grep ]; then
    proc_state=`ps -auxww | grep "/usr/local/bin/php" | grep $grep | awk '{print $12}' | head -n 1`
fi

# Check without lock file modification time.
if [ $crit_time -eq 999999 ]; then
    if [ $proc_state ]; then
        exitstatus=$STATE_CRITICAL
        result="CRITICAL"
        file_mod_delta=`expr $file_mod_delta / 60`
        # Allert only if runing process exist.
        echo "0"
        exit $exitstatus
    elif [ ! $proc_state ]; then
        exitstatus=$STATE_CRITICAL
        result="CRITICAL"
        file_mod_delta=`expr $file_mod_delta / 60`
        # Allert only if runing process don't exist.
        echo "4"
        exit $exitstatus
    fi
    # Allert if lock file doesn't exist.
    echo "0"
    exit $exitstatus
fi

# Check with lock file modification time.
if [ -f $filepath ]; then
    if [ $file_mod_time_crit -lt $curent_time ]; then
	if [ $proc_state ]; then
	    exitstatus=$STATE_CRITICAL
	    result="CRITICAL"
	    file_mod_delta=`expr $file_mod_delta / 60`
	    # Allert if lock modification time expiered and runing process exist.
	    echo "1" 
	    exit $exitstatus
	elif [ ! $proc_state ]; then
	    exitstatus=$STATE_CRITICAL
	    result="CRITICAL"
	    file_mod_delta=`expr $file_mod_delta / 60`
	    # Allert if lock modification time expiered and runing process don't exist.
	    echo "2"
	    exit $exitstatus
	fi
    fi
else
    # Allert if lock file doesn't exist.
    echo "0"
    exit $exitstatus
fi

file_mod_delta=`expr $file_mod_delta / 60`
echo "0"
exit $exitstatus
