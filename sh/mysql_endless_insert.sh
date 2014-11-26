#!/bin/bash

a=1
mysql -h 192.168.1.239 -u admin -padmin -e "truncate table example;" cluster
while [ $a > 0  ]; do
    mysql -h 192.168.1.239 -u admin -padmin -e "INSERT INTO example (id,data) VALUES($a,'name');" cluster
    echo $a
    sleep 1
    let "a+=1"
done
