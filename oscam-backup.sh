#!/bin/sh
####################################
# thatfellow - linuxsat-support.com
# Backup Oscam Configs script.
####################################

# What to backup. 
backup_files="/var/script /var/etc/*CCcam* /usr/local/etc /etc/crontab /etc/rc.local"

# Where to backup to.
dest="/var/oscam-configs-backup"

# Create archive filename.
datetime=$(date +"%Y-%m-%d-%H.%M.%S")
hostname=$(hostname -s)
archive_file="$datetime-oscam_configs_backup-$hostname.tgz"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
tar czf $dest/$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest