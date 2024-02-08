# Bash Scripting Practice on a Linux VM

## Overview
This repository documents my journey in practicing Bash scripting on a Linux virtual machine. As part of my learning process, I am creating and executing various scripts

## Server Health Check Script

### Description
The server health check script is a Bash script designed to assess and report on various aspects of a Linux server's performance. This includes CPU load, memory usage, disk space, and more. The script is part of my larger effort to enhance my skills in Bash scripting and Linux system administration.

### Features
- **CPU Load Check**: Reports the 1-minute, 5-minute, and 15-minute load averages.
- **Memory Usage Check**: Displays the total, used, and free memory.
- **Machine Uptime Check**: Displays how long your Linux VM has been running since it was initially booted. 
- **Network Statistics**:Provides a comprehensive overview of the network interfaces and traffic statistics on your Linux server. Shows all the  network interfaces available on the server, including their status (up or down), IP addresses, and other relevant configurations. It shows the traffic statistics, detailing the amount of data received (RX) and transmitted (TX) on each network interfaces.
More features to be added as I progress in my learning.
- **Check Software Updates**: Displays information about available software updates on a Linux seerver using the APT pacakge manager. It uses APT to refresh the package lists and simulate the upgrate process, providing information on available software updates without making any actual changes tot the system. 
- **Disk usage check**: This feature provides insight into the storage utilisation on your Linux server. Using the 'df' command to gather information about the disk space usage focusing on the root file system("/"). Showcases the total, used and free disk space.  
- **User check**: This function will show you what users are currently logged into the Linux Virtual Machine


## Getting Started

### Prerequisites
- Access to a Linux server or a virtual machine where Bash scripts can be executed.
- Appropriate permissions to execute and test scripts on the server.

### Installing and Usage
1. Clone this repository to your Linux environment:
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   ```
2. Navigate to the directory containing the script:
   ```bash
   cd your-repo-name
   ```
3. Make the server health check script executable:
   ```bash 
   chomod +x server_health_check.sh
   ```
4. Execute the script to check the server's health:
   ```bash
   ./server_health_check.sh
   ```

## Learning Journey

This repository is part of my ongoing learning journey in Linux system administration and Bash scripting. As I continue to learn and experiment, I will update this repository with new scripts and enhancements to existing ones.

## Contributions
Feedback and contributions are welcome as they will help me learn and improve my scripting skills.

## License 
This project is open source and available under MIT License 


