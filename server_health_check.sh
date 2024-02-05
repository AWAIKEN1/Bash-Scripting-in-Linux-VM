#!/bin/bash

#Description: This script will perform a detailed health check of a Linux server

#Function to check CPU load
check_cpu() {
	local load=$(uptime | awk -F'load average: ' '{print $2}')
	IFS=',' read -r load1 load5 load15 <<< "$load"

	echo "1-minute Load Average: $load1"
	echo "5-minute Load Average: $load5"
	echo "15-minute Load Average: $load15"
}

#Function to check memory usage
check_memory() {
	echo "Memory Usage:"
    free -h | awk 'NR==2{printf "Total: %s\tUsed: %s\tFree: %s\n", $2, $3, $4}'
    echo "Swap Usage:"
    free -h | awk '/Swap/{printf "Total: %s\tUsed: %s\tFree: %s\n", $2, $3, $4}'
}

#Function to display system uptime 
show_uptime() {
	up=$(uptime -p | cut -c4- )
	since=$(uptime -s)
	cat << EOF
-----
This machine has been up for ${up}
It has been running since ${since}
-----
EOF
}

#Function to check network status
check_network() {
    echo "Network Status:"
    for interface in $(ls /sys/class/net/ | grep -v lo); do
        echo "Interface: $interface"
        local status=$(cat /sys/class/net/$interface/operstate)
        echo "Status: $status"
        local addr=$(ip addr show $interface | grep 'inet ' | awk '{print $2}')
        echo "IP Address: ${addr:-None}"
        local rx=$(cat /sys/class/net/$interface/statistics/rx_bytes)
        local tx=$(cat /sys/class/net/$interface/statistics/tx_bytes)
        echo "RX bytes: $rx, TX bytes: $tx"
        echo "-----------------------------------"
    done
}

#Function to check disk usage
check_disc() {
	echo "Disk Usage"
	df -h | awk '$NF=="/"{printf "Total: %s\tUsed: %s\tFree: %s\n", $2, $3, $4}'
}

#Function to ensure software's packages are up to date
check_updates() {
	echo "Available Software Updates:"
	sudo apt-get update
	sudo apt-get -s upgrade
}

#Function to check users currently logged in
check_users() {
	echo "Currently logged in Users:"
	who
	echo "---------------------------------"
}

check_cpu
check_memory
show_uptime
check_network
check_disc
check_updates
check_users
