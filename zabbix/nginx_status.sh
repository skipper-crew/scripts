#!/bin/sh
# Script to fetch nginx statuses for zabbix
# Based on Tpl_Tribily_App_Nginx_Extended_v1.0 by krish@tribily.com
# License: GPLv2

# Set Variables

HOST="192.168.1.1"
PORT="80"
FTCH="fetch -q -o - "

# Functions to return nginx stats

active () {
        $FTCH "http://$HOST:$PORT/nginx_status" | grep 'Active' | awk '{print $NF}'
        }

reading () {
        $FTCH "http://$HOST:$PORT/nginx_status" | grep 'Reading' | awk '{print $2}'
        }

writing () {
        $FTCH "http://$HOST:$PORT/nginx_status" | grep 'Writing' | awk '{print $4}'
        }

waiting () {
        $FTCH "http://$HOST:$PORT/nginx_status" | grep 'Waiting' | awk '{print $6}'
        }

accepts () {
	$FTCH "http://$HOST:$PORT/nginx_status" | awk NR==3 | awk '{print $1}'
        }

handled () {
        $FTCH "http://$HOST:$PORT/nginx_status" | awk NR==3 | awk '{print $2}'
        }

requests () {
	$FTCH "http://$HOST:$PORT/nginx_status" | awk NR==3 | awk '{print $3}'
        }

# Run the requested function
$1