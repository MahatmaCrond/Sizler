# Sizler
Actively monitor and send email alerts about disk utilization for AWS or other Linux instances

## Details
- This script utilizes ssmtp and routes emails through gmail 

## Install 
- Install ssmtp on Ubuntu: sudo apt-get install ssmtp
- Configure Gmail how you want SMTP to be routed
- Add a cronjob with "crontab -e" and set it like this (runs every 8 hours): 0 */8 * * * /home/username/sizler.sh

## Notes
- In addition to the cronjob, you can copy this to your .profile to run when logging into SSH, etc
- The script also outputs an updated status of disk usage into /tmp
