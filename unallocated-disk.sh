#!/bin/bash
#####################################################
# Name: identify-unallocated-disk.sh
#
# Usage:
#   This command will list all the disks connected to the system,
#   along with their size and partition table.
#   Un-allocated disks will be listed with a 'none'
#   label in the partition table.
#
#####################################################

identify-unallocated-disk () {
  #check for root privileges
  if [[ $(/usr/bin/id -u) -ne 0 ]]; then
      echo "This script must be run as root."
      exit 1
  fi

  #list all disks and partitions
  DISKS=$(lsblk -o NAME,TYPE | grep disk | awk '{print $1}')

  #scan for unallocated disks
  UNALLOCATED_DISKS=()
  for disk in $DISKS; do
      PARTITIONS=$(parted -s /dev/$disk print | grep 'Partition Table' | awk '{print $3}')
      if [ "$PARTITIONS" == "unknown" ]; then
          UNALLOCATED_DISKS+=($disk)
      fi
  done

  #print results
  if [ ${#UNALLOCATED_DISKS[@]} -eq 0 ]; then
      echo "No unallocated disks found."
  else
      echo "Unallocated disks:"
      for disk in ${#UNALLOCATED_DISKS[@]}; do
          echo "- $disk"
      done
  fi
}

identify-unallocated-disk