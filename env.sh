#!/bin/bash
#************************ Warning **********************************
#*                                                                 *
#* This configuration is property of OPEN SOURCE CONSULTING, INC.  *
#* Don't distribute this to other project.                         *
#*                                                                 *
#* Contact jchoi@osci.kr(http://www.osci.kr)                       *
#*******************************************************************

# This is tomcat env.sh for iosp by Open Source Consulting, Inc

## Set Tomcat base env
export JAVA_HOME=/opt/jdk1.6
export SERVER_NAME=tomcat7
export CATALINA_HOME=/opt/jboss-ews-2.0/tomcat7
export CATALINA_BASE=/sec/servers/$SERVER_NAME
export PORT_OFFSET=100
export COMP_USER=jboss

## Set Port Configuration
#########################################
#  Default Ports are as below      	#
#  HTTP_PORT : 8080			#
#  SSL_PORT : 8443			#
#  SHUTDOWN_PORT : 8005			#
#########################################
export HTTP_PORT=$(expr 8080 + $PORT_OFFSET)
export AJP_PORT=$(expr 8009 + $PORT_OFFSET)
export SSL_PORT=$(expr 8443 + $PORT_OFFSET)
export SHUTDOWN_PORT=$(expr 8005 + $PORT_OFFSET)

if [ "x$JAVA_OPTS" = "x" ]; then
   JAVA_OPTS="-server"
   JAVA_OPTS="$JAVA_OPTS -Dserver=$SERVER_NAME"
   JAVA_OPTS="$JAVA_OPTS -Dhttp.port=$HTTP_PORT"
   JAVA_OPTS="$JAVA_OPTS -Dajp.port=$AJP_PORT"
   JAVA_OPTS="$JAVA_OPTS -Dssl.port=$SSL_PORT"
   JAVA_OPTS="$JAVA_OPTS -Dshutdown.port=$SHUTDOWN_PORT"
   JAVA_OPTS="$JAVA_OPTS -Djava.library.path=/opt/jboss-ews-2.0/tomcat7/lib/"

#   JAVA_OPTS="$JAVA_OPTS -noverify"
   JAVA_OPTS="$JAVA_OPTS -Xms512m"
   JAVA_OPTS="$JAVA_OPTS -Xmx512m"
   JAVA_OPTS="$JAVA_OPTS -XX:PermSize=256m"
   JAVA_OPTS="$JAVA_OPTS -XX:MaxPermSize=256m"
#   JAVA_OPTS="$JAVA_OPTS -Xss128k"

#   JAVA_OPTS="$JAVA_OPTS -verbose:gc"
   JAVA_OPTS="$JAVA_OPTS -Xloggc:$CATALINA_BASE/logs/gc.log"
   JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCDetails"
   JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCTimeStamps"
#   JAVA_OPTS="$JAVA_OPTS -XX:+PrintHeapAtGC"
   JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError"
   JAVA_OPTS="$JAVA_OPTS -XX:HeapDumpPath=$CATALINA_BASE/logs/java_pid.hprof"

   JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote"
   JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.port=8086"
   JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.ssl=false"
   JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"

   JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true"
   JAVA_OPTS="$JAVA_OPTS -Dsun.rmi.dgc.client.gcInterval=3600000"
   JAVA_OPTS="$JAVA_OPTS -Dsun.rmi.dgc.server.gcInterval=3600000"
   JAVA_OPTS="$JAVA_OPTS -Dsun.lang.ClassLoader.allowArraySyntax=true "
fi

export JAVA_OPTS


echo "================================================"
echo "CATALINA_HOME=$CATALINA_HOME"
echo "SERVER_HOME=$CATALINA_BASE"
echo "HTTP_PORT=$HTTP_PORT"
echo "SSL_PORT=$SSL_PORT"
echo "AJP_PORT=$AJP_PORT"
echo "SHUTDOWN_PORT=$SHUTDOWN_PORT"
echo "================================================"
©¬