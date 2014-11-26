#!/usr/local/bin/bash

device=$1

rops () {
	iostat -dx -h 10 2 | grep $device | tail -n 1 | awk '{print $2}'
	}
wops () {
	iostat -dx -h 10 2 | grep $device | tail -n 1 | awk '{print $3}'
	}
rps () {
	iostat -dx -h 10 2 | grep $device | tail -n 1 | awk '{print $4}'
	}
wps () {
	iostat -dx -h 10 2 | grep $device | tail -n 1 | awk '{print $5}'
	}
svc_t () {
	iostat -dx -h 10 2 | grep $device | tail -n 1 | awk '{print $7}'
	}
busy () {
	iostat -dx -h 10 2 | grep $device | tail -n 1 | awk '{print $8}'
	}
$2
