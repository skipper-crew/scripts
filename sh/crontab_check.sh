#!/usr/local/bin/bash

while test -n "$1"; do
    case "$1" in
        -f)
            file=$2
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

line_curent=1
line_count=`wc -l $file | awk {'print $1'}`

while [ $line_curent -lt $line_count ]
    do
	line_content=`sed -n $line_curent"p" $file`
	line_content=`echo $line_content | sed -n '/^[ ]*#/!s|.*[ ]\(\([^\/]*\/\)\{1,\}[^\.]*\.php\).*|\1|p'`
	if [ -z $line_content ]; then
	    a=1
	elif [ -f $line_content ]; then
	    if [ `ls -l $line_content | awk '{print $1}'` = "-rwxrwxrwx" ]; then
		echo "File \"$line_content\" have \"-rwxrwxrwx\" privileges." | mail -s "Crontab *.php privileges check from `hostname`" skipper@prontosoft.by imatsiuk@prontosoft.by skozlovsky@prontosoft.by
	    fi
	fi
	line_curent=`expr $line_curent + 1`
    done
