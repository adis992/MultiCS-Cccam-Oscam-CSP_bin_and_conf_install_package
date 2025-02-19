#!/bin/sh
####################################
# Backup Multics Configs script.
# smobile_2004 http://multics.info/forums/
####################################

# What to backup. (Add or edit the folders/files below to cover your needs)
backup_files="/var/script /usr/local/bin /etc/crontab /etc/rc.local /var/etc"

# Where to backup to.
dest="/var/multics-configs-backup"

# Create archive filename.
datetime=$(date +"%Y-%m-%d-%H.%M.%S")
hostname=$(hostname -s)
archive_file="$datetime-multics_configs_backup-$hostname.tgz"

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
