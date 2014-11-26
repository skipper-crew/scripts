#!/bin/sh

op=$1
case $op in

    "--up")

#	filter 1
	eval "ssh -g -i /usr/home/skipper/.ssh/id_rsa -L 194.84.36.8:9514:192.168.1.67:9204 -N skipper@192.168.1.67 & "
	echo $! > /var/run/ssh_tunel11.pid
#	filter 2
	eval "ssh -g -i /usr/home/skipper/.ssh/id_rsa -L 194.84.36.8:9524:192.168.1.74:9204 -N skipper@192.168.1.74 & "
	echo $! > /var/run/ssh_tunel12.pid
#	filter 3
	eval "ssh -g -i /usr/home/skipper/.ssh/id_rsa -L 194.84.36.8:9534:192.168.1.61:9204 -N skipper@192.168.1.61 & "
	echo $! > /var/run/ssh_tunel13.pid
#	filter 4
	eval "ssh -g -i /usr/home/skipper/.ssh/id_rsa -L 194.84.36.8:9544:192.168.1.63:9204 -N skipper@192.168.1.63 & "
	echo $! > /var/run/ssh_tunel14.pid
#	filter 5
	eval "ssh -g -i /usr/home/skipper/.ssh/id_rsa -L 194.84.36.8:9554:192.168.1.66:9204 -N skipper@192.168.1.66 & "
	echo $! > /var/run/ssh_tunel15.pid
#	filter 6
	eval "ssh -g -i /usr/home/skipper/.ssh/id_rsa -L 194.84.36.8:9564:192.168.1.68:9204 -N skipper@192.168.1.68 & "
	echo $! > /var/run/ssh_tunel16.pid
#	filter 7
	eval "ssh -g -i /usr/home/skipper/.ssh/id_rsa -L 194.84.36.8:9574:192.168.1.171:9204 -N skipper@192.168.1.171 & "
	echo $! > /var/run/ssh_tunel17.pid
#	full 1
	eval "ssh -g -i /usr/home/skipper/.ssh/id_rsa -L 194.84.36.8:9516:192.168.1.73:9206 -N skipper@192.168.1.73 & "
	echo $! > /var/run/ssh_tunel21.pid
#	full 3
	eval "ssh -g -i /usr/home/skipper/.ssh/id_rsa -L 194.84.36.8:9526:192.168.1.79:9206 -N skipper@192.168.1.79 & "
	echo $! > /var/run/ssh_tunel22.pid
	;;

    "--down")

	kill -TERM `cat /var/run/ssh_tunel11.pid`
	kill -TERM `cat /var/run/ssh_tunel12.pid`
	kill -TERM `cat /var/run/ssh_tunel13.pid`
	kill -TERM `cat /var/run/ssh_tunel14.pid`
	kill -TERM `cat /var/run/ssh_tunel15.pid`
	kill -TERM `cat /var/run/ssh_tunel16.pid`
	kill -TERM `cat /var/run/ssh_tunel17.pid`
	kill -TERM `cat /var/run/ssh_tunel21.pid`
	kill -TERM `cat /var/run/ssh_tunel22.pid`
	;;

    "--help")
        printf "\t--up\t- to run tunels\n\t--down\t- to drop tunels\n";
        ;;

    *)
        echo "Unknown parameter. See --help"
        ;;
esac
