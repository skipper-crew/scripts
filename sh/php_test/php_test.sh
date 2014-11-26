#!/bin/sh

# >>> fix of fcgi memory leak

ps aux | grep "php-fpm: pool" > /home/skipper/php_test/php-fpm.txt
x=1

while [ $x -lt `cat /home/skipper/php_test/php-fpm.txt | wc -l` ]
    do
	if [ `cat /home/skipper/php_test/php-fpm.txt | /usr/bin/awk '{print $6}' | sed -n $x"p"` -gt 2000000 ]
	    then
		kill -KILL `cat /home/skipper/php_test/php-fpm.txt | /usr/bin/awk '{print $2}' | sed -n $x"p"`
		echo "-----"
		echo `cat /home/skipper/php_test/php-fpm.txt | sed -n $x"p"`
		echo "I'll kill php-fpm with PID "`cat /home/skipper/php_test/php-fpm.txt | /usr/bin/awk '{print $2}' | sed -n $x"p"`" on "`date`
		tail -n 10 /home/skipper/php_test/php-fpm.log | mail -s "I killed php-fpm child on `hostname`!!!" skipper@prontosoft.by imatsiuk@prontosoft.by
	fi
	x=`expr $x + 1`
done

# >>> fix of fcgi not working

fcgi_critical=0
fcgi_check=`/home/skipper/php_test/check_fastcgi.pl -H 192.168.1.3 -p 9000 -s /home/skipper/fcgi.php -e OK`

if [ $fcgi_check -eq $fcgi_critical ]
    then
	/usr/local/etc/rc.d/php-fpm restart
	echo "++++++"
	echo "---> I'll restart php-fpm on "`date`
	tail -n 10 /home/skipper/php_test/php-fpm.log | mail -s "I restarted php-fpm on `hostname`!!!" skipper@prontosoft.by imatsiuk@prontosoft.by
fi

# EXAMPLE

#web8# ps aux | grep php
#www     32033  0.2  0.4 251072 31384  ??  R    12:44PM   0:05.84 php-fpm: pool www (php-fpm)
#www     32039  0.2  0.4 251072 29544  ??  R    12:44PM   0:04.97 php-fpm: pool www (php-fpm)
#www     32041  0.2  0.4 251072 30372  ??  R    12:44PM   0:04.75 php-fpm: pool www (php-fpm)
#www     32046  0.2  0.4 251072 35776  ??  R    12:44PM   0:03.73 php-fpm: pool www (php-fpm)
#www     31770  0.1 76.7 10388672 6414784  ??  R    12:39PM   0:49.13 php-fpm: pool www (php-fpm) !!!!!!!!!!!!!!!!!!
#www     31983  0.1  0.4 251072 35856  ??  R    12:44PM   0:05.20 php-fpm: pool www (php-fpm)
#www     31989  0.1  0.4 249024 31348  ??  R    12:44PM   0:05.45 php-fpm: pool www (php-fpm)
#www     31993  0.1  0.4 249024 31316  ??  R    12:44PM   0:05.10 php-fpm: pool www (php-fpm)
#www     31994  0.1  0.4 251072 32664  ??  R    12:44PM   0:04.37 php-fpm: pool www (php-fpm)