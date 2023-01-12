#!/bin/bash
#####################################################
# Name: rhel-clear-log-job.sh
#
# Usage: This script will create a cron job to clear log files on CentOS
#
#####################################################

rhel-clear-log-job () {

    # Install the cronie package
    yum -y install cronie

    # Start the cron service
    systemctl start crond

    # Create a directory to store log files
    mkdir -p /var/logs/log_backup

    # Create a cron job to run every day at midnight
    echo "0 0 * * * root /usr/bin/find /var/logs/* -mtime +7 -exec mv {} /var/logs/log_backup \;" > /etc/cron.d/log_clear

    # Make sure the cron job is executable
    chmod +x /etc/cron.d/log_clear

    # Restart the cron service
    systemctl restart crond

    echo "Cron job to clear log files is now configured."

}
rhel-clear-log-job
