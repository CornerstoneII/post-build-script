#!/bin/bash
####################################################
# Name: create_lvm.sh
#
# Usage: Create a Logical Volume and Mount Point on CentOS
#
#####################################################

create_lvm() {

  # Check for root privileges
  if [[ $(/usr/bin/id -u) -ne 0 ]]; then
      echo "This script must be run as root."
      exit 1
  fi

  # Check if the required arguments were passed
  if [ $# -ne 4 ]; then
    echo "Error: Invalid number of arguments"
    exit 1
  fi

  # Create a new partition
  parted -s "$1" mklabel gpt mkpart primary ext4 0% 100%

  # Create a new volume group
  vgcreate "$2" "$1"1

  # Create a new logical volume
  lvcreate -L 10G -n "$3" "$2"

  # Create a new filesystem on the logical volume
  mkfs.ext4 /dev/"$2"/"$3"

  # Create a new mount point
  mkdir -p "$4"

  # Mount the logical volume
  mount /dev/"$2"/"$3" "$4"

  # Add an entry to /etc/fstab to persist the mount after a restart
  echo "/dev/$2/$3 $4 ext4 defaults 0 0" >> /etc/fstab
}

# Call the function to create the LVM
create_lvm "/dev/sdb" "vg1" "lv1" "/mnt/lvm"