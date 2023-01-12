#!/bin/bash
#####################################################
# Name: rhel-create-log-capture-history.sh
#
# Usage: # This script will enable secondary logs to capture root history on CentOS
#
#####################################################

rhel-create-log-capture-history () {
    read -r programname
    # Create a directory for the secondary logs
    mkdir -p /var/logs/root_history

    # Create and edit the configuration file for the secondary logs
    cat > /etc/rsyslog.d/root_history.conf

    # Log all root commands to a secondary log file
    if [ "$programname" == 'root' ]; then /var/logs/root_history/root_history.log & stop
    fi
    # Restart the rsyslog service
    /etc/init.d/rsyslog restart

    echo "Secondary logs to capture root history is now enabled."

}
rhel-create-log-capture-history