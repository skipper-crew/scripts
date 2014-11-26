#!/usr/local/bin/bash

while test -n "$1"; do
    case "$1" in
        -ip)
            ip=$2
            shift
            ;;
        -h)
            echo "Usage: -ip - ip adress"
            shift
            exit 3
            ;;
        *)
            echo "Unknown argument: $1"
            exit 3
            ;;
    esac
    shift
done

if [ -z $ip ]
then
    echo "Usage: -ip - ip adress"
    exit 3
fi

date=`date | awk '{print $2"-"$3"-"$4}'`
filepath1=/tmp/sla_status1_$ip.log
filepath2=/tmp/sla_status2_$ip.log
filepath3=/tmp/sla_pugre_$ip.log
wget -q http://$ip/sla_status -O $filepath1
#wget -q $url -O $filepath

# TOTAL
interval_0_100=`cat $filepath1 | grep "elastic.all.100 =" | awk '{print $3}'`
interval_100_300=`cat $filepath1 | grep "elastic.all.300 =" | awk '{print $3}'`
interval_300_500=`cat $filepath1 | grep "elastic.all.500 =" | awk '{print $3}'`
interval_500_1000=`cat $filepath1 | grep "elastic.all.1000 =" | awk '{print $3}'`
interval_1000_3000=`cat $filepath1 | grep "elastic.all.3000 =" | awk '{print $3}'`
interval_3000_60000=`cat $filepath1 | grep "elastic.all.60000 =" | awk '{print $3}'`
total_1=`cat $filepath1 | grep "elastic.all.http =" | awk '{print $3}'`
#Filter_1
f1_interval_0_100=`cat $filepath1 | grep "elastic.192.168.1.170:9401.100 =" | awk '{print $3}'`
f1_interval_100_300=`cat $filepath1 | grep "elastic.192.168.1.170:9401.300 =" | awk '{print $3}'`
f1_interval_300_500=`cat $filepath1 | grep "elastic.192.168.1.170:9401.500 =" | awk '{print $3}'`
f1_interval_500_1000=`cat $filepath1 | grep "elastic.192.168.1.170:9401.1000 =" | awk '{print $3}'`
f1_interval_1000_3000=`cat $filepath1 | grep "elastic.192.168.1.170:9401.3000 =" | awk '{print $3}'`
f1_interval_3000_60000=`cat $filepath1 | grep "elastic.192.168.1.170:9401.60000 =" | awk '{print $3}'`
f1_total_1=`cat $filepath1 | grep "elastic.192.168.1.170:9401.http =" | awk '{print $3}'`
#Filter_2
f2_interval_0_100=`cat $filepath1 | grep "elastic.192.168.1.170:9402.100 =" | awk '{print $3}'`
f2_interval_100_300=`cat $filepath1 | grep "elastic.192.168.1.170:9402.300 =" | awk '{print $3}'`
f2_interval_300_500=`cat $filepath1 | grep "elastic.192.168.1.170:9402.500 =" | awk '{print $3}'`
f2_interval_500_1000=`cat $filepath1 | grep "elastic.192.168.1.170:9402.1000 =" | awk '{print $3}'`
f2_interval_1000_3000=`cat $filepath1 | grep "elastic.192.168.1.170:9402.3000 =" | awk '{print $3}'`
f2_interval_3000_60000=`cat $filepath1 | grep "elastic.192.168.1.170:9402.60000 =" | awk '{print $3}'`
f2_total_1=`cat $filepath1 | grep "elastic.192.168.1.170:9402.http =" | awk '{print $3}'`
#Filter_3
f3_interval_0_100=`cat $filepath1 | grep "elastic.192.168.1.170:9403.100 =" | awk '{print $3}'`
f3_interval_100_300=`cat $filepath1 | grep "elastic.192.168.1.170:9403.300 =" | awk '{print $3}'`
f3_interval_300_500=`cat $filepath1 | grep "elastic.192.168.1.170:9403.500 =" | awk '{print $3}'`
f3_interval_500_1000=`cat $filepath1 | grep "elastic.192.168.1.170:9403.1000 =" | awk '{print $3}'`
f3_interval_1000_3000=`cat $filepath1 | grep "elastic.192.168.1.170:9403.3000 =" | awk '{print $3}'`
f3_interval_3000_60000=`cat $filepath1 | grep "elastic.192.168.1.170:9403.60000 =" | awk '{print $3}'`
f3_total_1=`cat $filepath1 | grep "elastic.192.168.1.170:9403.http =" | awk '{print $3}'`
#Filter_4
f4_interval_0_100=`cat $filepath1 | grep "elastic.192.168.1.170:9404.100 =" | awk '{print $3}'`
f4_interval_100_300=`cat $filepath1 | grep "elastic.192.168.1.170:9404.300 =" | awk '{print $3}'`
f4_interval_300_500=`cat $filepath1 | grep "elastic.192.168.1.170:9404.500 =" | awk '{print $3}'`
f4_interval_500_1000=`cat $filepath1 | grep "elastic.192.168.1.170:9404.1000 =" | awk '{print $3}'`
f4_interval_1000_3000=`cat $filepath1 | grep "elastic.192.168.1.170:9404.3000 =" | awk '{print $3}'`
f4_interval_3000_60000=`cat $filepath1 | grep "elastic.192.168.1.170:9404.60000 =" | awk '{print $3}'`
f4_total_1=`cat $filepath1 | grep "elastic.192.168.1.170:9404.http =" | awk '{print $3}'`
#Filter_5
f5_interval_0_100=`cat $filepath1 | grep "elastic.192.168.1.170:9405.100 =" | awk '{print $3}'`
f5_interval_100_300=`cat $filepath1 | grep "elastic.192.168.1.170:9405.300 =" | awk '{print $3}'`
f5_interval_300_500=`cat $filepath1 | grep "elastic.192.168.1.170:9405.500 =" | awk '{print $3}'`
f5_interval_500_1000=`cat $filepath1 | grep "elastic.192.168.1.170:9405.1000 =" | awk '{print $3}'`
f5_interval_1000_3000=`cat $filepath1 | grep "elastic.192.168.1.170:9405.3000 =" | awk '{print $3}'`
f5_interval_3000_60000=`cat $filepath1 | grep "elastic.192.168.1.170:9405.60000 =" | awk '{print $3}'`
f5_total_1=`cat $filepath1 | grep "elastic.192.168.1.170:9405.http =" | awk '{print $3}'`
#Filter_6
f6_interval_0_100=`cat $filepath1 | grep "elastic.192.168.1.170:9406.100 =" | awk '{print $3}'`
f6_interval_100_300=`cat $filepath1 | grep "elastic.192.168.1.170:9406.300 =" | awk '{print $3}'`
f6_interval_300_500=`cat $filepath1 | grep "elastic.192.168.1.170:9406.500 =" | awk '{print $3}'`
f6_interval_500_1000=`cat $filepath1 | grep "elastic.192.168.1.170:9406.1000 =" | awk '{print $3}'`
f6_interval_1000_3000=`cat $filepath1 | grep "elastic.192.168.1.170:9406.3000 =" | awk '{print $3}'`
f6_interval_3000_60000=`cat $filepath1 | grep "elastic.192.168.1.170:9406.60000 =" | awk '{print $3}'`
f6_total_1=`cat $filepath1 | grep "elastic.192.168.1.170:9406.http =" | awk '{print $3}'`
#Filter_7
f7_interval_0_100=`cat $filepath1 | grep "elastic.192.168.1.170:9407.100 =" | awk '{print $3}'`
f7_interval_100_300=`cat $filepath1 | grep "elastic.192.168.1.170:9407.300 =" | awk '{print $3}'`
f7_interval_300_500=`cat $filepath1 | grep "elastic.192.168.1.170:9407.500 =" | awk '{print $3}'`
f7_interval_500_1000=`cat $filepath1 | grep "elastic.192.168.1.170:9407.1000 =" | awk '{print $3}'`
f7_interval_1000_3000=`cat $filepath1 | grep "elastic.192.168.1.170:9407.3000 =" | awk '{print $3}'`
f7_interval_3000_60000=`cat $filepath1 | grep "elastic.192.168.1.170:9407.60000 =" | awk '{print $3}'`
f7_total_1=`cat $filepath1 | grep "elastic.192.168.1.170:9407.http =" | awk '{print $3}'`

