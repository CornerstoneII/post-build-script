# Creating a Disk Partition in Linux
# List the partitions in Linux
parted -l

# To manipulate disk partitions
parted /dev/sdb

# At the parted prompt, make a partition table by running mklabel msdos or gpt, then enter Y/es to accept
(parted) mklabel msdos

# create a new primary partition on the hard disk and print the partition table
(parted) mkpart primary ext4 0 10024MB
(parted) print

# create the file system type on each partition, you can use the mkfs utility (replace ext4 with the file system type you wish to use).
mkfs.ext4 /dev/sdb1
mkfs.ext4 /dev/sdb2

# to access the storage space on the partitions, you need to mount them by creating the mount points and mount the partitions
mkdir -p /mnt/sdb1
mkdir -p /mnt/sdb2
mount -t auto /dev/sdb1 /mnt/sdb1
mount -t auto /dev/sdb2 /mnt/sdb2

# check if the partitions are actually mounted
df -hT