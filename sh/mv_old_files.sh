#!/bin/bash

usage()
{
    echo "Usage: --src \"source_dir\" --target \"target_dir\""
}

if [ -z $1 ]; then
    usage
    exit 0
fi

while test -n "$1"; do
    case "$1" in
        --src)
            src_dir=$2
            shift
            ;;
        --target)
            backup_dir=$2
            shift
            ;;
        --help)
	    usage
            exit 0
            ;;
        *)
            echo "Unknown argument: $1"
	    usage
            exit 0
            ;;
    esac
    shift
done

#src_dir="/data/scripts/tmp/a/"
#backup_dir="/data/scripts/tmp/a_back/"

for src_file in `find $src_dir* -mtime +10 -exec echo {} \;`
do
    backup_file=`echo $src_file | sed 's:'$src_dir'::g'`
    cd $src_dir
    cp --parents $backup_file $backup_dir
#    rm $backup_file
done