sleep 60
wget -q http://$ip/sla_status -O $filepath2
total_2=`cat $filepath2 | grep "elastic.all.http =" | awk '{print $3}'`
f1_total_2=`cat $filepath2 | grep "elastic.192.168.1.170:9401.http =" | awk '{print $3}'`
f2_total_2=`cat $filepath2 | grep "elastic.192.168.1.170:9402.http =" | awk '{print $3}'`
f3_total_2=`cat $filepath2 | grep "elastic.192.168.1.170:9403.http =" | awk '{print $3}'`
f4_total_2=`cat $filepath2 | grep "elastic.192.168.1.170:9404.http =" | awk '{print $3}'`
f5_total_2=`cat $filepath2 | grep "elastic.192.168.1.170:9405.http =" | awk '{print $3}'`
f6_total_2=`cat $filepath2 | grep "elastic.192.168.1.170:9406.http =" | awk '{print $3}'`
f7_total_2=`cat $filepath2 | grep "elastic.192.168.1.170:9407.http =" | awk '{print $3}'`
rps=$[$total_2 - $total_1]
f1_rps=$[$f1_total_2 - $f1_total_1]
f2_rps=$[$f2_total_2 - $f2_total_1]
f3_rps=$[$f3_total_2 - $f3_total_1]
f4_rps=$[$f4_total_2 - $f4_total_1]
f5_rps=$[$f5_total_2 - $f5_total_1]
f6_rps=$[$f6_total_2 - $f6_total_1]
f7_rps=$[$f7_total_2 - $f7_total_1]
rps=$[$rps / 60]
f1_rps=$[$f1_rps / 60]
f2_rps=$[$f2_rps / 60]
f3_rps=$[$f3_rps / 60]
f4_rps=$[$f4_rps / 60]
f5_rps=$[$f5_rps / 60]
f6_rps=$[$f6_rps / 60]
f7_rps=$[$f7_rps / 60]


