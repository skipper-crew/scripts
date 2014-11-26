#!/usr/local/bin/bash

date=`date +%Y-%m-%d`
# Table Sizes for sslite on db12
echo "stdout redirected to /home/skipper/scripts/sh/table_sizes_sslite_db12-$date.log"
#mysql -h 192.168.1.185 -udev -pdev -e 'SELECT round(((data_length + index_length) / 1024 / 1024 / 1024), 2) "Size in MB", table_name AS "Tables" FROM information_schema.TABLES WHERE table_schema = "sslite";' > /home/skipper/scripts/sh/table_sizes.tmp
#cat /home/skipper/scripts/sh/table_sizes.tmp | grep -v Size | sort -gr > /home/skipper/scripts/sh/table_sizes_sslite_db12-$date.log

mysql -h 192.168.1.77 -udev -pdevel -e 'SELECT round(((data_length + index_length) / 1024 / 1024 / 1024), 2) "Size in MB", table_name AS "Tables" FROM information_schema.TABLES WHERE table_schema = "zabbix";' > /home/skipper/scripts/sh/table_sizes.tmp
cat /home/skipper/scripts/sh/table_sizes.tmp | grep -v Size | sort -gr > /home/skipper/scripts/sh/table_sizes_zabbix_h4-$date.log

# Table Sizes for sslite_irrkz on dbkz
#mysql -h 192.168.1.173 -udev -pved -e 'SELECT round(((data_length + index_length) / 1024 / 1024 / 1024), 2) "Size in MB", table_name AS "Tables" FROM information_schema.TABLES WHERE table_schema = "sslite_irrkz";' > /home/skipper/scripts/sh/table_sizes.tmp
#cat /home/skipper/scripts/sh/table_sizes.tmp | grep -v Size | sort -gr > /home/skipper/scripts/sh/table_sizes_sslite_irrkz_dbkz.log

# Table Sizes for parser_db_war on parser
#mysql -h 192.168.1.62 -uparser -phaiK8wel -e 'SELECT round(((data_length + index_length) / 1024 / 1024 / 1024), 2) "Size in MB", table_name AS "Tables" FROM information_schema.TABLES WHERE table_schema = "parser_db_war";' > /home/skipper/scripts/sh/table_sizes.tmp
#cat /home/skipper/scripts/sh/table_sizes.tmp | grep -v Size | sort -gr > /home/skipper/scripts/sh/table_sizes_parser_db_war.log

# Table Sizes for sslite_statistics on db5
#mysql -h 192.168.1.168 -udev -pdev -e 'SELECT round(((data_length + index_length) / 1024 / 1024 / 1024), 2) "Size in MB", table_name AS "Tables" FROM information_schema.TABLES WHERE table_schema = "sslite_statistics";' > /home/skipper/scripts/sh/table_sizes.tmp
#cat /home/skipper/scripts/sh/table_sizes.tmp | grep -v Size | sort -gr > /home/skipper/scripts/sh/table_sizes_statistics.log

rm /home/skipper/scripts/sh/table_sizes.tmp
