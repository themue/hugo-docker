#!/bin/sh
nginx > /dev/null 2> /dev/null
while true
do
	/bin/sh /hugo/pull.sh &
	sleep 300
done
# EOF
