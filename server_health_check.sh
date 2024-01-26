#!/bin/bash

#Description: This script will perform a detailed health check of a Linux server


check_cpu() {
	local load=$(uptime | awk -F'load average: ' '{print $2}')
	IFS=',' read -r load1 load5 load15 <<< "$load"

	echo "1-minute Load Average: $load1"
	echo "5-minute Load Average: $load5"
	echo "15-minute Load Average: $load15"
}

check_memory() {
	echo "Memory Usage:"
    free -h | awk 'NR==2{printf "Total: %s\tUsed: %s\tFree: %s\n", $2, $3, $4}'
    echo "Swap Usage:"
    free -h | awk '/Swap/{printf "Total: %s\tUsed: %s\tFree: %s\n", $2, $3, $4}'
}

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

check_cpu
check_memory
show_uptime
check_network
