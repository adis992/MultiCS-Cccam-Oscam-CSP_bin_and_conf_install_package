#!/bin/bash
#Script to process new config and backup old one
#Script designed and written by CC_Share
SOURCE=/var/config
TARGET=/var/etc
FILE=CCcam.cfg
BACKUPDIR=/var/backup
CONFIGOLD=CCcam.old
if test -f $SOURCE/$FILE ; then
echo "New Config Present"
if test -d $BACKUPDIR ; then
if test -f $BACKUPDIR/$CONFIGOLD ; then
echo "Removing OLD config file from backup directory"
rm $BACKUPDIR/$CONFIGOLD
else
echo "No OLD config to remove."
fi
if test -f $BACKUPDIR/$FILE ; then
echo "Renaming Backup to old config"
cp $BACKUPDIR/$FILE $BACKUPDIR/$CONFIGOLD
rm $BACKUPDIR/$FILE
else
echo "No Backupfile present yet"
fi
if test -f $TARGET/$FILE ; then
echo "Copying Original config to Backup directory"
cp $TARGET/$FILE $BACKUPDIR
rm $TARGET/$FILE
else
echo "No Original Config File Present!?!?"
fi
else
echo "Backup directory does not exist."
echo "making new directory"
mkdir $BACKUPDIR
if test -f $TARGET/$FILE ; then
echo "Copying Original config to Backup directory"
cp $TARGET/$FILE $BACKUPDIR
else
echo "No Original Config File Present!?!?"
fi
fi
echo "Moving New config file to "$TARGET
cp $SOURCE/$FILE $TARGET
rm $SOURCE/$FILE
else
echo "No New Config present, Nothing to process"
fi
exit
