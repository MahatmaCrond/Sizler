#!/bin/bash

# Sizler - Monitor disk usage on Ubuntu - Written in bash by Jeremy Russell
# This script utilizes ssmtp and routes emails through gmail 
# Install ssmtp on Ubuntu: sudo apt-get install ssmtp
# Configure Gmail how you want SMTP to be routed
# Add a cronjob with "crontab -e" and set it like this (runs every 8 hours): 0 */8 * * * /home/username/sizler.sh

# In addition to the cronjob, you can copy this to your .profile to run when logging into SSH, etc

# Also outputs an updated status of disk usage into /tmp



## Bash colours because we like nice things.
YELLOW="\033[01;33m"
BLUE="\033[01;34m"
BOLD="\033[01;01m"
RED="\033[01;31m"
GREEN="\033[1;32m"
RESET="\033[00m"


SIZE=`echo $(df -h | grep .\/$ | awk 'END {print $5}') |tr -d [=%=]`

if [ $SIZE -gt 96 ]; then
	echo -e "${RED}DISK SPACE CRITICAL! CLEAR SOME SPACE! -Admin${RESET}" | sudo ssmtp -vvv email@gmail.com
else	
	printf "\n"
	printf "\n"
	echo -e "${YELLOW}Sizler - Disk Utilization Cron Script${RESET}"
	echo "=================================================================================================="
	printf "\n"
	echo -e "\n$(date)" > /tmp/disk_usage.txt
	printf "\n"
	echo -e "There is currently ${GREEN}$((100 - $SIZE))%${RESET} disk space remaining."
	echo "Disregard this unless utilization gets into the mid-high 90's, or like 6% - 1%."
	printf "\n"
	printf "\n"
	echo -e "\n$(date)" > /tmp/disk_usage.txt
	echo -e "\nThere is currently $((100 - $SIZE))% disk space remaining.\n" >> /tmp/disk_usage.txt
fi
