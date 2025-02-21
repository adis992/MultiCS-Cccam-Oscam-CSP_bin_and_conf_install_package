#!/bin/bash 
#################################################################
# CSP startup script 
# By Bowman 2007
# Modified by Spokryttare 2007-09-18
# Added enviorment variabels for use in the startup of csp
# deamon, change cwd to csp directory and added restart choice
################################################################# 
# Edit DAEMONPATH to match the proxy install dir
################################################################# 
DAEMONPATH=/usr/local/csp
DAEMON=$DAEMONPATH/lib/cardservproxy.jar

NAME=Cardservproxy
DESC="Cardservproxy Daemon"

case "`uname -s`" in

  'CYGWIN'*)
    SYSTEM="Cygwin"
  ;;

  'Linux')
    SYSTEM="Linux"
  ;;

  'OSF1')
    SYSTEM="Tru64"
  ;;

  'SunOS')
    SYSTEM="Solaris"
  ;;

  *)
    SYSTEM="Unknown"
  ;;

esac

PID_FILE=$DAEMONPATH/cardservproxy.pid

serverpid() {
  if [ -f $PID_FILE ]; then
    if [ "$SYSTEM" = "Cygwin" ]; then
      PID=`cat $PID_FILE`
      if [ "x"$PID != "x" ]; then
        if [ -n "`ps | grep $PID`" ]; then
          cat $PID_FILE
          return
        fi
      fi
    else
      if [ "$SYSTEM" = "Solaris" ]; then
        if [ -n "`cat $PID_FILE | xargs ps -p | tail +2`" ]; then
          cat $PID_FILE
          return
        fi
      else
        if [ -n "`cat $PID_FILE | xargs ps | tail -n +2`" ]; then
          cat $PID_FILE
          return
        fi
      fi
    fi
  fi
  echo -n 0
}

echoresult() {
  echo -n " "
  $MOVE_TO_COL
  echo -n "[  "
  echo -n $1
  echo "  ]"
  shift
  if [ "$#" != "0" ] ; then echo "$1" ; fi
}

case "$1" in

##start## 
  'start')
    cd $DAEMONPATH
    echo -n "Starting : $NAME"
    if [ "`serverpid`" != "0" ]; then
      echoresult FAILED "An instance of the $DESC is already running"
      exit 1
    fi
    java -Dsun.net.inetaddr.ttl=0 -jar $DAEMON > log/cardserv-sysout.log 2>&1 &
    echo $! > $PID_FILE
    sleep 3
    ERR=`cat log/cardserv-sysout.log | grep '[Ee]rror\|[Ee]xception\|[Ff]ailed\|not found'`
    if [ "$ERR" ]; then
      echoresult FAILED
      echo `cat log/cardserv-sysout.log`
      OP=`serverpid`
      if [ $OP != "0" ]; then        
        kill $OP              
      fi
      rm $PID_FILE
      exit
    else
      echoresult OK
    fi
  ;;

##stop##
  'stop')
    cd $DAEMONPATH
	echo -n "Stopping : $NAME"
    OP=`serverpid`
    if [ $OP != "0" ]; then
      rm $PID_FILE
      kill $OP
      echoresult OK
    else
      echoresult FAILED "Cannot determine pid"
    fi
  ;;

##restart## 
	'restart')
	echo -n "restarting : $DESC" 
        echo -n "
" 
        $0 'stop' && sleep 3 && $0 'start'
  ;; 

##dump##
  'dump')
    echo -n "Sending SIGQUIT:"
    OP=`serverpid`
    if [ $OP != "0" ]; then
      kill -3 $OP
      echoresult OK
    else
      echoresult FAILED "Cannot determine pid"
    fi
  ;;

##status##
  'status')
    OP=`serverpid`
    if [ $OP = "0" ]; then
      echo "$NAME is stopped"
      exit 1
    else
      echo "$NAME (pid $OP) is running..."
      exit 0
    fi
  ;;

  *)
    echo "Usage: $0 {start|stop|restart|status|dump}"
    exit 1
  ;;

esac

exit $?





