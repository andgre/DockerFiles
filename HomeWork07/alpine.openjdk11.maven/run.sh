#!/bin/sh
while true
do
    for f in `find /opt/myapp/ -name "*.war"`; do mv $f /opt/war/; sleep 30 ;done
#	echo "Press [CTRL+C] to stop.."    sleep 1
done
