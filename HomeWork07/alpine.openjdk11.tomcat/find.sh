#!/bin/sh
while true
do
    for f in `find /opt/war/ -name "*.war"`; do mv $f /opt/tomcat/webapps/; sleep 30 ;done
#	echo "Press [CTRL+C] to stop.."    sleep 1
done
