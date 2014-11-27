#!/bin/sh

test=`/home/skipper/nagios-plugin-mongodb/check_mongodb.py -H 192.168.1.48 -P 27017 -A connect -W 2 -C 4 | awk '{print $1}'`
if [ $test = "CRITICAL" ]
    then
	rm /var/lib/mongodb/mongod.lock
	/etc/init.d/mongodb restart
	echo "Mongodb restarted on `date`"
	tail -n 10 /home/skipper/nagios-plugin-mongodb/check_mongodb.log | mail -s "I restarted mongodb on `hostname`" skipper@prontosoft.by imatsiuk@prontosoft.by aludinovskov@prontosoft.by
fi