#echo "`date` - $ip: $total_2 - $total_1 = $rps"
#echo "`date` - $ip: $f1_total_2 - $f1_total_1 = $f1_rps"
#echo "`date` - $ip: $f2_total_2 - $f2_total_1 = $f2_rps"
#echo "`date` - $ip: $f3_total_2 - $f3_total_1 = $f3_rps"
#echo "`date` - $ip: $f4_total_2 - $f4_total_1 = $f4_rps"
#echo "`date` - $ip: $f5_total_2 - $f5_total_1 = $f5_rps"
#echo "`date` - $ip: $f6_total_2 - $f6_total_1 = $f6_rps"
#echo "`date` - $ip: $f7_total_2 - $f7_total_1 = $f7_rps"

#echo "$date $rps req/s | \
#0_100=$interval_0_100 100_300=$interval_100_300 300_500=$interval_300_500 500_1000=$interval_500_1000 1000_3000=$interval_1000_3000 3000_60000=$interval_3000_60000 rps=$rps \
#f1_0_100=$f1_interval_0_100 f1_100_300=$f1_interval_100_300 f1_300_500=$f1_interval_300_500 f1_500_1000=$f1_interval_500_1000 f1_1000_3000=$f1_interval_1000_3000 f1_3000_60000=$f1_interval_3000_60000 f1_rps=$f1_rps \
#f2_0_100=$f2_interval_0_100 f2_100_300=$f2_interval_100_300 f2_300_500=$f2_interval_300_500 f2_500_1000=$f2_interval_500_1000 f2_1000_3000=$f2_interval_1000_3000 f2_3000_60000=$f2_interval_3000_60000 f2_rps=$f2_rps \
#f3_0_100=$f3_interval_0_100 f3_100_300=$f3_interval_100_300 f3_300_500=$f3_interval_300_500 f3_500_1000=$f3_interval_500_1000 f3_1000_3000=$f3_interval_1000_3000 f3_3000_60000=$f3_interval_3000_60000 f3_rps=$f3_rps \
#f4_0_100=$f4_interval_0_100 f4_100_300=$f4_interval_100_300 f4_300_500=$f4_interval_300_500 f4_500_1000=$f4_interval_500_1000 f4_1000_3000=$f4_interval_1000_3000 f4_3000_60000=$f4_interval_3000_60000 f4_rps=$f4_rps \
#f5_0_100=$f5_interval_0_100 f5_100_300=$f5_interval_100_300 f5_300_500=$f5_interval_300_500 f5_500_1000=$f5_interval_500_1000 f5_1000_3000=$f5_interval_1000_3000 f5_3000_60000=$f5_interval_3000_60000 f5_rps=$f5_rps \
#f6_0_100=$f6_interval_0_100 f6_100_300=$f6_interval_100_300 f6_300_500=$f6_interval_300_500 f6_500_1000=$f6_interval_500_1000 f6_1000_3000=$f6_interval_1000_3000 f6_3000_60000=$f6_interval_3000_60000 f6_rps=$f6_rps \
#f7_0_100=$f7_interval_0_100 f7_100_300=$f7_interval_100_300 f7_300_500=$f7_interval_300_500 f7_500_1000=$f7_interval_500_1000 f7_1000_3000=$f7_interval_1000_3000 f7_3000_60000=$f7_interval_3000_60000 f7_rps=$f7_rps" >> /usr/local/libexec/nagios/check_elastic_resp_time.log

