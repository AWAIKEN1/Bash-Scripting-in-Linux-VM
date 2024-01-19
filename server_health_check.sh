#!/bin/bash

#Description: This script will perform a detailed health check of a Linux server


check_cpu() {
	local load=$(uptime | awk -F'load average: ' '{print $2}')
	IFS=',' read -r load1 load5 load15 <<< "$load"

	echo "1-minute Load Average: $load1"
	echo "5-minute Load Average: $load5"
	echo "15-minute Load Average: $load15"
}
	
check_cpu
	
