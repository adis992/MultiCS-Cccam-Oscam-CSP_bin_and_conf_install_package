#!/bin/sh 
process=`ps auxwww | grep oscam | grep -v grep | awk '{print $1}'`
if [ -z "$process" ]; then
echo "Couldn't find Oscam running. Restarting server-binary" >> /var/cccamlog/oscam.check 
echo && date >>/var/cccamlog/oscam.check
/usr/local/bin/oscam >> /var/cccamlog/Oscam.log & 
else echo "Oscam is still OK!" >> /var/cccamlog/oscam.check 
fi 
