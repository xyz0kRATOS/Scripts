#!/bin/bash
# Simple System Information Script (Non-Interactive)

echo "============================="
echo "     SYSTEM INFORMATION      "
echo "============================="

echo "Hostname: $(hostname)"
echo "Date & Time: $(date)"
echo "Uptime: $(uptime -p)"
echo "OS Version: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '\"')"
echo "Kernel Version: $(uname -r)"
echo "CPU Info: $(lscpu | grep 'Model name' | cut -d: -f2)"
echo "Memory Usage:"
free -h
echo "Disk Usage:"
df -h --total | grep total
echo "IP Address: $(hostname -I | awk '{print $1}')"
echo "Current Users Logged In:"
who
echo "Running Processes: $(ps -e | wc -l)"

echo "============================="
echo "      END OF REPORT          "
echo "============================="
