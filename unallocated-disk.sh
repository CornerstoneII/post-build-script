# To see in TB:

parted /dev/sda unit TB print free | grep 'Free Space' | tail -n1 | awk '{print $3}'

# To see in GB:
 parted /dev/sda unit GB print free | grep 'Free Space' | tail -n1 | awk '{print $3}'

# To see in MB:
 parted /dev/sda unit MB print free | grep 'Free Space' | tail -n1 | awk '{print $3}'

# To see in bytes:
 parted /dev/sda unit B print free | grep 'Free Space' | tail -n1 | awk '{print $3}'

# To see in %:
 parted /dev/sda unit '%' print free | grep 'Free Space' | tail -n1 | awk '{print $3}'

# To see in sectors:
 parted /dev/sda unit s print free | grep 'Free Space' | tail -n1 | awk '{print $3}'

 # Or

 fdisk -l /dev/sdf

 # Or

 for disk in /dev/sd[a-z]; do
  parted $disk print free |
  grep -q "Free Space" && echo "unallocated space on $disk"
done

# Or

parted /dev/sda

# then inside parted type "print free"
