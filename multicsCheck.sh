#!/bin/sh 
process=`ps auxwww | grep multics | grep -v grep | awk '{print $1}'`
if [ -z "$process" ]; then
echo "Couldn't find Multics running. Restarting server-binary" >> /var/log/multics.check 
echo && date >>/var/log/.check
/usr/local/bin/multics >> /var/log/Multics.log & 
else echo "Multics is still OK!" >> /var/log/multics.check 
fi 
