#!/bin/bash
. ./env.sh

DATE=`date +%Y%m%d%H%M%S`

# ------------------------------------
PID=`ps -ef | grep java | grep "=$SERVER_NAME" | awk '{print $2}'`
echo $PID

if [ e$PID != "e" ]
then
echo "Tomcat ($SERVER_NAME) is already RUNNING..."
exit;
fi
# ------------------------------------
UNAME=`id -u -n`
if [ e$UNAME != "e$COMP_USER" ]
then
echo "$COMP_USER USER to start this SERVER! - $SERVER_NAME..."
exit;
fi
# ------------------------------------
#!/bin/bash

if [ ! -d $CATALINA_BASE/temp ]
then
echo "temp directory is not exist. create temp directory."
mkdir -p $CATALINA_BASE/temp
fi

# ------------------------------------
mv $CATALINA_BASE/logs/$SERVER_NAME.out $CATALINA_BASE/logs/$SERVER_NAME.$DATE
mv $CATALINA_BASE/logs/gc.log $CATALINA_BASE/logs/gc.log.$DATE

nohup $CATALINA_HOME/bin/catalina.sh run >> $CATALINA_BASE/logs/$SERVER_NAME.out 2>&1 &

# ------------------------------------
if [ e$1 = "enotail" ]
then
echo "Starting... $SERVER_NAME"
exit;
fi
# ------------------------------------
$CATALINA_BASE/bin/tail.sh
