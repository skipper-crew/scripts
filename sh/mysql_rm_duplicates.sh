#!/bin/sh

a=`/usr/bin/mysql --user=root --password=ghjynjcjandb -e "show slave status\G;" | /bin/grep Last_Errno | /usr/bin/awk '{print $2}'`
if [ $a -gt 0 ]
    then
	/usr/bin/mysql --user=root --password=ghjynjcjandb -e "start slave;"
	b=`/usr/bin/mysql --user=root --password=ghjynjcjandb -e "show slave status\G;" | /bin/grep Last_Error | /usr/bin/awk '{print $5}' | /usr/bin/cut -c2-8`
#	/usr/bin/mysql --user=root --password=ghjynjcjandb -D sslite -A -e "delete from utils_psellers_temp where user_id = $b;"
	/usr/bin/mysql --user=root --password=ghjynjcjandb -e "start slave;"
fi