echo "Images Respons Timers & RPS $rps req/s | \
0_100=$interval_0_100 100_300=$interval_100_300 300_500=$interval_300_500 500_1000=$interval_500_1000 1000_3000=$interval_1000_3000 3000_60000=$interval_3000_60000 rps=$rps \
f1_0_100=$f1_interval_0_100 f1_100_300=$f1_interval_100_300 f1_300_500=$f1_interval_300_500 f1_500_1000=$f1_interval_500_1000 f1_1000_3000=$f1_interval_1000_3000 f1_3000_60000=$f1_interval_3000_60000 f1_rps=$f1_rps \
f2_0_100=$f2_interval_0_100 f2_100_300=$f2_interval_100_300 f2_300_500=$f2_interval_300_500 f2_500_1000=$f2_interval_500_1000 f2_1000_3000=$f2_interval_1000_3000 f2_3000_60000=$f2_interval_3000_60000 f2_rps=$f2_rps \
f3_0_100=$f3_interval_0_100 f3_100_300=$f3_interval_100_300 f3_300_500=$f3_interval_300_500 f3_500_1000=$f3_interval_500_1000 f3_1000_3000=$f3_interval_1000_3000 f3_3000_60000=$f3_interval_3000_60000 f3_rps=$f3_rps \
f4_0_100=$f4_interval_0_100 f4_100_300=$f4_interval_100_300 f4_300_500=$f4_interval_300_500 f4_500_1000=$f4_interval_500_1000 f4_1000_3000=$f4_interval_1000_3000 f4_3000_60000=$f4_interval_3000_60000 f4_rps=$f4_rps \
f5_0_100=$f5_interval_0_100 f5_100_300=$f5_interval_100_300 f5_300_500=$f5_interval_300_500 f5_500_1000=$f5_interval_500_1000 f5_1000_3000=$f5_interval_1000_3000 f5_3000_60000=$f5_interval_3000_60000 f5_rps=$f5_rps \
f6_0_100=$f6_interval_0_100 f6_100_300=$f6_interval_100_300 f6_300_500=$f6_interval_300_500 f6_500_1000=$f6_interval_500_1000 f6_1000_3000=$f6_interval_1000_3000 f6_3000_60000=$f6_interval_3000_60000 f6_rps=$f6_rps \
f7_0_100=$f7_interval_0_100 f7_100_300=$f7_interval_100_300 f7_300_500=$f7_interval_300_500 f7_500_1000=$f7_interval_500_1000 f7_1000_3000=$f7_interval_1000_3000 f7_3000_60000=$f7_interval_3000_60000 f7_rps=$f7_rps"
wget -q http://$ip/sla_purge -O $filepath3
rm $filepath1
rm $filepath2
