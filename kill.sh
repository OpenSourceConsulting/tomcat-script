#!/bin/bash
. ./env.sh

ps -ef | grep java | grep "server=$SERVER_NAME" | awk {'print "kill -9 " $2'} | sh -x
