# Step 1: Confirm DNS is configured correctly:

cat /etc/resolv.conf

systemctl disable systemd-resolved

systemctl stop systemd-resolved

# Step 2: Install required packages

apt -y install realmd libnss-sss libpam-sss sssd sssd-tools adcli samba-common-bin oddjob oddjob-mkhomedir packagekit

# Step 3: Discover Active Directory domain on Debian

<<comment
 realm discover example.com

 Replace example.com with your valid AD domain.
comment

# Step 4: Join Ubuntu 18.04 / Debian 10 To Active Directory (AD) domain

<<comment
An AD administrative user account is required for integrating your Linux machine with Windows Active Directory domain. Check and confirm AD admin account and the password.

The realm join command will set up the local machine for use with a specified domain by configuring both the local system services and the entries in the identity domain.

realm join -U Administrator example.com

Where:

    Administrator is the name of admin account used to integrate machine to AD.
    example.com is the name of AD domain
    The command first attempts to connect without credentials, but it prompts for a password if required.

comment