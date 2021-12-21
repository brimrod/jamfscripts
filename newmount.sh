#!/bin/sh

USER="$(stat -f%Su /dev/console)"

SERVER=kucfs.home.ku.edu
SHARE=SOM_General/Groups

sudo -u $USER

if /sbin/ping -q -c 1 $SERVER &> /dev/null
then
echo "Share host $SERVER is responding. Mounting share...";
#
#
# Mount share:
/usr/bin/osascript -e "try" -e "mount volume \"smb://$SERVER/$SHARE\"" -e "end try"
#
exit 0
else
echo "Timeout. File Server $SERVER is unreachable."
exit 1
fi
