#!/bin/bash

# mysql-master - 240
# mysql-slave1 - 241
# mysql-slave2 - 242
# mysql-slave3 - 243

echo `date`
# Переключаем проверку доступности mysql в monit на mysql-slave2
sed -i 's|192.168.1.240|192.168.1.241|g' /etc/monit/monitrc
/etc/init.d/monit reload

# Имитируем падение сервера(переключение виртуального ip адреса) на случай, если сервер работает, но mysql по какой-то причине не отвечает
ssh -i /home/skipper/.ssh/id_rsa skipper@192.168.1.240 "sudo killall -USR2 ucarp"

# Останавливаем все slave'ы
mysql -h 192.168.1.241 -u admin -padmin -e "stop slave;" cluster
mysql -h 192.168.1.242 -u admin -padmin -e "stop slave;" cluster
mysql -h 192.168.1.243 -u admin -padmin -e "stop slave;" cluster

# Ждем завершения запросов
sleep 1

# Записываем master-позицию на mysq-slave1
master_file=`mysql -h 192.168.1.241 -u admin -padmin -e "show master status\G"| grep File | awk '{print $2}'`
master_position=`mysql -h 192.168.1.241 -u admin -padmin -e "show master status\G"| grep Position | awk '{print $2}'`

# Снимаем read_only с mysql-slave1
mysql -h 192.168.1.241 -u admin -padmin -e "set global read_only=OFF;" cluster
# Переключаем репликацию на новый master сервер (mysql-slave1)
mysql -h 192.168.1.242 -u admin -padmin -e "change master to MASTER_HOST='192.168.1.241', MASTER_USER='repl', MASTER_PASSWORD='slavepass', MASTER_LOG_FILE = '$master_file', MASTER_LOG_POS = $master_position;" cluster
mysql -h 192.168.1.243 -u admin -padmin -e "change master to MASTER_HOST='192.168.1.241', MASTER_USER='repl', MASTER_PASSWORD='slavepass', MASTER_LOG_FILE = '$master_file', MASTER_LOG_POS = $master_position;" cluster
# Запускаем 
mysql -h 192.168.1.242 -u admin -padmin -e "start slave;" cluster
mysql -h 192.168.1.243 -u admin -padmin -e "start slave;" cluster

