#!bin/bash

#####################
# Author : A.Ranen Joseph Solomon
# Date : 13.10.2025
# Version : V1
# This Script is Used to find the System Health Check
#####################

#Function to Display System Uptime
get_uptime() {
        echo -n "System Uptime: "
        uptime -p
}

#Function to find number of CPU Core
get_cpu() {
        echo -n "CPU Cores: "
        nproc
}

#Function to fing the Memory Usage
get_memory_usage(){
        echo -n "Memory Usage: "
        free -h | grep Mem | awk '{print $4 " / " $2 " (Avaibale Memory: " $4 ")"}'
}

#Function to get the Disk space Remaining
get_disk_space(){
        echo -n "Disk Space Remaining: "
        df -h | grep ' /$' | awk '{print $6 "used on / (Disk Space Remaining: " 100-$5 "% )"}'
}

#Function to get active processes
get_active_process(){
        echo -n "Active Processes: "
        ps -ef | wc -l
}

#Function to get current logged in users
get_current_users(){
        echo -n "Current Users: "
        who | wc -l
}

#Function to display network activity
get_network_activity(){
        echo "-----Network Activity-----"
        echo -n "Active Connections: "
        netstat -tuln | wc -l
}

echo "-----System Health Report-----"

get_uptime
get_cpu
get_memory_usage
get_disk_space
get_active_process
get_current_users

get_network_activity
echo "-----End of Report-----"
