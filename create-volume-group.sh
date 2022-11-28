lsblk

# Check to see if you have any outstanding volume group
vgs

# Create a new vg
vgcreate mydata-vg /dev/sdb

# View New VG
vgdisplay -v