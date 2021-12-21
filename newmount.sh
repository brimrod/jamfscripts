#!/bin/sh

USER="$(stat -f%Su /dev/console)"

SERVER=$4
SHARE=$5
PROTOCOL=smb
STRING='"'$PROTOCOL://$SERVER/$SHARE'"' 

sleep 10s

sudo -u $USER


if /sbin/ping -q -c 1 $SERVER &> /dev/null
then
echo "Share host $SERVER is responding. Mounting share...";
#
#
# Mount share:
/usr/bin/osascript -e "try" -e "mount volume $STRING" -e "end try"
#
exit 0
else
echo "Timeout. File Server $SERVER is unreachable."
exit 1
fi
