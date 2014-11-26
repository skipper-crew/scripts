#!/bin/bash

while test -n "$1"; do
    case "$1" in
        -f)
            filepath=$2
            shift
            ;;
        -h)
	    echo "Calculate number of duplicated strings in file."
            echo "Usage: -f - filename"
            shift
            exit $STATE_UNKNOWN
            ;;
        *)
            echo "Unknown argument: $1"
            print_usage
            exit $STATE_UNKNOWN
            ;;
    esac
    shift
done

cat $filepath | uniq > "$filepath"_tmp
limit1=`cat "$filepath"_tmp | wc -l | sed s/[^0-9]//g`
limit2=`cat $filepath | wc -l | sed s/[^0-9]//g`
n1=7
count=0
while [ $n1 -lt $limit1 ]
do
n2=1
str1=`cat "$filepath"_tmp | sed -n ''$n1'p'`
    while [ $n2 -lt $limit2 ]
    do
    str2=`cat $filepath | sed -n ''$n2'p'`
	if [ $str1 == $str2 ]
	then
	count=`echo $count+1 | bc -q`
	fi
    n2=`echo $n2+1 | bc -q`
    done
	echo "IP $str1 - $count times"
count=0
n1=`echo $n1+1 | bc -q`
done

rm "$filepath"_tmp