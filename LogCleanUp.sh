#!/bin/sh
# Script to cleanup log files
# Originally written by: Youknowhoo (R.I.P) scripts combined by A.

OWNER=$(grep 1000:1000: /etc/passwd|cut -f1 -d':')
TARGETDIR_1=/tmp
TARGETDIR_2=/var/cccamlog
FILE_1=warning.txt
FILE_2=cccam.check
FILE_3=oscam.check
FILE_4=CCcam.log
FILE_5=Oscam.log

echo && date

if test -f $TARGETDIR_1/$FILE_1 ; then
       echo "warning text present!"
       chown $OWNER $TARGETDIR_1/$FILE_1
       rm $TARGETDIR_1/$FILE_1
       else
       echo "No warning text present! Nothing to remove"
       fi

          if test -f $TARGETDIR_2/$FILE_2 ; then
               echo "CCcam Check File present!"
               chown $OWNER $TARGETDIR_2/$FILE_2
               rm $TARGETDIR_2/$FILE_2 
               else
               echo "No CCcam Check File present! Nothing to remove"
               fi
          if test -f $TARGETDIR_2/$FILE_3 ; then
               echo "Oscam Check File present!"
               chown $OWNER $TARGETDIR_2/$FILE_3
               rm $TARGETDIR_2/$FILE_3 
               else
               echo "No Oscam Check File present! Nothing to remove"
               fi    
          
	  if test -f $TARGETDIR_2/$FILE_4 ; then
               echo "CCcam Debug Log precent!"
               chown $OWNER $TARGETDIR_2/$FILE_4
               rm $TARGETDIR_2/$FILE_4
               else
               echo "No CCcam Debug Log precent! Nothing to remove"
               fi 
	  if test -f $TARGETDIR_2/$FILE_5 ; then
               echo "Oscam Debug Log precent!"
               chown $OWNER $TARGETDIR_2/$FILE_5
               rm $TARGETDIR_2/$FILE_5
               else
               echo "No Oscam Debug file present! Nothing to remove"
               fi 
exit