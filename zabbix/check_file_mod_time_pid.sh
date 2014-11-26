#!/usr/local/bin/bash

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

if [ -f $filepath ]; then
    curent_time=`date +%s`
    file_mod_time=`stat -f"%m" $filepath`
    file_mod_time_crit=`expr $file_mod_time + $crit_time`
    file_mod_delta=`expr $curent_time - $file_mod_time`
    pid=`cat $filepath | awk '{print $1}'`
    proc_state=`ps -auxww | grep $pid | grep -v grep | awk '{print $2}'`
fi

# Check without lock file modification time.
if [ $crit_time -eq 999999 ]; then
    if [ -f $filepath ]; then
	if [ $proc_state ]; then
	    # Allert only if runing process exist.
	    echo "0"
	    exit 2
	elif [ ! $proc_state ]; then
	    # Allert only if runing process doesn't exist.
	    echo "2"
	    exit 2
	fi
    fi
    # Lock file doesn't exist.
    echo "1"
    exit 0
fi

# Check with lock file modification time.
if [ -f $filepath ]; then
    if [ $file_mod_time_crit -lt $curent_time ]; then
	if [ $proc_state ]; then
	    file_mod_delta=`expr $file_mod_delta / 60`
	    # Allert if lock modification time expiered and runing process exist.
	    echo "3"
	    exit 2
	elif [ ! $proc_state ]; then
	    file_mod_delta=`expr $file_mod_delta / 60`
	    # Allert if lock modification time expiered and runing process doesn't exist.
	    echo "4"
	    exit 2
	fi
    fi
else
    # Allert if lock file doesn't exist.
    echo "1"
    exit $exitstatus
fi

file_mod_delta=`expr $file_mod_delta / 60`
echo "0"
exit $exitstatus
