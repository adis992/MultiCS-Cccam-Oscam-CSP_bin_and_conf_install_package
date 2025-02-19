process=`ps auxwww | grep cccam_2.1.3 | grep -v grep | awk '{print $1}'`
if [ -z "$process" ]; then
echo "Couldn't find CCcam running. Restarting server-binary" >> /var/cccamlog/cccam.check 
echo && date >>/var/cccamlog/cccam.check
/usr/local/bin/cccam_2.1.3 -d >> /var/cccamlog/CCcam.log & 
else echo "CCcam is still OK!" >> /var/cccamlog/cccam.check 
fi 
