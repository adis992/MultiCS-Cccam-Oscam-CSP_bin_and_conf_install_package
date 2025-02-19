#!/bin/sh
#Automated Installation script
#Purpose: Installing CCcam & Oscam & Multics & Csp Debian 32 & 64 Bit system.
#Originally written by: Youknowhoo (R.I.P) updated by thatfellow
#
#Requirements: Debian 32 & 64 Bit
#            Installation Package.
#put the MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package in /tmp
#put this script in /tmp then chmod 755 this script

OWNER=$(grep 1000:1000: /etc/passwd|cut -f1 -d':')
txtrst=$(tput sgr0) # Text reset
txtred=$(tput setab 1) # Red Background
textpurple=$(tput setab 5) #Purple Background
txtgreen=$(tput bold ; tput setaf 2) # GreenBold
arch=$(getconf LONG_BIT)

######################
#Check Files Prestnt##
######################
echo "${txtgreen}Script for automated CCcam/Oscam/Multics/Csp installation ${txtrst}"
sleep 2
chown $OWNER /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package
sleep 2
if [ ! -e  /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package ] ; then
echo "${txtgreen}WARNING !!!!!!! ${txtrst}"
echo "${txtgreen}Install package is not in tmp directory ${txtrst}"
echo "${txtgreen}please check if its there ${txtrst}"
fi
######################
#Check linux x86 x64##
######################
echo "${txtred}Initial OS Test ${txtrst}"
echo "${txtgreen}Check linux architecture x32-bit or x64-bit ${txtrst}"
echo "${textpurple}$arch-bit OS Detected${txtrst}"
echo " "
sleep 3
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/multics-x$arch /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/multics
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/oscam-x$arch /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/oscam
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/CCcam-x$arch /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/cccam_2.1.3
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/csp-x$arch /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/csp
######################
##Make Directories####
######################
echo "${txtred}Step 1 ${txtrst}"
echo "${txtgreen}make directorys and show them to the owner ${txtrst}"
sleep 3
#
mkdir /var/etc
chown $OWNER /var/etc
#
mkdir /var/keys
chown $OWNER /var/keys
#
mkdir /var/script
chown $OWNER /var/script
#
mkdir /var/config
chown $OWNER /var/config
#
mkdir /var/backup
chown $OWNER /var/backup
#
mkdir /var/cccamlog
chown $OWNER /var/cccamlog
#
chown $OWNER /usr/local/bin
sleep 2
mkdir /var/oscam-configs-backup
######################
######Move Multics######
######################
echo "${txtred}Step 2 ${txtrst}"
echo "${txtgreen}Moving CCcam executable to correct folder ${txtrst}"
sleep 3
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/multics /usr/local/bin
chmod 755 /usr/local/bin/multics
sleep 2
######################
######Move CCcam######
######################
echo "${txtred}Step 3 ${txtrst}"
echo "${txtgreen}Moving CCcam executable to correct folder ${txtrst}"
sleep 3
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/cccam_2.1.3 /usr/local/bin
chmod 755 /usr/local/bin/cccam_2.1.3
sleep 2
######################
######Move Oscam######
######################
echo "${txtred}Step 4 ${txtrst}"
echo "${txtgreen}Moving oscam executable to correct folder ${txtrst}"
sleep 3
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/oscam /usr/local/bin
chmod 755 /usr/local/bin/oscam
######################
######Move csp ######
######################
echo "${txtred}Step 5 ${txtrst}"
echo "${txtgreen}Moving CCcam executable to correct folder ${txtrst}"
sleep 3
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/csp /usr/local/
chmod 755 /usr/local/csp/cardproxy.sh
sleep 2
######################
#####Move Scripts#####
######################
echo "${txtred}Step 6 ${txtrst}"
echo "${txtgreen}Move the scripts to /var/script ${txtrst}"
sleep 3
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/*.sh /var/script
######################
####Chmod Scripts#####
######################
echo "${txtred}Step 7 ${txtrst}"
echo "${txtgreen}chmod 755 the scripts ${txtrst}"
sleep 3
chmod 755 /var/script/oscam-backup.sh
chmod 755 /var/script/configupdate.sh
chmod 755 /var/script/LogCleanUp.sh
chmod 755 /var/script/CCcamCheck.sh
chmod 755 /var/script/OscamCheck.sh
chmod 755 /var/script/keyupdater.sh
chmod 755 /var/script/multicsCheck.sh
chmod 755 /var/script/multics-backup.sh
######################
##Autostart rc.local##
######################
echo "${txtred}Step 8 ${txtrst}"
echo "${txtgreen}make rc.local for autostart at boot ${txtrst}"
sleep 3
chown $OWNER /etc/rc.local
rm /etc/rc.local
sleep 2
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/rc.local /etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/CCcam.channelinfo /var/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/CCcam.providers /var/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/CCcam.prio /var/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/CCcam.cfg /var/etc/
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/oscam.conf /usr/local/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/oscam.server /usr/local/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/oscam.user /usr/local/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/oscam.services /usr/local/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/oscam.srvid /usr/local/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/blue_shadow-v_1.css /usr/local/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/multics.cfg /var/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/ip2country.csv /var/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/multics.css /var/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/baddcw.cfg /var/etc
mv /tmp/MultiCS-Cccam-Oscam-CSP_bin_and_conf_install_package/cache.cfg /var/etc
sleep 1
chmod 755 /etc/rc.local
sleep 1
chown root /etc/rc.local
######################
####Setup Crontab#####
######################
echo "${txtred}Step 9 ${txtrst}"
echo "${txtgreen}making crontabs in /etc/crontab, remember no crontab -e!!!! ${txtrst}"
sleep 3
echo "59 23 * * * root /var/script/oscam-backup.sh" >> /etc/crontab
echo "57 06 * * * root killall multics >> /etc/crontab
echo "57 06 * * * root killall cccam_2.1.3" >> /etc/crontab
echo "57 06 * * * root killall oscam" >> /etc/crontab
echo "57 06 * * * root killall cardproxy.sh" >> /etc/crontab
echo "57 06 * * * root /var/script/keyupdater.sh" >> /etc/crontab
echo "58 06 * * * root /usr/local/bin/oscam -b" >> /etc/crontab
echo "59 03 * * * root /usr/local/bin/multics -b >> /etc/crontab
echo "59 06 * * * root /usr/local/bin/cccam_2.1.3" >> /etc/crontab
echo "59 06 * * * root /usr/local/csp/cardproxy.sh" >> /etc/crontab
echo "*/5 * * * * root /var/script/CCcamCheck.sh" >> /etc/crontab
echo "*/5 * * * * root /var/script/OscamCheck.sh" >> /etc/crontab
echo "*/5 * * * * root /var/script/multics-backup.sh" >> /etc/crontab
echo "*/5 * * * * root /var/script/multicsCheck.sh" >> /etc/crontab
echo "03 07 * * 6 root /var/script/LogCleanUp.sh >> /var/cccamlog/CleanUp.log" >> /etc/crontab
######################
####Instal Packages###
######################
echo "${txtred}Step 10 ${txtrst}"
echo "${txtgreen}installing the software needed for CCcam/Oscam/Multics/Csp server ${txtrst}"
sleep 3
apt-get update
sleep 4
yes | apt-get install openssh-server
sleep 2
yes | apt-get install php5 
sleep 2
yes | apt-get install libpcsclite1
sleep 2
yes | apt-get install libpcsclite-dev
sleep 2
yes | apt-get install openssl
sleep 2
yes | apt-get install libssl-dev
sleep 2
yes | apt-get install pcscd
sleep 2
yes | apt-get install pcsc-tools
sleep 2
yes | apt-get install openjdk-7-jre
sleep 2
######################
####Restart System####
######################
echo "${txtred}Job Done!  Restarting Server ${txtrst}"
echo "${txtgreen}cowntdown to restart ${txtrst}"
sleep 2
echo "${txtgreen}1 ${txtrst}"
sleep 1
echo "${txtgreen}2 ${txtrst}"
sleep 1
echo "${txtgreen}3 ${txtrst}"
sleep 2
echo "${txtgreen}4 ${txtrst}"
sleep 1
echo "${txtgreen}5 ${txtrst}"
sleep 1
echo "${txtgreen}6 ${txtrst}"

echo "${txtgreen}rebooting now see you in a minute ${txtrst}"


reboot
