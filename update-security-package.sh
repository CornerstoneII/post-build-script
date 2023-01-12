#!/bin/bash
#####################################################
# Name: rhel-update-security-package.sh
#
# Usage: This script will update missing security package on CentOS
#
#####################################################

rhel-update-security-package () {

    if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
    fi

    # Update installed packages
    sudo yum update -y

    # Install missing security package
    sudo yum -y install yum-security

    # Install the yum-cron package
    sudo yum -y install yum-cron

    # Update the installed security package
    sudo yum -y update --security

    # Clean up any left over files
    sudo yum clean all

    touch /etc/yum/yum-cron.conf

    # Enable automatic security updates
    sed -i 's/apply_updates = no/apply_updates = yes/g' /etc/yum/yum-cron.conf

    # Start the yum-cron service
    systemctl start yum-cron

    echo "Missing security package is now updated and automatic security updates are enabled."

}
rhel-update-security-package