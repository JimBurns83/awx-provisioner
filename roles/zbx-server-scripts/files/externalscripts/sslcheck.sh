#!/bin/bash
dt="$(echo | (openssl s_client -servername $1 -connect $1:443 2> /dev/null |  openssl x509 -noout -enddate | cut -d'=' -f2))"
fd="$(echo | date -d "$(echo $dt)" --iso-8601)"
xd="$(echo | date -d $(echo $fd) +%s)"
now="$(echo |date +%s)"
diff=`expr $xd - $now`
if [ "$diff" -ge 0 ]; then
echo $diff
else
echo 0
fi

