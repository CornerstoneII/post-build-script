#!/bin/bash
#####################################################
# Name: install_and_start_ntp_package.sh
#
# Usage: Install NTP package on CentOS
#
#####################################################

install_and_start_ntp_package() {

  # Check if the script is being run as root
  if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root"
    exit 1
  fi

  # Check if an argument was passed to the script
  if [ $# -eq 0 ]; then
    echo "Error: No package specified"
    exit 1
  fi

  # Check if the package is already installed
  if ! rpm -q "$1" >/dev/null 2>&1; then
    # Install the NTP package
    yum install -y "$1"
  fi

  # Check if the NTP service is running
  if ! systemctl is-active --quiet ntpd; then
    # Start the NTP service
    systemctl start ntpd
  fi
}

# Call the function to install and start the NTP package
install_and_start_ntp_package "$1"