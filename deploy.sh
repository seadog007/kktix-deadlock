#!/bin/bash

[ -z "$1" ] || [ -z "$2" ] && echo -e '----------------------------KKTIX-deadlock----------------------------\nA small tool that automatically create bunch of deadlock(? on a KKTIX event.\nWell, basically it blocks tickets.\n\nUsage:\n\n\t./deploy.sh <Event name> <How many ticket you want to block>\n\nExample:\n\n\t./deploy.sh test-123 100' && exit 1

limit=100
c=0
eventname=$1

for c in `seq 1 $2`
do
	set -- "$line"
	IFS="@"; declare -a Array=($*)
	until [ `jobs | wc -l | sed 's/ //g'` -lt $limit ]
	do
		sleep 0.2
	done
	./phantomjs one.js $eventname $c &
done

